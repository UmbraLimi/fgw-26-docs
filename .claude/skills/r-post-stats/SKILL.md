---
name: r-post-stats
description: Print a per-channel summary of all social posts (LinkedIn, X, …) with the stats we track, newest first — a read-only render of the numbers stored in each post dossier's `stats:` frontmatter. Fast, no browser. Run it anytime to see current standings. To update the numbers from live first, run /r-post-stats-refresh. Never commits, pushes, or touches the conv marker.
---

# Social-post stats summary

Render one **table per channel** of every published social post, **newest first**, from the **stored**
numbers. This skill is **read-only and offline**: it prints what each dossier's `stats:` block currently
holds (as of that post's `last_read`). It does **not** go live — to refresh the numbers first, run
`/r-post-stats-refresh`.

🔴 **Source of truth = the `stats:` frontmatter block** in each `docs/content/posts/<slug>.md`. This skill
never edits it. If a dossier has no `stats:` block, list it under "Missing stats" (Step 4) — don't invent
numbers.

## Step 1 — Collect the posts
Read every `docs/content/posts/*.md`. From each frontmatter take: `channel`, `slug`, `published`,
`post_url`, and the `stats:` block. **Skip** any file whose `status:` is not `published` (drafts/approved).
Also take the post's **opening** — the first prose line of the `## Final copy` section, trimmed to ~120
chars (add `…` if cut), with any `|` escaped as `\|` so it is table-safe.

## Step 2 — Group + sort
Group by `channel`. Within each channel sort by `published` **descending** (newest first).

## Step 3 — Build one table per channel (TWO rows per post)
Each post is **two rows** so the wide text never squeezes the numbers:
- **Row 1 — two equal columns:** left = the post (slug + link) and its **Opening**; right = our **Read**.
- **Row 2 — the stats:** `Published` + the channel's numeric columns + `Status`.

🔴 Markdown can't place a 2-column row above an 8-column row, so write each channel's table as a small
**HTML `<table>`** (renders cleanly in any Markdown viewer). The stat-column header row appears **once** at
the top; then every post contributes its two `<tr>` rows, posts in **descending `published`** order.

Stat columns (Row 2), both channels are 8 wide → Row 1 is `colspan="4"` + `colspan="4"` (two equal halves):
- **LinkedIn:** Published · Impr · Reached · Reactions · Comments · Reshares · Clicks · Status
- **X:** Published · Views · Likes · Reposts · Bookmarks · Replies · Clicks · Status

🔵 **Each post is its own `<tbody>`** holding its two `<tr>` rows. That lets the CSS (Step 4) stripe
alternate posts with a light-blue background **and** draw a divider line between posts — so each post-pair
is held together by two cues (colour + a bounding line), legible even without colour.

Rows (inside each post's `<tbody>`):
```html
<tbody>  <!-- one post -->
  <tr class="meta">
    <td class="open" colspan="4"><span class="slug"><a href="POST_URL">slug</a></span> — "OPENING"</td>
    <td class="read" colspan="4"><em>Read:</em> READ</td>
  </tr>
  <tr class="nums">
    <td>PUBLISHED</td><td>…six stat values…</td><td>STATUS</td>
  </tr>
</tbody>
```

Cell rules:
- **slug** linked to `post_url` if present; **OPENING** = the post's first line (Step 1), quoted.
- **STATUS** = `active (due <stats.due>)` or `settled (<stats.last_read>)`.
- **READ** = `stats.read`, trimmed.
- Missing numeric → `—`. `Clicks` may be `n/s` (not surfaced) or `n/a` (linkless).
- A future channel (Substack, YouTube, …) gets its own `<table>` with that channel's stat columns; keep
  the same two-rows-per-post shape (Row 1 split into two equal halves).

## Step 4 — Write one `.html` report per channel into `.scratch/`
For each channel, write a **self-contained HTML file** (inline `<style>`, no external deps — it must render
standalone in a browser) at `.scratch/<channel>_<date>.html` (channel lowercased; e.g.
`.scratch/linkedin_2026-11-26.html`, `.scratch/x_2026-11-26.html`). **`<date>` = the most recent `last_read`
among that channel's posts** (the data's freshness, not today's render date; a re-render of unchanged data
overwrites the same file).

Use this exact document shell (swap the `<title>`, `<h1>`, meta line, `<thead>` stat columns, and the
per-post `<tbody>` blocks from Step 3):
```html
<!doctype html>
<html lang="en"><head><meta charset="utf-8">
<title><Channel> — post stats (<date>)</title>
<style>
  :root{--tint:#eaf3fc;--line:#cfd8e3;--ink:#1a2330;--muted:#5a6675;--head:#eef1f5;--link:#0b5bd3}
  body{font:14px/1.45 -apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;color:var(--ink);margin:24px}
  h1{font-size:18px;margin:0 0 2px} .meta-line{color:var(--muted);font-size:12px;margin:0 0 16px}
  table{border-collapse:collapse;width:100%;max-width:1100px}
  thead th{background:var(--head);text-align:center;font:600 12px/1 inherit;text-transform:uppercase;
    letter-spacing:.02em;padding:9px 10px;border-bottom:2px solid var(--line)}
  thead th:first-child,thead th:last-child{text-align:left}
  tbody{border-top:2px solid var(--line)}            /* divider between posts (non-colour cue) */
  tbody:nth-of-type(odd){background:var(--tint)}      /* light-blue stripe per post-pair */
  td{padding:8px 10px;vertical-align:top}
  tr.meta td.open .slug{font-weight:700} tr.meta td.open .slug a{color:var(--link);text-decoration:none}
  tr.meta td.read{color:var(--muted)}
  tr.nums td{text-align:center;font-variant-numeric:tabular-nums}
  tr.nums td:first-child,tr.nums td:last-child{text-align:left;color:var(--muted)}  /* Published, Status */
</style></head><body>
<h1><Channel> — post stats</h1>
<p class="meta-line">Data as of last_read <date> · generated <today> · source: docs/content/posts/*.md
  <code>stats:</code> blocks · refresh: /r-post-stats-refresh</p>
<table>
  <thead><tr><th>Published</th><!-- six stat cols --><th>Status</th></tr></thead>
  <!-- one <tbody> per post (Step 3), descending published -->
</table>
<p style="margin-top:16px;font-size:13px"><strong>Inbound:</strong> <verbatim inbound, newest first, or "No inbound logged."></p>
</body></html>
```

🔴 `.scratch/` is the right home — these reports are **disposable views** regenerable anytime from the
`stats:` blocks (the durable source). Never the sole copy of anything (`CLAUDE.md`).

## Step 5 — Report back
Print, in chat: the paths of the `.html` files written (full absolute paths) and a one-line-per-post
plain-text summary (so the operator sees the standings without opening a browser). End with **Missing
stats:** any published post with no `stats:` block (→ run `/r-post-stats-refresh`), or `None.`

## Schema — the `stats:` block (both skills read/write this)
Latest-snapshot numbers only (the time-series narrative stays in the dossier's `## Outcomes`). Fields:

```yaml
stats:
  last_read: 2026-11-26      # date of the reading these numbers came from
  day: 3                     # whole days post-publish at last_read
  status: active             # active | settled
  due: 2026-12-07            # final-read due date (omit once settled); horizon per _cc/content-analytics.md
  # --- LinkedIn fields ---
  impressions: 66
  reached: 38                # members reached
  reactions: 1
  comments: 0
  reshares: 0
  clicks: n/s                # number | n/s (not surfaced) | n/a (linkless)
  # --- X fields ---
  views: 26
  likes: 0
  reposts: 0
  bookmarks: 0
  replies: 1
  # --- both ---
  read: slow steady growth; engagement flat   # one-line qualitative read — NUMBER-FREE (numbers live in the fields above)
```

Emit only the channel's own numeric fields (LinkedIn block vs X block); `last_read`/`day`/`status`/`due`/
`read` are common. Horizons + capture-set definition: `_cc/content-analytics.md`.

## Notes
- **Read-only.** No commit, no push, no conv marker. Rendering costs nothing; run it as often as asked.
- Freshness comes from `/r-post-stats-refresh` (or the `[CONTENT-ANALYTICS]` sweep), which writes `stats:`.
- The `_cc/content-analytics.md` rollup table is the human-maintained narrative log; **this skill's tables
  are generated from `stats:` each run** and are the canonical at-a-glance view.
