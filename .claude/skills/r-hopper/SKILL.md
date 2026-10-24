---
name: r-hopper
description: Deal with the hopper — walk each open item in HOPPER.md, rule it with the operator (promote to a board row / do it now / drop), and clear it immediately. Never closes a conv, never commits, never pushes.
argument-hint: ""
allowed-tools: Bash, Read, Edit, Write
---

# Deal with the hopper

Walk `HOPPER.md`: **rule** each open (`- [ ]`) item with the operator and **clear it the moment it is
dealt with** (dealing with an item and disposing of it are one act), and **dispose** of any completed
(`- [x]`) rows or stray non-task lines that reached the hopper from outside this skill.

🔴 **Never rule alone** (`CLAUDE.md` §Tasks). Every disposition is the operator's call. Present the
item and its options; do not pick one to keep moving — that is the exact failure this prevents.

🔴 **This is not a close.** It never touches `RESUME-STATE.md`, the conv record, or commit/push.
Committing is `/r-commit`'s job; closing is `/r-end`'s.

## Pre-computed context

**Hopper items** (scoped to `## Open`):
!`awk '/^## /{o=($0=="## Open")} o&&/^- \[[ x]\]/' ~/projects/fgw-26-docs/HOPPER.md | grep . || echo "(none)"`

**Conv number:**
!`cat ~/projects/fgw-26-docs/.conv-current 2>/dev/null | grep . || cat ~/projects/fgw-26-docs/CONV-COUNTER 2>/dev/null | grep . || echo "(none)"`

---

## Step 1 — Read the hopper

Read `HOPPER.md`. Under `## Open`: **open items** (`- [ ]`, to rule), **completed rows** (`- [x]`,
done outside this skill, to dispose), **stray non-task lines** (prose/cruft, to sweep). None present →
say so in one line and stop.

## Step 2 — Dispose of completed rows + sweep cruft (batch-confirm, then remove)

Present all `- [x]` rows and stray lines as one batch (a one-line summary each, a single confirmation),
then delete the lot. The confirm catches a mis-tick before it is gone. The durable record of what was
done is the conv record + the board — never a line left in the hopper. None → say so, move on.

## Step 3 — Rule each open item, one at a time

🔴 One item, one question, in order. For each `- [ ]`: present what it is, why it was captured, and
what a ruling decides. Then get the call, labelled `A`/`B`/`C`:
- **Promote** → it earns a board row in `CURRENT-TASKS.md`. 🔴 A new task must earn its place —
  significant, or multi-conv. Most items do not; promoting is the exception.
- **Do it now** → do the work this session.
- **Drop** → noise, superseded, or not worth doing.

🔴 The operator will often want a fuller look before ruling. Investigate first, then re-present. Do not
press for a ruling to keep moving.

## Step 4 — Clear the ruled item immediately

As each item is ruled, clear it before moving on — do not tick to `- [x]`, do not defer to `/r-end`:
- **Promote** → write the board row (readable hyphenated `[CODE]`, `promoted Conv NNN`), **then** delete
  the hopper line. 🔴 Row first, then delete — a delete-without-row loses the item.
- **Do it now** → do the work, then delete the line.
- **Drop** → delete the line.

## Step 5 — Report

One line: `Hopper dealt with — X promoted (handles), Y done, Z dropped, W disposed.` Or
`Hopper already clear.`

---

- **Run it whenever** — hopper items are dealt with during the conv, as they come up or at a natural
  break; this skill is how. It is also what the `/r-end` hopper-exit hands back to.
- **Nothing is optional-by-omission.** An empty hopper is stated in one line, not skipped silently.
