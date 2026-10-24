---
name: r-end
description: Close a conv — rule the hopper first (or carry it), sweep the board, distill decisions into DECISIONS.md (+ regenerate the digest), write RESUME-STATE.md and the conv record, commit CC-authored changes in fgw-26-docs and fgw-26 (by name, never git add -A), push both, remove the conv marker. Never touches frasergorrie.
argument-hint: ""
allowed-tools: Bash, Read, Edit, Write
---

# Close a conv

🔴 **Never invoke this on your own initiative.** `/r-end` is the user's call, always. Suggesting a
conv looks ready to close is fine; running it unasked is not.

🔴 **Execute every step.** A `/r-end` that stops partway is worse than one that never ran — the
artefacts it wrote make the conv look closed. If a step genuinely cannot complete, say so and continue.

**Formats:** `reference/CONV-FORMAT.md` · `reference/COMMIT-MESSAGE-FORMAT.md`

## Pre-computed context

**Conv number:** !`cat ~/projects/fgw-26-docs/CONV-COUNTER 2>/dev/null | grep . || echo "(missing)"`
**Conv state:** !`sh ~/projects/fgw-26-docs/.claude/scripts/conv-state.sh`
**Uncommitted now:**
!`for entry in "fgw-26-docs:$HOME/projects/fgw-26-docs" "fgw-26:$HOME/projects/fgw-26"; do label="${entry%%:*}"; dir="${entry#*:}"; echo "--- $label ---"; git -C "$dir" status --short 2>/dev/null | grep . || echo "(clean)"; done`

---

## Step 0 — Preflight, then the hopper

**0a — Preflight.** From the state block: marker present + `OPEN` → proceed. marker present + `CLOSED`
→ 🔴 HALT (already closed; delete stale marker, stop). marker absent + `CLOSED` → 🔴 HALT (nothing
open). marker absent + `OPEN` → 🔴 HALT (marker lost; re-run `/r-start`). Disagreement, missing
number, or machine `(unknown)` → 🔴 HALT (see `/r-start` Step 1).

