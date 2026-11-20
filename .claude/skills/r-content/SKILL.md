# Start a new content piece

Scaffold a new **guide** or **blog article** and generate its **finalize checklist** — an ordered board
row built LIVE from the current reference docs, so it always reflects the latest process.

🔴 **Derive the steps from the docs at run time — never hardcode them here.** Read the ordered steps out
of `reference/GUIDE-REVIEW.md` and the image workflow out of `reference/COLOPHON.md` each time this runs;
this skill must not carry its own copy of the steps (a copy would drift, and the whole point is that
updating the mds keeps the checklist current).

## Step 1 — Gather the piece's identity

Take from the operator (ask for whatever's missing, one at a time): **type** (guide | article), **title**,
**slug**, **pillar** (trust | steering | deciding). For an article, also the **cornerstone guide** it
spokes to, if known.

## Step 2 — Read the current process docs

Read, in full (the current versions — that's what keeps the checklist up to date), in **lifecycle order**:
- `reference/GUIDE-CREATE.md` — the **creation** pass (slot → take → outline → first draft → coordinate view → point-form skeleton → augment → second draft).
- `reference/COLOPHON.md` — the **image** sourcing + colophon/treatment workflow.
- `reference/GUIDE-REVIEW.md` — the **finalize** pass (the ordered review steps).

Drafting references to consult (named, not copied): `PERSONA.md`, `VOICE.md`, `CHANNELS.md`.

## Step 3 — Generate the piece dossier (a board row)

The row is the piece's **dossier** — its home for *everything* about this piece, not just a checklist.
Add it to `CURRENT-TASKS.md` (🔥 Ordered or 📋 Unordered — operator's call), keyed `[GUIDE-<slug>]`
(guide) or `[WRITING-<slug>]` (article):
- a title line `### [CODE] · added Conv NNN · <title>`;
- **Take** — the thesis / why this piece exists (from Steps 1–2; grows as it's drawn out);
- **Outline** — a pointer to the kept arc outline;
- **Checklist** — **one `- [ ]` line per step, in lifecycle order: `GUIDE-CREATE.md` creation →
  `COLOPHON.md` image → `GUIDE-REVIEW.md` finalize** — each naming the step + its doc handle; guide-only
  steps (glossary, new-pillar setup) marked **N/A** for an article;
- **Decisions** — piece-specific calls accrue here as made, **not** in `DECISIONS.md` (project/process only);
- **Published** — a line to fill with status + date when it ships.

🔴 The checklist is a **snapshot of the docs as they are now**. If the process docs change later, a fresh
`/r-content` reflects it — an already-created row does not auto-update.

## Step 4 — (Optional) stub the content file

If the operator wants it, create the content file with **frontmatter only** in `fgw-26`:
`src/content/guides/<slug>.md` or `src/content/blog/<slug>.md` — title, snippet, pillar, order,
`draft: true` (guides add an empty `glossary`). Body is left for the redline (Step 1 of the checklist).

## Step 5 — Report

The new `[CODE]` row + where it landed; the stubbed file (if any); and the **first checklist step** as the
recommended next action.

---

- **Not a lifecycle skill.** This never commits, pushes, or touches the conv marker — it only scaffolds a
  piece and its checklist. Commit via `/r-commit` / `/r-end` as usual.
- **The board row is the piece's dossier.** Through the piece's life it accrues the take, outline,
  piece-specific decisions, and the publish record. At sign-off (`GUIDE-REVIEW.md` final gate) it
  **graduates** to a permanent record at `docs/content/<slug>.md` (keyed by the piece id), and the board
  row retires — the content-piece analogue of a conv's board row → `docs/convs/` record.
