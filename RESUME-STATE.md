**Conv:** 050 closed (normal `/r-end`) · **Machine:** MacMiniM4Pro · **Branches:** docs `main`, code `main`

## Where we left off

Conv 050 opened by **verifying the Conv-049 `/rfe` force-end** — it worked end-to-end (clean `/r-start`,
no HALT, no work lost, conv history saved, pushed clean); the one gap was a degraded-context handoff
error ("Deciding untouched" when the arc-A rewrite had in fact been committed), now corrected. Paid the
deferred debt (distilled `DEC-049-1..4` + digest). Then two process changes: **GSC cadence → every-9**
(`DEC-050-1`; next check Conv 59) and, the main thread, a **new content-creation method** (`DEC-050-2`):
after the first draft CC generates the **coordinate view** (`.scratch/<guide>-view.txt`) + a **point-form
skeleton** (`.scratch/<guide>-points.txt`) that *mirrors the draft and invents nothing*; the **operator
augments** it with the experience-side bits (CC's own suggestions go in `[square brackets]`); CC then
writes the **second draft** from the result. This keeps the final voice the operator's.

## Next action

🔴 **Deciding is first through the new method, mid-cycle.** `deciding-view.txt` + a faithful
`deciding-points.txt` are done (the operator's bullet format, his P2 verbatim, one `[CC Q]` on the P2
capacity axis). **Ball is with the operator: augment `deciding-points.txt`** — add his bits (unbracketed),
keep/cut the `[CC Q]` — **then CC writes the Deciding second draft** from the augmented notes, and only
then the `GUIDE-REVIEW` finalize pass (steps 2–15). The `[GUIDE-DECIDING]` row holds the full state
(arc A, matrix working-spec, checklist with step 1 done).

## Board

🔥 Ordered: **`[DOSSIER-FORMAT]`** (codify the richer graduated-dossier format — wanted before Deciding
graduates) · **`[GUIDE-DECIDING]`** (mid-cycle, above) · `[GOOGLE-SERVICES]` (standing GSC monitor, next
Conv 59) · `[POSTING-PLAN]`. Plus the 📋 Unordered backlog (security hardening, structured-data, content-art,
pillar roadmap/diagram, `[AGENT-INITIATIVE]` → revisit Conv 55). Hopper: **1 carried** (3-cornerstone
interlink, gated on Deciding finishing) — run `/r-hopper` offered at `/r-start`.

## Cadence (next due)
- `[GOOGLE-SERVICES]` — Conv 59 (changed to every-9 this conv, `DEC-050-1`).
- `[AGENT-DISCOVERY-WATCH]` — Conv 55.

## 🔬 Carried findings

- **Go-list routing hook false-fires on ordinary content.** This conv the `check-routing.sh` nudge tripped
  three times on plain guide copy — **"raised"** (×2, "AI raised the floor") and **"flagged"** (×1, "the bit
  you flagged") — none a real routing claim. Candidate: retire "raised"/"flagged" from the go-list, or add a
  content-context exception. CLAUDE.md calls the go-list "a living list, tuned over time." Ruling deferred to
  the operator at next `/r-start`. (Thrown off by Conv 050's closing/drafting work.)
  ✔ **ruled (Conv 051): do-now — option A, retired `raised`/`raising` + `flagged`/`flagging` from the go-list**
  (grep in `check-routing.sh` + the go-list line in `CLAUDE.md`; go-list now 5 forms).
