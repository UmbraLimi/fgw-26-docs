---
name: r-force-end
description: Emergency conv close for a garbled/unusable screen — commit all CC work + write the handoff + carry the hopper + close the conv, running straight through with no approval gate and no interactive step. A degraded-mode /r-end: it does NOT rule the hopper and does NOT distill decisions (both deferred to next conv via RESUME-STATE + a hopper item). Blind-typeable alias: /rfe.
argument-hint: ""
allowed-tools: Bash, Read, Edit, Write
---

# Force-end a conv (screen-garble emergency close)

🔴 **This is the emergency path, not a normal close.** Its job: when the operator's screen garbles
mid-conv (happens ~3×/month) and they must quit, let them type one blind command (`/rfe`) that saves
everything, writes a continuity handoff, and closes the conv **cleanly** — so the next `/r-start` opens
the next conv down the normal `absent + CLOSED` path, with **no HALT and no resume**. Contrast: a hard
quit with no force-end leaves the conv `present + OPEN`, which forces the resume-HALT at next `/r-start`.

🔴 **No approval gate. The invocation IS the authorization.** The operator typed it blind on purpose —
never ask to confirm, never pause for a decision, never wait for input. Run every step straight through.
Like `/r-end`, do not invoke this on your own initiative — it is the operator's blind command. Unlike
`/r-end`, it never distills decisions and never rules the hopper (it has no eyes to do either).

🔴 **Execute every step; a half-run force-end is worse than none** (it writes artifacts that make the
conv look handled). If a step genuinely cannot complete, say so in the report and continue.

**Formats:** `reference/CONV-FORMAT.md` · `reference/COMMIT-MESSAGE-FORMAT.md`.

## Pre-computed context

**Conv number (marker):** !`cat ~/projects/fgw-26-docs/.conv-current 2>/dev/null | grep . || echo "(absent)"`
**Conv state:** !`sh ~/projects/fgw-26-docs/.claude/scripts/conv-state.sh`
**Now (for the record filename):** !`date '+%Y-%m %Y%m%d_%H%M'`
**Uncommitted now:**
!`for entry in "fgw-26-docs:$HOME/projects/fgw-26-docs" "fgw-26:$HOME/projects/fgw-26"; do label="${entry%%:*}"; dir="${entry#*:}"; echo "--- $label ---"; git -C "$dir" status --short 2>/dev/null | grep . || echo "(clean)"; done`
**Open hopper items (to carry):**
!`grep -n '^- \[ \]' ~/projects/fgw-26-docs/HOPPER.md 2>/dev/null | grep . || echo "(none)"`

---

## Step 0 — Guard (lean; this is the degraded path, not a pedantic one)

From the block: **marker absent** → there is no conv open on this machine. Report "no open conv marker —
nothing to force-end" and stop (do not fabricate a close). **Marker present** → proceed under that number
**N**; that is the one number to use everywhere. Do **not** HALT on a state oddity the way `/r-end` does —
force-end exists precisely for a degraded moment. If `.conv-current` and `CONV-COUNTER` disagree, use
`.conv-current` (it answers "open on THIS machine") and note the disagreement in the report. Machine name
missing → still proceed; note it (a blind operator cannot fix a hostname pattern mid-garble).

## Step 1 — Write `RESUME-STATE.md` (the continuity handoff + the garble record)

Overwrite it, per `reference/CONV-FORMAT.md`, from your **live context** (the garble hit the operator's
screen, not your context — so write a real handoff, not a stub). Open with this banner block, verbatim
shape, then the normal handoff sections beneath it:

```
⚠️ **FORCE-ENDED Conv N — screen garble.** NOT a normal /r-end. Handoff written from live context at
force-end. 🔴 Decisions were NOT distilled and the hopper was NOT ruled — both deferred to this conv.

🔴 **DO FIRST, next conv (before anything else):**
1. If `/r-start` reports `ahead > 0`, the force-end commit is **unpushed** — push both repos now.
2. **Distill Conv N's decisions** into `DECISIONS.md` + regenerate the digest (force-end deferred them).
3. Then resume the normal next action below.
```

Beneath the banner: **Where we left off** (2–4 sentences), **Next action** (the real one), **board**
state, any live caveats — exactly what a normal `RESUME-STATE.md` carries. 🔴 Read the *outgoing*
`RESUME-STATE.md` first if you need its carried-findings section (`git -C ~/projects/fgw-26-docs show
HEAD:RESUME-STATE.md`); re-carry any unruled `## 🔬 Carried findings` bullets into the new file.

## Step 2 — Carry the hopper + append the force-end summary item

