**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 046 was a **governance + tooling** conv, opened mid-stream after a product question. Two things
shipped, both in `fgw-26-docs` only (the website + content guides were untouched): (1) the **reference-repo
trust-prompt fix** (`DEC-046-2`) — `fg`/`frasergorrie` moved from the `fgw` alias's `--add-dir` flags to
`permissions.additionalDirectories`, to stop the per-folder workspace-trust prompt CC **v2.1.325** added to
`--add-dir`; the alias is now `--add-dir ../fgw-26` only; and (2) the **routing-guard** work (`DEC-046-1`,
refines `DEC-008-2`) — a strengthened CLAUDE.md Surfacing rule plus a new `check-routing.sh` Stop hook that
blocks a turn using disposition vocabulary with no pending board/hopper edit. `[GUIDE-PLANNING]` was promoted
from the hopper. The **Steering guide and all content work sit exactly where Conv 045 left them** — still
`draft:true`/dark, **prose not approved**.

## Next action

🔴 **Return to the standing priority: the Steering redline.** Resume at the H2 **"Does steering it well mean
I don't need anyone?"** — the operator floated tightening it to **"…anyone's help?"**; settle that first.
Then the still-pending **conjunction + metaphor voice audits**, the **Deciding** rigorous redline (incl. the
carried "honest" reword), images (`[CONTENT-ART]`), and a real first article. 🔧 Regenerate the coordinate
view before redlining by P#: `node scripts/number-content.mjs
src/content/guides/steer-ai-to-build-what-you-mean.md > ~/projects/fgw-26-docs/.scratch/steering-view.txt`
(run from `~/projects/fgw-26`). At next **launch**, also clear the two Conv-046 hopper verifications (the
trust-prompt fix and that `check-routing.sh` actually fires). `[GOOGLE-SERVICES]` cadence ~Conv 47;
`[AGENT-DISCOVERY-WATCH]` ~Conv 55. Prod deploys stay banned (`[PROD-DEPLOY-BAN]`).

⚠️ **Human carry-over (still open):** operator to **send Gabriel the LinkedIn recommendation request**
(note + draft in `_cc/linkedin-makeover.md`).

## 🔬 Carried findings

- **Dialogue capture bled across convs.** `.conv-turns.jsonl` held **60 undrained Conv-045 turns** at the
  Conv-046 close — Conv 045's `/r-end` drain (`rm -f`) evidently never ran. Drained during this close (045
  already has its companion, so nothing lost). Rule next `/r-start`: does the `/r-end` drain step or the
  capture hook need hardening so one conv's turns can't ride into the next?
- **Pre-`/r-start` turns are never captured.** `capture-turn.sh` keys on `.conv-current`, which doesn't
  exist until a conv opens, so a conv opened mid-stream (as 046 was) has **no verbatim record** of its
  richest exchanges (here: the folder-trust question and the whole routing-rule discussion). Decide whether
  work done before opening a conv should be capturable, or whether `/r-start` should come first by rule.
  ✔ **ruled (Conv 047):** drop — operator's call is to stay vigilant to always run `/r-start` first; no tooling change.
