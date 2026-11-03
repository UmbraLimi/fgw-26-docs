# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop) before `/r-end`. The
durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] **Frame for readers WHY the "The record" meta-analysis is possible** (operator, Conv 021). The case-study audits exist only because of the method: a separate docs repo + tooling/skills that treat decisions, learnings, documentation, tasks and plans as a vital part of building — without them there is no way to identify which decisions (good or bad) a project made. Turn-capture lets us find where things went right and wrong, and the AI reuses that documented record so it doesn't repeat poor decisions. It also makes the work fully transparent: the client always has access to all repos used in a project. Candidate homes: Work section intro, the Method page, and/or a shared framing line above each "The record". Decide placement during the case pass. Likely feeds [SITE-NARRATIVE] / [SITE-CONSISTENCY].
- [ ] **`this-site` open items from the case pass** (Conv 021, carried by operator): (a) its diagram `this-site.svg` is a generic MOCK placeholder shown with the "Sample diagram" caption — same mock status on `redline`, `translation-platform`, `learning-marketplace` (only fps has a real one); decide whether to draw real per-case diagrams. (b) On the site's own case the sidebar shows both the grey "Mockup" box and the sample diagram — consider `hideMockup:true` here as fps did. Record staleness is separately tracked under `[CASE-RECORD-REFRESH]`.
- [ ] `check-ab-options.sh` over-enforces the A/B rule: it fires on any `👉👉👉` block with no labelled options, but per operator (Conv 021) open-ended questions are legitimate and need no A/B — labelled options are required only when the ask itself offers options (an "or" fork). The hook should allow a bare open-ended `👉👉👉` question. (Also consider reconciling CLAUDE.md's "every question … carries labelled options" wording with this.)

