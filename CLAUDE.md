# CLAUDE.md — fgw project home (fgw-26-docs)

Rules for Claude Code working the **fgw** project — the new frasergorrie.com (2026). Three repos:
`fgw-26-docs` (this repo — project home: docs, decisions, `.claude/`), `fgw-26` (the website code),
`frasergorrie` (the **legacy** site — read-only reference, never committed by us). Map: `_cc/repo-layout.md`.

**This file holds rules only.** Every rule should be actionable on its own line. The *why* lives in
`DECISIONS.md` under the cited `DEC-NNN-N`; supporting detail goes in a topic note under `_cc/`.

🔴 **Keep this file and the whole process lean (`DEC-000-7`).** The sibling projects' methodology
over-grew and needed hard rollbacks (SPT cut its CLAUDE.md 96%; its harness out-committed its product
22:2). Process is a cost, not a virtue. Prune when this file passes ~120 lines. Before adding a rule,
say what job it does.

## Repos & paths
- **`fgw-26-docs`** = project home (CC launched here) · **`fgw-26`** = the website · **`frasergorrie`** = legacy, reference only.
- **Use tilde-literal paths in Bash/backticks; `git -C <repo>`, never bare git.**
- The lifecycle commits/pushes **`fgw-26-docs` and `fgw-26`** only. 🔴 **Never commit or push `frasergorrie`** — it is reference.

## Permissions & mode
- **Start with NO deny rules and NO allow/auto-accept rules** beyond the inherited `AskUserQuestion` deny; build them as need arises. User runs **auto-mode** most of the time.
- **`AskUserQuestion` is disabled — never call it.** Verbose/Explanatory output OFF; match response length to the question.

## Claims & verification
- 🔴 **Label every claim I have not verified** — guess, inference, or read-off-an-artifact. Unlabelled must mean "I checked this, this conv." (`DEC-000-5` keeps the record; this keeps it honest.)
- 🔴 **Every claim carries its source inline: `[checked: <file/command>]` · `[inferred]` · `[assumed]`.** The tag describes the claim *as stated* — a generalisation drawn from a verified fact is `[inferred]`.
- **Verify a premise against its consumers, not its definition.** What a thing is *for* is answered by what reads it — not its name, doc, or comment.
- 🔴 **Verify in the running product, not just in tests (`DEC-000-7`).** Green ≠ proven; a guard that has never caught anything is unproven however green it looks. (Both are sibling-project scars.)
- 🔴 **Cite a stable handle — `DEC-NNN-N`, a heading — never a line number, in any file that grows.**

## Interaction model
- **Default is normal conversation.** No mandatory per-turn ceremony.
- **Decisions → A/B.** A question with more than one outcome gets labelled options `A)` / `B)` (ASCII), the letter being the answer. Default terse; add Pros/Cons/Recommendation only for an involved fork. Show a multi-question set, ask one at a time.
- 👉👉👉 **Every question carries `👉👉👉`, and its question block ends the turn — the `👉👉👉` anchor heads the block, the labelled `A)`/`B)` options follow it, nothing after (`DEC-002-1`).** A scrollback anchor, not emphasis. Do independent work first, then ask, then stop.
- 🔴 **A question is not a directive, and neither is confusion.** "I'm confused" / "explain X" / any question = I explain and do **NOT** act until you direct. I may *suggest* the next action; I never perform it.
- 🔴 **Execute an imperative that names its target; answer a hortative about direction.** "Remove X" names what — I do it. "Let's finish building" names a direction — I say what it would involve, and stop. Ambiguous → treat as hortative and ask.
- 🔴 **A false antecedent voids the instruction.** "If X, then Y" where X turns out false does not authorize Y. Report what X is, and ask.

## When to ask vs. proceed
- **Options are cheap and welcome; when in doubt, ask.** Present them for anything load-bearing, hard to reverse, or genuinely novel. For a small, reversible call, pick the durable-leaning option, proceed, and note the alternative in one line.
- **Default to durable** over quick — the sibling-project discipline (overrides the AI's "simplest thing" default) — but weigh it against the lean-process rule: durable ≠ elaborate.

## Investigative requests
- audit / review / investigate / examine / assess / measure / compare → surface findings as a per-item disposition list **first**, then ask, then execute.
- 🔴 **Inside investigative work I report observations and stop.** No "therefore", no volunteered recommendation — you draw the inference. Ask "what do you make of it?" and I answer fully.

## Surfacing & guards
- **Never say "flag"** — it sounds like surfacing while routing nowhere. Name where the finding went: **hopper** (`HOPPER.md`), **a board row** (`CURRENT-TASKS.md`), **surfaced inline — disposition: X**, or **no action, visible only**. If I can't name the route, the routing decision hasn't been made.
- **"Stale / pre-existing / out-of-scope / I'll handle it at /r-end" are no-op promises** — treat all as signals I am about to drop something, and route it instead.

## Conv lifecycle
- Work happens in numbered convs. `CONV-COUNTER` (git-synced) + `.conv-current` (untracked, machine-local). **`/r-start`** opens · **`/r-commit`** saves mid-conv (my standing right, no permission) · **`/r-hopper`** rules the hopper · **`/r-end`** closes + pushes (**needs explicit approval**).
- ⚠️ Never run a lifecycle skill from a second terminal on the same checkout.
- **A skill's body in my context is a snapshot.** After editing a `SKILL.md` or after any pull, re-read it from disk before relying on a later step.

## Tasks & hopper
- **`CURRENT-TASKS.md`** is the board — one file, sections 🔥 Ordered / 📋 Unordered / ⏸️ Parked / ✅ Completed this conv (`DEC-000-4`; split into two files only if it earns it). `[CODE]` handles are readable + hyphenated.
- **`HOPPER.md`** is the hopper, not the board. Something surfaced mid-work I'm not stopping to do goes there as a `- [ ]` line **immediately** — convenience capture, subject to your scrutiny. Ruled via `/r-hopper` before `/r-end`.
- 🔴 **Never rule a hopper item alone** — every disposition (promote / do-now / drop) is your call. Dealing with an item and deleting its line are one act.

## Decisions & learnings — keep recording
- 🔴 **Every decision → `DECISIONS.md` as `DEC-NNN-N`** (`DEC-000-5`), design and process alike, newest-first. `Decision:` / `Rationale:` (name the alternative that lost) / `Consequences:`. Learnings + narrative → the per-conv record in `docs/convs/`, at `/r-end`.
- 🔴 **Tombstone what you supersede — never delete it.** An overtaken decision keeps its entry, re-headed `### DEC-NNN-N — ⛔ superseded by \`DEC-NNN-N\`` and holding nothing else, so every handle ever issued still resolves.
- 🔎 **Scanning for precedent → load `DECISIONS-DIGEST.md` first** (generated, drift-proof), find candidate `DEC-NNN-N`, then open those in `DECISIONS.md`. Never hand-edit the digest; `/r-end` regenerates it.
- **Design change is expected.** An earlier decision carries no special standing; a proposal never has to justify itself against what it would overtake.

## Scratch & commits
- `.scratch/` (gitignored) is free, non-durable workspace. 🔴 Nothing durable lives there alone — lost on a fresh checkout.
- Commit via `/r-commit` or `/r-end` only; stage CC-authored paths **by name, never `git add -A`**. Format: `reference/COMMIT-MESSAGE-FORMAT.md` (`fgw-1`). `/r-end` is the only thing that pushes.
- **Every comment I write or modify carries the active conv number.** Comments are presumed stale until verified.
