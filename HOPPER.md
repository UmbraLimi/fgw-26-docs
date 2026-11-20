# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop / carry) before `/r-end`.
The durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] **🔬 VERIFY the Conv-049 `/rfe` force-end worked (first-ever live run — do at Conv 050 `/r-start`).** This item IS the test's success criteria; walk it top-to-bottom in 050:
  - [ ] `/r-start` opened 050 **normally** — down the `absent + CLOSED` path, **no HALT, no resume** (the single most important signal; the whole point of the skill).
  - [ ] `conv-state.sh` reports 049 **CLOSED** (heartbeat found + `Type: end-of-conv` seen).
  - [ ] The 049 closing commit in `fgw-26-docs` carries **both** markers: the `⚠️ FORCE-END (screen garble)` subject **and** the `Type: end-of-conv` trailer (`git -C ~/projects/fgw-26-docs log -2`).
  - [ ] **No work lost** — that commit contains the 049 work (the two skill files, `HOPPER.md`, any other); working tree was clean after.
  - [ ] **Push outcome (the trial question):** did `git push` run clean, or prompt / stay local? If `/r-start` showed `ahead > 0`, it stayed local — push both repos now (expected, handled).
  - [ ] `RESUME-STATE.md` carried the **garble banner** + the "do-first-next-conv" block (push + distill) + a real handoff (not a stub).
  - [ ] Hopper carried all prior items **unruled** + the `/rfe` **summary item** was appended.
  - [ ] A **conv-record stub** for 049 exists, marked force-end.
  - [ ] `.conv-current` was removed (no stale-marker warning at 050 start).
  - [ ] **Pay the deferred debt:** distill 049's decisions into `DECISIONS.md` (incl. the `/r-force-end` mechanism DEC) + regenerate the digest; rule this conv's hopper normally.
  - [ ] Record the verdict: did `/rfe` work end-to-end? Note any gap for a skill fix, then delete this item. (Conv 049, /rfe first-run test.)
- [ ] **`/r-force-end` (`/rfe`) — live trial + two open checks before relying on it blind.** Built Conv 049. The auto-mode push-prompt risk is now **handled by design** (commits land locally first; a blocked/prompted push is a documented outcome — RESUME-STATE + hopper say "push next conv," and `/r-start` catches `ahead > 0`), so no allowlist is needed. Remaining: (1) a **watched trial run** to observe whether `git push` actually prompts under the operator's auto-mode (informational, not blocking); (2) confirm **`/rfe` actually resolves as a slash command** — a brand-new skill may not register until the session rescans/reloads, so verify before trusting it in a real garble. (Conv 049, /r-force-end build.)
- [ ] **Interlink the 3 cornerstone guides (Trust / Steering / Deciding) — after Deciding is finished.** A deliberate cross-link pass across all three once the Deciding redline is done: verify each guide points to its siblings where the content invites it (Steering already links Trust + Deciding at its close; Trust and Deciding need their reciprocal links checked/added). Fold in the `[GUIDE-PLANNING]` on-ship forward-link from Steering's planning paragraph. Hub-and-spoke completeness. (Conv 047, operator)
- [ ] **Conv 049 force-ended (screen garble) — NOT a normal close.** Summary: 049 resumed from a garble-death, then pivoted to build `/r-force-end` (`/rfe`); this close is that skill's first live test. The Deciding guide redline (`[GUIDE-DECIDING]` step 1) was pre-empted and is untouched. 🔴 Next conv: push if `ahead > 0`; **distill Conv 049 decisions** into DECISIONS.md + regen digest (force-end deferred them — raw material in RESUME-STATE); walk the verify-checklist above; resume at `[GUIDE-DECIDING]` step 1. (Conv 049, /r-force-end.)
