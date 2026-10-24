---
name: r-commit
description: Mid-conv save — commit CC-authored changes in fgw-26-docs and fgw-26 (staged by name, never git add -A) in the fgw-1 format under the current conv number, skipping any repo with nothing to commit. Never pushes, never touches frasergorrie.
argument-hint: ""
allowed-tools: Bash, Read, Glob, Edit
---

# Mid-conv save

**Autonomous and unconditional — including the decision to run it.** No approval, no confirmation, no
threshold. Claude runs it whenever it wants; when the user types it, that is a save point — asking
again is friction.

🔴 **A commit message must never assert settlement the work does not have.** Mid-investigation or
about-to-be-revised work may be committed — the subject must say so.

🔴 **Stage CC-authored paths by name in `fgw-26-docs` and `fgw-26` — never `git add -A`, never
`frasergorrie`.** Read `git status` and stage only what CC changed this conv.

**Never pushes.** `/r-end` is the only thing that pushes. **Format:** `reference/COMMIT-MESSAGE-FORMAT.md`.

## Pre-computed context

**Conv number:**
!`cat ~/projects/fgw-26-docs/.conv-current 2>/dev/null | grep . || cat ~/projects/fgw-26-docs/CONV-COUNTER 2>/dev/null | grep . || echo "(none)"`

**Conv state:**
!`sh ~/projects/fgw-26-docs/.claude/scripts/conv-state.sh`

**What changed:**
!`for entry in "fgw-26-docs:$HOME/projects/fgw-26-docs" "fgw-26:$HOME/projects/fgw-26"; do label="${entry%%:*}"; dir="${entry#*:}"; echo "--- $label ---"; git -C "$dir" status --short 2>/dev/null | grep . || echo "(clean)"; done`

---

## Step 1 — Guard

From the block: `.conv-current` present + state `OPEN` → proceed using `.conv-current`'s number.
- state `CLOSED` (marker absent) → 🔴 HALT: no conv open, run `/r-start`.
- state `OPEN`, marker absent → 🔴 HALT: marker lost; re-run `/r-start` (resume path), then `/r-commit`.
- marker present, state `CLOSED` → 🟠 stale marker; delete it, run `/r-start`.
- `.conv-current` and `CONV-COUNTER` disagree → 🔴 HALT, report both, never pick one.
- Machine `(unknown)` → 🔴 HALT (required trailer; see `/r-start` Step 1).
- No CC-authored change in either repo → report "nothing to commit" and stop. (Not an error.)

## Step 2 — Read the diff before writing anything

🔴 **Author every bullet from the actual diff, not from memory.** Run `git -C <repo> diff HEAD` (+
`status --short` for untracked) for `fgw-26-docs` and `fgw-26`. A conv drifts — the diff is the only
account that cannot be wrong. Untracked files count; `git diff HEAD` does not show them.

## Step 3 — Compose one message per repo

Per `reference/COMMIT-MESSAGE-FORMAT.md`. Subject `Conv NNN: imperative`, under 72 chars. Only H3
sections with content. Apply the `### Doc Changes` exclusion list (no bullet whose only content is
`RESUME-STATE.md` / `CURRENT-TASKS.md` / `HOPPER.md` / `CONV-COUNTER` / `docs/convs/**`). **Omit
`Type:`** — that trailer is the `/r-end` commit's only. Trailers: `Conv:` · `Machine:` · `Format: fgw-1`,
blank line, then `Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>`.

## Step 4 — Stage by name, then commit

For `fgw-26-docs` then `fgw-26`, skipping any with no CC change:
```
git -C <repo> add <path> [<path> ...]   # named paths only — NEVER add -A
git -C <repo> commit -F <message-file>
```
Write the message to a scratchpad file and commit with `-F` (blank-line placement matters; `-m`
chaining mangles it). **Do not push.** 🔴 Never `frasergorrie`.

## Step 5 — Report

One line per repo: `<repo> <short-sha> — <subject>`, or `<repo> — clean, skipped`. Then conv number
+ machine. Keep it to a few lines; a save point needs no narration.
