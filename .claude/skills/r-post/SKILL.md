---
name: r-post
description: Start a new social post. Scaffold a per-post dossier board row for a LinkedIn or X post and generate its channel-tagged create + finalize checklist, built LIVE from reference/POST-CREATE.md + reference/POST-REVIEW.md so it always reflects the latest process. The post analog of r-content. Never commits, pushes, or touches the conv marker.
---

# Start a new social post

Scaffold a new **social post** (LinkedIn | X; the channel set grows — Substack, YouTube Shorts, …) and
generate its **channel-tagged checklist** — an ordered board row built LIVE from the current reference
docs, so it always reflects the latest process.

🔴 **Derive the steps from the docs at run time — never hardcode them here.** Read the ordered steps out
of `reference/POST-CREATE.md` (creation) and `reference/POST-REVIEW.md` (finalize) each time this runs,
and emit only the steps whose channel tag matches this post's channel (`[all]` + the chosen channel). This
skill must not carry its own copy of the steps — a copy would drift.

## Step 1 — Gather the post's identity
Take from the operator (ask for whatever's missing, one at a time): **channel** (LinkedIn | X | …),
**pillar** (trust | steering | deciding | …), **slug**, **angle** (the buyer-chord in one line), and the
**link target** (the live guide / `/guides/` hub / site) the post points to. The pipeline **`track`** is
derived from the channel (X → `x`, LinkedIn → `linkedin`). Note whether the post **originates from a
backlog idea** in `_cc/content-backlog.md` — if so, that row is removed in Step 5 (it is graduating to a
dossier).

## Step 2 — Read the current process docs
Read, in full (the current versions — that's what keeps the checklist up to date):
- `reference/POST-CREATE.md` — the creation pass.
- `reference/POST-REVIEW.md` — the finalize pass.

Drafting references to consult (named, not copied): `PERSONA.md`, `VOICE.md`, `CHANNELS.md`.

## Step 3 — Generate the post dossier (a board row)
The row is the post's **dossier** — a lightweight checklist + metadata; the **prose lives in the post file**
(Step 4), not inline here. Add it to `CURRENT-TASKS.md` (🔥 Ordered or 📋 Unordered — operator's call), keyed
`[POST-<slug>]`:
- a title line `### [POST-<slug>] · added Conv NNN · <channel> · <title/angle>`;
- **Channel + pillar + link target**;
- **Prose** — a pointer to `docs/content/posts/<slug>.md` (created Step 4);
- **Angle** — the buyer-chord in one line (grows as drawn out);
- **Checklist** — one `- [ ]` line per step, in order: `POST-CREATE.md` creation → `POST-REVIEW.md`
  finalize — **emitting only the steps tagged `[all]` or this post's channel**, each naming the step + its
  doc handle;
- **Decisions** — post-specific calls accrue here (not `DECISIONS.md`, which is project/process only);
- **Published** — a line to fill with status + date when it ships.

🔴 The checklist is a **snapshot of the docs as they are now**; a later `/r-post` reflects doc changes, an
already-created row does not auto-update. Record each step's outcome on its line as you go.

## Step 4 — Create the post file
Create `docs/content/posts/<slug>.md` in **fgw-26-docs** (`POST-CREATE.md` step 4). **Frontmatter — the
full pipeline shape** (so `/r-content-pipeline` + `/r-post-stats` never meet a missing-fields item):
`slug`, `type: post`, `track` (`x` | `linkedin` | …, derived from the channel), `channel`, `pillar`,
`status: draft` (`# draft | approved | published`), `link_target`, `created`, empty `published:`, empty
`post_url:`, and a **`stats:` stub** (the per-post snapshot block; schema lives in `/r-post-stats`).
🔴 **The `stats:` values are filled at PUBLISH, not now** — `/r-post-stats` **skips** any post whose
`status:` ≠ `published`, so a draft only needs the stub placeholder. At publish, set `status: active`
and `due` = `published` + the channel horizon (LinkedIn ~pub + 14d · X ~pub + 48h,
`_cc/content-analytics.md`). Then a **Draft** body + an **Outcomes** section stub (capture set in
`_cc/content-analytics.md`). This is the post's durable prose home; the board row points to it.

## Step 5 — Backlog reconcile + report
🔴 **If this post graduated from a backlog idea, delete that idea's row** from `_cc/content-backlog.md`
now — its state has moved into the dossier (single-source; the backlog holds only the `backlog` ideas
tier, never drafts/published). A fresh post with no backlog row removes nothing. Then report: the new
`[POST-<slug>]` row + the post file + where they landed, and the **first checklist step** as the
recommended next action.

---
- **Not a lifecycle skill.** Never commits, pushes, or touches the conv marker — it only scaffolds a post
  and its checklist. Commit via `/r-commit` / `/r-end`.
- **The board row is the post's dossier.** At publish it **graduates** to `docs/content/posts/<slug>.md`
  (`POST-REVIEW.md` final gate) and the board row retires — the post analog of `/r-content`'s dossier.
