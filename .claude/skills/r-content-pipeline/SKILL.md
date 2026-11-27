---
name: r-content-pipeline
description: Show the content pipeline across all writing — posts (X, LinkedIn), guides, and articles — grouped by state (backlog → drafting → review → approved → published → settled). Read-only. Merges the backlog ideas (_cc/content-backlog.md) with each dossier's status: frontmatter. Also answers filtered queries like "the next N ideas for <track>" or "the pipeline for <track>". Never commits, pushes, or touches the conv marker.
---

# Content pipeline

Render the whole content pipeline, or a filtered slice, from the two sources that hold state:
- **`backlog` (ideas)** → rows in `_cc/content-backlog.md`, grouped by track, **top = next up** (priority = list order).
- **`drafting` → `settled`** → each dossier's `status:` frontmatter in `docs/content/**/*.md`.

🔴 **Read-only.** Never edit a dossier, the backlog, or anything else. Advancing an item's state is the
job of `/r-content` / `/r-post` (graduate an idea → `drafting`) or `/r-post-stats-refresh` (settle a post);
this skill only reports.

## The model
- **Tracks:** `x` · `linkedin` · `guide` · `article`.
- **States (left → right):** `backlog → drafting → review → approved → published → settled`.
  Posts use all of it (`approved` = pre-publish gate; `settled` = past tracking horizon). Guides/articles use
  `backlog → drafting → review → published` and stay evergreen (no `approved`/`settled`).
- **Shaping (`backlog` has two tiers):** ideas enter **unshaped** (`## 🧩 Unshaped` in the backlog file —
  no track, no order); their track(s), primary, order, and angle are decided **in discussion with the
  operator**, then they move into a track's ordered list (**shaped**). This skill reports unshaped ideas
  separately and **never assigns a track itself**.
- **Fields read from dossier frontmatter:** `type`, `track`, `status`, `pillar`, `slug`, `published` (and
  `due`/`channel`/`post_url` where present).

## Step 1 — Gather
- **Unshaped ideas:** rows under `## 🧩 Unshaped` are raw ideas awaiting a shaping discussion — **no track,
  no order**. Count + list them under their own heading; they are NOT in any track's ordered list and never
  appear in a "next N for `<track>`" answer.
- **Shaped ideas:** rows under each `## <Track>` heading are `backlog` items for that track, in listed order
  (position = priority). Capture track + the idea's title/one-line + pillar.
- **Dossiers:** read frontmatter of every `docs/content/**/*.md`. Capture `type`, `track`, `status`,
  `pillar`, `slug`, `published`. Skip files with no frontmatter or `status` (not yet in the pipeline).

## Step 2 — Decide the view (from how it was invoked)
- **Default (no filter):** the whole pipeline.
- **"next N ideas for <track>":** only that track's `backlog` rows, top N (by list order). Fastest query.
- **"pipeline for <track>":** only that track, all states.
- **"<state>" named:** only items in that state.

## Step 3 — Render
Group by **state** (backlog → drafting → review → approved → published → settled); within a state, order
backlog by priority, others by `published` desc (then slug). One compact line per item:

`<track> · <pillar> · <title-or-slug> · <published or "due <due>" or "idea">`

- Omit any state with no items (say `— none` only if the whole pipeline is empty).
- For a **"next N ideas for <track>"** query, just list those N rows (numbered), nothing else.
- A one-line **counts** header is handy: `backlog N · drafting N · review N · approved N · published N · settled N`.

## Step 4 — Report
Print the view in chat (this is a working board, not a kept artifact — no file written unless asked). If a
named track has an empty backlog, say so plainly ("no X ideas captured yet") rather than returning nothing.

## Notes
- **Source of truth:** backlog file for `backlog`; dossier `status:` for everything after. One place per state,
  no duplication.
- Read-only; no commit/push/conv-marker. Schema + states also in `_cc/content-analytics.md` / this file.
- An idea **graduates** out of `content-backlog.md` into a dossier when `/r-content` or `/r-post` starts it;
  from then on the pipeline sources it from the dossier.
