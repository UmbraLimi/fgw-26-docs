---
name: r-post-stats-refresh
description: Refresh the stored social-post stats from live — drive Chrome (operator's logged-in session) to re-read each non-settled post's current X / LinkedIn numbers, write them into the dossier `stats:` blocks, then regenerate the per-channel .html reports. The live updater behind /r-post-stats. Reads metrics only (never posts, likes, or comments). Writes only local dossier files + .scratch reports. Never commits, pushes, or touches the conv marker.
---

# Refresh social-post stats (live)

Re-read every **non-settled** post's current numbers from X / LinkedIn via the Chrome bridge (operator's
session; standing authorization, `CLAUDE.md` §Tooling), write them into each dossier's `stats:` block, then
regenerate the `.html` reports so `/r-post-stats` output is current.

🔴 **Read-only on the web.** Navigate + read metrics only. **Never** like, repost, comment, follow, or post.
🔴 **Writes = local only:** the `stats:` blocks in `docs/content/posts/*.md` and the `.scratch/*.html`
reports. No commit, no push, no conv marker.

## Step 0 — Preconditions
Chrome open + logged in to X and LinkedIn (operator keeps them in separate tabs). If the bridge is logged
out, the extension sign-in has lapsed — ask the operator to re-sign-in (`CLAUDE.md` §Tooling); don't retry
blindly or treat it as a code fault. Load the Chrome tools in one `ToolSearch` call if they're deferred.

## Step 1 — Pick the posts to refresh
Read every `docs/content/posts/*.md` with `status: published`. Refresh those whose `stats.status` is
`active` **or** that have **no `stats:` block**. **Skip `settled`** posts (final numbers are frozen) —
unless the operator named a slug or said "all". List what you'll refresh (slug · channel · last_read)
before driving the browser.

## Step 2 — Read each post's live numbers (per channel)
Work in **one dedicated MCP tab** (create it; close it at the end). For each post, from its `post_url`:

**X** — navigate to the status URL and read, off the post:
- Views · Likes · Reposts · Bookmarks · Replies.
- Use `get_page_text` + a screenshot to confirm the counts. A metric with no number shown = `0`.

**LinkedIn** — the numbers live in **two places**:
- **Reactions · Comments · Reshares** — on the post (`post_url`, the feed permalink).
- **Impressions · Members reached** — on the **post-analytics** page:
  `https://www.linkedin.com/analytics/post-summary/<URN>/`, where `<URN>` is the `urn:li:activity:…` found
  in `post_url`. (Impressions also appears on the post; **members-reached is analytics-only**.)
- **Clicks** — record `n/s` (LinkedIn doesn't surface link clicks for these posts) unless a clicks figure
  is actually shown.

🔴 Read the numbers **off the screen**; never infer or carry a stale figure forward. If a value genuinely
isn't shown, record `—` (missing), not a guess. Pace navigations; don't hammer.

## Step 3 — Write each dossier's `stats:` block
For each refreshed post, update its frontmatter `stats:` block (schema: the `/r-post-stats` skill):
- the channel's numeric fields (from Step 2);
- `last_read:` = today;
- `day:` = whole days from `published` to today;
- `status:` / `due:` — keep `active` here (settling is Step 4);
- `read:` — a **number-free** one-line qualitative note (the numbers live in the fields above, so the read
  never goes stale — never embed a count, impression figure, or day index in it). Keep the existing read
  unless the trajectory clearly shifted; tighten the wording if it did. If the post had **no** `stats:`
  block, create one with a terse qualitative read (e.g. "quiet; views climbing" / "landing well"). The
  dated, numeric history stays in `## Outcomes` (the sweep's job).

🔴 Do **not** rewrite the `## Outcomes` narrative here — that dated-read history is the sweep's job. This
skill keeps the machine-readable snapshot current; the sweep keeps the story.

## Step 4 — Horizon check (settle past-due posts)
For each refreshed post where **today ≥ `stats.due`**: its tracking window has closed, so this reading is
the final one. **Surface it** ("`<slug>` is past its `<due>` horizon — settle?") and only on the operator's
yes set `status: settled` and drop `due` (the sweep writes the final `## Outcomes` read). **Never
auto-settle silently** — settling freezes the post.

## Step 5 — Regenerate the reports + report back
Run the `/r-post-stats` render so the `.scratch/*.html` reports reflect the new numbers (a changed
`last_read` may change a filename). Then print, in chat:
- each refreshed post with its **before → after** deltas (per tracked metric);
- any post awaiting a settle ruling (Step 4);
- the report file paths (full absolute paths).
Close the MCP tab.

## Notes
- Freshness source: the live platforms via the operator's session. **Truth lands in the `stats:` blocks**;
  the `.html` reports are regenerated views.
- Read-only on the web; local-only on writes; no commit/push/conv-marker.
- Capture set + horizons: `_cc/content-analytics.md`. `stats:` field list: `/r-post-stats`.