**0b — The hopper check (runs before anything touches a file, and can end the skill).** Read
`HOPPER.md`. 🔴 Any open `- [ ]` item → stop, report the count + a one-line summary each, and offer:
**A)** deal with them now via `/r-hopper`, then re-issue `/r-end` (choosing A **exits immediately** —
nothing written); **B)** carry them past the close (they ride the hopper to next conv's `/r-start`).
Lead with A; B is a real choice. 🔴 **Never rule an item yourself here.** No open items → say so and
proceed. Sweep any stray non-task cruft under `## Open` in passing (never a `- [ ]`/`- [x]`).

## Step 1 — Sweep the board

Update `CURRENT-TASKS.md` to what is now true. Empty `## ✅ Completed this conv` first (it holds only
the conv being closed; `_None yet._` if nothing finished), then move finished rows in with a one-line
"what shipped". Update changed rows in place; re-sequence 🔥 Ordered if the next-conv order changed;
add rows promoted at 0b. Keep each touched row's status current. Preserve the user's manual ordering.

**1b — Currency sweep.** Derive the changed-file list mechanically (not from memory):
```
H=$(git -C ~/projects/fgw-26-docs log --format='%H %s' | grep -m1 '^[0-9a-f]* Conv NNN start — ' | cut -d' ' -f1)
{ git -C ~/projects/fgw-26-docs diff --name-only "$H"; git -C ~/projects/fgw-26-docs ls-files --others --exclude-standard; } | sort -u
```
🔴 No `..HEAD`, and the `ls-files` half is not optional (this runs before Step 6 commits, so the work
is still in the working tree). Run the same against `fgw-26` using the heartbeat's timestamp as
`--since`. Re-read every changed file that makes claims, plus always-swept surfaces (`README.md`,
`CLAUDE.md`, `_cc/*`, `reference/*`), asking only: **did this conv make anything written here
untrue?** Fix in place, naming the conv. A finding too large to fix cheaply → route it to a board row.

## Step 2 — Distill decisions into `DECISIONS.md`

Every decision *settled* this conv → a record `DEC-NNN-<n>` in the order made, **newest-first** in the
file. `Decision:` / `Rationale:` (name the alternative that lost) / `Consequences:`. Only genuine
decisions (something that closed a fork), not preferences stated in passing. 🔴 IDs never reused;
supersede by tombstoning (`### DEC-NNN-N — ⛔ superseded by \`DEC-MMM-M\`` and nothing else).

**2b — Regenerate the digest** (if `DECISIONS.md` changed this conv):
```
sh ~/projects/fgw-26-docs/.claude/scripts/gen-decisions-digest.sh
```
🔴 Read the generator's stderr line — a non-zero EMPTY-gist count means an entry's `Decision:` field
format the parser missed. If `DECISIONS.md` was untouched, skip silently.

## Step 3 — Write the conv record

`docs/convs/YYYY-MM/YYYYMMDD_HHMM Conv NNN.md`, per `reference/CONV-FORMAT.md`. 🔴 `## Work` is never
omitted. Written once, never edited (erratum-append only). 🔴 Never assert an outcome for a later step.

## Step 4 — Carried findings

**4a — Re-carry the unruled.** 🔴 Read the *outgoing* `RESUME-STATE.md` **now, before Step 5
overwrites it.** Every `## 🔬 Carried findings` bullet without a `✔ **ruled:**` prefix → carry it into
the new section, appending `(re-carried from Conv NNN)`. This step moves text; it does not judge.
**4b — Capture findings the *closing procedure* threw off** (a stale ref noticed while writing the
record). Acted on by nothing here — ruled at the next `/r-start`. Write `_None._` if both empty.

## Step 5 — Write `RESUME-STATE.md`

Overwrite it, per `reference/CONV-FORMAT.md`. 🔴 Step 4a must have read the outgoing file first
(recover with `git -C ~/projects/fgw-26-docs show HEAD:RESUME-STATE.md` if unsure). 🔴 No push-status
field (the push is Step 7). Holds only what the next conv needs.

## Step 6 — Commit (end-of-conv)

For `fgw-26-docs` then `fgw-26`, per `reference/COMMIT-MESSAGE-FORMAT.md`, skipping any with no CC
change. 🔴 Stage by name, never `git add -A`, never `frasergorrie`. **`Type: end-of-conv`** trailer on
these commits only (it pairs with the heartbeat to bracket the conv). Apply the Doc Changes exclusion
list. Author bullets from the diff.

## Step 7 — Push, then remove the marker

```
git -C ~/projects/fgw-26-docs push
git -C ~/projects/fgw-26 push
```
🔴 Push `fgw-26-docs` and `fgw-26` only. **Never push `frasergorrie`.** Report each result separately;
a failed push does not stop the other. 🔴 A failed push means this conv is **not backed up to
GitHub** — say so in those words. Then:
```
rm -f ~/projects/fgw-26-docs/.conv-current
```
The marker means "a conv is open on this machine"; once the `end-of-conv` commit exists that is false,
so remove it whether or not every push succeeded (an `ahead > 0` at next `/r-start` covers propagation).

## Step 8 — Report

Conv NNN closed on MACHINE · hopper clear at close · decisions recorded (handles) · board counts ·
commits + push result per repo · conv record path.

## Step 9 — 🔴 Signal completion with `💚💙💜`

Emit `💚💙💜` on its own line as the **very last thing** in the turn — nothing after it. It means
`/r-end` has finished and the session may be cleared. 🔴 Unconditional — emit it even if a step failed
(say what failed in the lines immediately above). Do not use these three hearts anywhere else, ever.

---

- **The conv number does not increment here** — `/r-start` owns that.
- **Nothing is optional-by-omission.** Empty hopper, no decisions, no learnings, no carried findings —
  each stated in one line.
