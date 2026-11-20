**Conv:** FORCE-ENDED (screen-garble emergency close) · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

⚠️ **FORCE-ENDED Conv 049 — screen garble.** NOT a normal /r-end. Handoff written from live context at
force-end. 🔴 Decisions were NOT distilled and the hopper was NOT ruled — both deferred to next conv.

🔴 **DO FIRST, next conv (before anything else):**
1. If `/r-start` reports `ahead > 0`, the force-end commit is **unpushed** — push both repos now.
2. **Distill Conv 049's decisions** into `DECISIONS.md` + regenerate the digest (force-end deferred them;
   the raw material is the "Decisions made this conv" section below).
3. **Walk the `🔬 VERIFY the Conv-049 /rfe force-end worked` hopper item** (item #1) — this close was the
   first-ever live run of `/rfe`; that checklist is its pass/fail test. Record the verdict.
4. Then resume the real board work: **`[GUIDE-DECIDING]` step 1** (see below).

## Where we left off

Conv 049 was itself a **resume** (the previous session died to the same screen-garble, leaving 049
`present + OPEN`, so this morning's `/r-start` hit the resume-HALT). This conv then pivoted entirely to a
new tool: **built `/r-force-end` (alias `/rfe`)** — a one-command, blind-typeable emergency conv close for
exactly this garble situation (it happens ~3×/month). This very close is its **first live test**, driven
by the hopper verify-checklist. The original board work — the **Deciding cornerstone guide** redline — was
pre-empted and is untouched this conv.

## Next action

🔴 After the DO-FIRST block above: **`[GUIDE-DECIDING]` step 1** — the coordinate-view redline reconciling
the existing Deciding draft body to the approved **arc A** (the 2×2-test spine; whole-draft-first per the
updated `GUIDE-REVIEW` step 1), folding in the carried **"honest/honestly" reword** (~3 uses; VOICE bans
it). The `[GUIDE-DECIDING]` board row holds the full take, approved arc, matrix working-spec, and checklist.

## Decisions made this conv (for 050 distillation — raw, not yet in DECISIONS.md)

1. **Built `/r-force-end` (`/rfe`) — screen-garble emergency conv close.** *Rationale:* garble forces a quit
   ~3×/month; `/r-commit` saves files but by rule never touches `RESUME-STATE.md`, and only `/r-end` writes
   the handoff — but it needs approval + interactive hopper-ruling, impossible blind. A deterministic,
   blind-typeable command fills the gap. *Alternative rejected:* free-text "ensure continuity" typed blind
   (unreliable — depends on a possibly-degrading session parsing prose; this was the actual Conv-048→049
   failure).
2. **Force-end design.** No approval gate (invocation = authorization). Commits locally **first**;
   best-effort push with **no allowlist** — a prompted/blocked push is a *handled* outcome (local commit +
   "push next conv" in handoff + `/r-start` `ahead > 0` catch). Defers decision-distillation **and**
   hopper-ruling to next conv (no eyes to do either). *Alternative rejected:* a narrow git-command allowlist
   (operator: commits staying local is fine, next conv pushes — simpler than deviating from "no allow rules").
3. **Dual commit markers.** The force-end closing commit carries **both** a loud `⚠️ FORCE-END (screen
   garble)` subject (for conscious rollback-point / timecard reads — must be distinguishable from a normal
   close) **and** the `Type: end-of-conv` trailer (load-bearing: `conv-state.sh` greps `^Type: end-of-conv$`
   to read CLOSED; without it the next `/r-start` HALTs). Step 5a self-checks `CLOSED` before removing the
   marker. *Verified against the consumer:* `conv-state.sh` keys CLOSED **only** off that trailer, not the
   subject — so a loud subject is safe.
4. **`/rfe` alias = thin redirect.** `/rfe` (three blind letters) is a logic-free skill that reads+follows
   `r-force-end/SKILL.md`; full logic lives once in `r-force-end`. *Alternative rejected:* duplicating the
   body in both (drift). Both skills registered **immediately this session** (no reload needed).

(Earlier this conv, pre-pivot, commit `89045ac` already landed: the `[GUIDE-DECIDING]` dossier scaffold with
**arc A chosen**, the `COLOPHON.md` image-source expansion (Bloch pike lead for Deciding), and the
`GUIDE-CREATE`/`GUIDE-REVIEW` process-rigor edits — those are committed, decisions on them also want
distilling.)

## 🔬 Carried findings

_None._
