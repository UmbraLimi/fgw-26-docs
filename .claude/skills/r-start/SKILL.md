---
name: r-start
description: Open a conv — check the repos are current (fgw-26-docs, fgw-26), increment CONV-COUNTER, read RESUME-STATE.md + CURRENT-TASKS.md + HOPPER.md, rule any carried findings, commit the start heartbeat, and surface the next action.
argument-hint: ""
allowed-tools: Bash, Read, Edit, Write
---

# Open a conv

Autonomous — no approval needed. One interior stop: if there are carried findings, present them and
wait for the ruling (Step 4). Otherwise run straight through to Step 6 and stop.

**Formats:** `reference/CONV-FORMAT.md` · `reference/COMMIT-MESSAGE-FORMAT.md`

## Pre-computed context

**Machine:**
!`m=$(cat ~/.claude/.machine-name 2>/dev/null); case "$m" in "") echo "(unknown) — file missing or empty";; Unknown*) echo "(unknown) — hook could not map hostname: $m";; *) echo "$m";; esac`

**Current conv counter:**
!`cat ~/projects/fgw-26-docs/CONV-COUNTER 2>/dev/null | grep . || echo "(missing)"`

**Conv state** (prints its own inputs — a state word with no evidence cannot be checked):
!`sh ~/projects/fgw-26-docs/.claude/scripts/conv-state.sh`

**Repo state** (fetches first; a stale local is the failure this catches):
!`for entry in "fgw-26-docs:$HOME/projects/fgw-26-docs" "fgw-26:$HOME/projects/fgw-26"; do label="${entry%%:*}"; dir="${entry#*:}"; if ! git -C "$dir" rev-parse --git-dir >/dev/null 2>&1; then echo "$label | no repo"; continue; fi; b=$(git -C "$dir" rev-parse --abbrev-ref HEAD 2>/dev/null); git -C "$dir" fetch -q 2>/dev/null; c=$(git -C "$dir" rev-list --left-right --count HEAD...origin/$b 2>/dev/null | awk '{print "ahead "$1" · behind "$2}' | grep . || echo "NO UPSTREAM"); d=$(git -C "$dir" status --porcelain 2>/dev/null | wc -l | tr -d ' '); echo "$label | $b | $c | dirty $d"; done`

**Hopper** (open `- [ ]` items carried from last conv):
!`n=$(awk '/^## Open/{f=1;next} /^## /{f=0} f && /^- \[ \]/{c++} END{print c+0}' ~/projects/fgw-26-docs/HOPPER.md 2>/dev/null); if [ "$n" -gt 0 ]; then echo "🔴 $n open — run /r-hopper after this /r-start"; else echo "clear"; fi`

---

## Step 1 — Guard: is a conv already open?

**Two independent signals.** `.conv-current` = "is a conv open on THIS machine?"; the git state =
"did the previous conv close?" Read the pair from the block above.

| `.conv-current` | git state | Action |
|---|---|---|
| absent | `CLOSED` | Proceed — open the next conv. |
| absent | `NO HEARTBEAT` | 🟠 Warn and proceed (expected only at the Conv 000→001 bootstrap). |
| present | `OPEN` | 🔴 HALT. A conv is open (its number is in `.conv-current`). Either `/r-start` ran twice (use `/r-commit`/`/r-end`), or the session died mid-conv (resume under the existing number — re-read `RESUME-STATE.md` + `CURRENT-TASKS.md`, skip Steps 2 & 5). Ask which; do not guess. |
| absent | `OPEN` | 🔴 HALT. Heartbeat unclosed, marker lost. Resume under the existing number (re-read handoff, skip Steps 2 & 5). Do not open a new one over the top. |
| present | `CLOSED` | 🟠 Stale marker (`/r-end` died before removing it). Delete `.conv-current` and proceed. |

🔴 **Never read a state word without the evidence under it.** If the printed heartbeat is not the
commit you expect, the check is wrong, not the repo.

**Machine `(unknown)`** → 🔴 HALT. `file missing or empty` → `echo <name> > ~/.claude/.machine-name`
(once per machine). `hook could not map hostname` → fix the hostname pattern in
`~/.claude/hooks/detect-machine.sh`. The name is a required commit trailer; never guess it.

**Any repo `behind > 0`** → 🟠 pull before proceeding. **Any repo `ahead > 0`** → 🟠 report (committed
but not yet pushed/backed-up; `/r-end` pushes). **Dirty** → report the count; pause only if it looks
like unfinished CC work.

## Step 2 — Increment the counter, mark the conv open

Read `CONV-COUNTER` (the conv just completed), add one, zero-pad to three digits, write it back. Then
write the same value to `~/projects/fgw-26-docs/.conv-current` (untracked marker). Both writes happen
together. Missing counter → 🔴 HALT, never guess. The incremented value is this conv's number — use it
everywhere until `/r-end`.

## Step 3 — Read the handoff

Read, in order: **`RESUME-STATE.md`** (previous conv's narrative handoff — kept, not deleted; only
`/r-end` overwrites it), **`CURRENT-TASKS.md`** (the board), **`HOPPER.md`**. Open hopper items here
are a deliberate carry from last conv — report count + a one-line summary each; do not absorb them
silently.

## Step 4 — 🔴 Rule carried findings (the one interior stop)

`RESUME-STATE.md` may hold a `## 🔬 Carried findings` section. For each: state what it is and what a
ruling decides, then get the call — **promote** to a board row · **do it now** · **drop**. Never rule
alone. Annotate each ruled bullet in place `✔ **ruled:** <disposition>` (the only write `/r-start`
makes to that file). `_None._` or absent → say so in one line. ⚠️ Re-verify before ruling a re-carried
finding. Commit Step 5's heartbeat **before** presenting these, then present Step 4 + Step 6 together.

## Step 5 — Commit the start heartbeat

In **`fgw-26-docs` only**, stage `CONV-COUNTER` **by name** and commit, subject only:
```
Conv NNN start — MACHINE
```
No body, no trailers. 🔴 The subject is load-bearing (`conv-state.sh` matches it). Do not push.

## Step 6 — Surface the next action

Report briefly: **Conv NNN opened** on MACHINE · **where we left off** (2–3 sentences from
`RESUME-STATE.md`) · **the board** (counts + top of 🔥 Ordered) · **recommended next action** (one
thing, with the reason) · **the hopper line verbatim** (if `🔴 N open`, tell the operator to run
`/r-hopper`). Then stop and wait.

**Continuation mode** (default **B — regular ask/respond/wait**): each turn, you give a task/question,
I answer and propose, then stop. I do not chain work across turns on my own. If you want
**A — autonomous-continue** (I act on my recommendation and keep going to a named stop), say so now.
`/r-commit` is my standing right in either mode.

---

- **Nothing is optional-by-omission.** A missing input (no `RESUME-STATE.md`, no carried findings) is
  stated in one line. Silence reads as "checked and fine."
- **Conv 000 was the manual bootstrap** (this infrastructure's setup). The first genuine `/r-start`
  opens Conv 001.
