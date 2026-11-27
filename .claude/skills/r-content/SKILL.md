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
spokes to, if known. The pipeline **`track`** is derived from the type (guide → `guide`, article →
`article`). Note whether the piece **originates from a backlog idea** in `_cc/content-backlog.md` — if so,
that row is removed in Step 6 (it is graduating to a dossier).

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

🔴 **The row accrues *toward* the graduated-dossier shape** (`GUIDE-REVIEW` step 17's 8-section template,
`DOSSIER-FORMAT`): the Take / Outline / Decisions here, plus the **per-step outcomes the checklist records
during the finalize pass** and the build history, become §1–§8 at graduation — so graduation **reshapes**
this row, it does not rebuild it. Record each step's outcome on its checklist line as you go (that is §5's
raw material).

🔴 The checklist is a **snapshot of the docs as they are now**. If the process docs change later, a fresh
`/r-content` reflects it — an already-created row does not auto-update.

## Step 4 — Create the pipeline dossier stub

Create `docs/content/<slug>.md` in **fgw-26-docs** with **frontmatter only** — the piece's machine-readable
**state beacon** while it drafts, so `/r-content-pipeline` shows it in `drafting` (no gap between backlog and
published):
```yaml
---
slug: <slug>
type: <guide | article>
track: <guide | article>
status: drafting        # backlog | drafting | review | approved | published | settled
pillar: <pillar>
# published:            # filled at graduation
---
```
🔴 **This is the SAME file the piece graduates into** at `GUIDE-REVIEW` step 17 — it is **born here as a
frontmatter stub and accrues**; graduation **fills in** the 8-section body and flips `status:`/`published:`,
it does **not** create a new file. The board row (Step 3) stays the working surface during drafting; this
stub carries only the state. Advance `status:` as the piece moves (→ `review` when it enters the
`GUIDE-REVIEW` finalize pass; → `published` at graduation).

## Step 5 — (Optional) stub the site content file

If the operator wants it, create the **site** content file with **frontmatter only** in `fgw-26`:
`src/content/guides/<slug>.md` or `src/content/blog/<slug>.md` — title, snippet, pillar, order,
`draft: true` (guides add an empty `glossary`). This is the Astro draft the redline fills (distinct from
the Step-4 pipeline dossier in `fgw-26-docs`). Body is left for the redline (Step 1 of the checklist).

## Step 6 — Backlog reconcile + report

🔴 **If this piece graduated from a backlog idea, delete that idea's row** from `_cc/content-backlog.md`
now — its state has moved into the dossier (single-source; the backlog holds only the `backlog` ideas
tier, never drafts/published). A fresh piece with no backlog row removes nothing. Then report: the new
`[CODE]` row + the pipeline dossier stub + where they landed (and the site stub, if made); and the
**first checklist step** as the recommended next action.

---

- **Not a lifecycle skill.** This never commits, pushes, or touches the conv marker — it only scaffolds a
  piece and its checklist. Commit via `/r-commit` / `/r-end` as usual.
- **The board row is the piece's working dossier.** Through the piece's life it accrues the take, outline,
  piece-specific decisions, and the publish record. At sign-off (`GUIDE-REVIEW.md` final gate) it
  **graduates** into the `docs/content/<slug>.md` **stub created in Step 4** (keyed by the piece id) —
  filling its 8-section body and flipping `status:`/`published:`, then the board row retires. The analogue
  of a conv's board row → `docs/convs/` record; the difference is the dossier **file** is born at Step 4
  (as the pipeline state beacon) and fleshed out at graduation, not created from scratch at the end.