🔴 **Carry, never rule.** Leave every existing open `- [ ]` item exactly in place (ruling needs the
operator's eyes, which are gone). Then **append one new item** under `## Open` summarizing this close:

```
- [ ] **Conv N force-ended (screen garble) — NOT a normal close.** Summary: <2–3 lines: where the work
  stood, what was mid-flight>. 🔴 Next conv: push if `ahead > 0`; **distill Conv N decisions** into
  DECISIONS.md + regen digest (force-end deferred them); resume at <next action>. (Conv N, /r-force-end.)
```

## Step 3 — Stub conv record

Write `docs/convs/<YYYY-MM>/<YYYYMMDD_HHMM> Conv NNN.md` (from the **Now** value above), per
`reference/CONV-FORMAT.md` but abbreviated. 🔴 `## Work` is never omitted. Mark it a **force-end close**
in the heading/opening line and note that decisions were deferred (not distilled) and the hopper was
carried unruled. Write once; do not edit later.

**Dialogue companion:** best-effort. If `~/projects/fgw-26-docs/.conv-turns.jsonl` holds lines for conv N,
render the companion and drain **only** this conv's lines exactly as `/r-end` Step 3 does (never
`rm -f` the whole file). If this fails or you skip it, that is safe: the undrained turns become orphans
that the next `/r-end` Step 3 detects and recovers — note the deferral in the hopper item.

## Step 4 — Commit everything (both repos), with BOTH markers

Author work bullets from the actual diff (`git -C <repo> diff HEAD` + `status --short` for untracked),
applying the `### Doc Changes` exclusion list (no bullet whose only content is `RESUME-STATE.md` /
`CURRENT-TASKS.md` / `HOPPER.md` / `CONV-COUNTER` / `docs/convs/**`). For `fgw-26-docs` **then** `fgw-26`,
skipping `fgw-26` only if it has no change (`fgw-26-docs` **always** commits — it holds the artifacts just
written, so the close-trailer always lands where `conv-state.sh` reads it):

🔴 **Stage by name, never `git add -A`, never `frasergorrie`.** In this emergency you are the sole editor
of the whole working tree, so stage every path `git status --short` reports in the two repos **by name**
(this may include untracked CC files — naming them is allowed; the ban is on `-A`).

Subject (under 72 chars) — the loud human marker:
```
Conv NNN: ⚠️ FORCE-END (screen garble) — not a normal close
```
Body: the work `### Section` bullets, then this trailer block — the `Type: end-of-conv` line is
**load-bearing** (`conv-state.sh` greps `^Type: end-of-conv$` to read CLOSED; drop it and the next
`/r-start` HALTs on `OPEN`):
```
Stats: <optional>
Conv: NNN
Machine: <machine>
Type: end-of-conv
Format: fgw-1

Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>
```
Write each message to a scratchpad file; commit with `git -C <repo> commit -F <file>` (blank-line
placement matters).

## Step 5 — 🔴 Self-check the close, then push (best-effort), then remove the marker

**5a — Verify the close landed.** Run `sh ~/projects/fgw-26-docs/.claude/scripts/conv-state.sh`. It MUST
read `CLOSED`. If it still reads `OPEN`, the `Type: end-of-conv` trailer did not land — **do NOT remove
the marker**; report loudly (the conv stays recoverable as `OPEN`; next `/r-start` takes the resume path).
Only on `CLOSED` do 5b and 5c.

**5b — Push, best-effort (never let it block the close).** The commits are already safe locally; push is
only off-machine backup:
```
git -C ~/projects/fgw-26-docs push
git -C ~/projects/fgw-26 push
```
🔴 Push `fgw-26-docs` and `fgw-26` only — **never `frasergorrie`.** If a push prompts, fails, or is
blocked (auto-mode, offline, garble), that is a **handled, documented** outcome — not a failure: the
local commits hold, the RESUME-STATE banner + hopper item already say "push next conv," and the next
`/r-start` reports `ahead > 0`. Report each repo's result (pushed / local-only).

**5c — Remove the marker.** `rm -f ~/projects/fgw-26-docs/.conv-current`. State is `CLOSED` locally, so
remove it whether or not the push succeeded (an `ahead > 0` at next `/r-start` covers propagation).

## Step 6 — Report (terse; the operator may not see it)

One line per repo (`<repo> <sha> — pushed | local-only`), the conv record path, `conv-state.sh` now reads
CLOSED, and a one-line reminder that decisions + hopper-ruling were deferred to next conv. If the screen
is garbled the operator won't read this — the durable truth is in the commit, RESUME-STATE, and hopper.

---

- **Does NOT increment the counter** (`/r-start` owns that) and does NOT rule the hopper or distill
  `DECISIONS.md` (both deferred — captured in RESUME-STATE + the hopper item so nothing is lost).
- **The single load-bearing invariant:** the `fgw-26-docs` closing commit carries `Type: end-of-conv`,
  verified by the Step 5a self-check before the marker is removed. Everything else can degrade; this can't.
