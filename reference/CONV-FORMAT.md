# Conv record, RESUME-STATE, and DECISIONS entry formats

## Conv record — `docs/convs/YYYY-MM/YYYYMMDD_HHMM Conv NNN.md`

Written at `/r-end`. Written once, never edited (one narrow exception: an appended, dated `## Erratum`
correcting a checkable statement of fact — never a revision in place). Sections omitted when empty,
except `## Work`, which is never omitted (`_Nothing closed._` if so).

```markdown
# Conv NNN — <short title>
**Machine:** <machine> · **Date:** YYYY-MM-DD

## Work
- [CODE] — outcome (done / deleted / promoted / re-scoped): what shipped against which gate.
- **Untasked:** investigations, corrected claims, rule changes — anything real that had no row.

## Progress
Prose a future conv needs to understand this one without reading the diff. Not a changelog.

## Decisions
- DEC-NNN-N — one line each. Full records live in DECISIONS.md.

## Learnings
- **Context / Learning / Pattern.** A learning that is really an always-on rule goes in CLAUDE.md instead.

## Carried findings
One line: count + "see RESUME-STATE.md". Omit if none.
```

🔴 **Never assert an outcome for a step that runs after this one** (the push, the next open). Say "not
yet run" and let the next conv record the result.

## Dialogue companion — `docs/convs/YYYY-MM/YYYYMMDD_HHMM Conv NNN — dialogue.md`

The operator's half of the conversation, **verbatim**. Captured live by the `capture-turn.sh`
UserPromptSubmit hook into the untracked `.conv-turns.jsonl`; rendered and drained here at `/r-end`,
after which the `.jsonl` is deleted. Written once (erratum-append only, like the conv record). The
`## Progress` summary interprets; this preserves the actual words that shaped the conv.

```markdown
# Conv NNN — dialogue capture (operator's half, verbatim)
**Machine:** <machine> · **Date:** YYYY-MM-DD

Companion to the Conv NNN record. The operator's own messages, verbatim and in order.

### Turn 1 — <short label>
> <operator prompt, verbatim including typos>

_→ one-line note of what it produced (added at /r-end; interpretive, optional)._
```

🔴 Verbatim means verbatim — typos included, nothing silently cleaned. Render only turns the hook
captured for **this** conv (`.text` where `.conv` matches); lifecycle slash-commands may be dropped or
collapsed. Omit the companion entirely if no turns were captured.

## RESUME-STATE.md — overwritten at every `/r-end`

Holds only what the *next* conv needs — not an archive. Anything durable belongs in the conv record,
`DECISIONS.md`, or the board.

```markdown
**Conv:** ended · **Machine:** <machine> · **Branch:** docs: `main`, code: `main`

## Where we left off
Two or three sentences.

## Next action
One thing, with the reason.

## 🔬 Carried findings
- Findings thrown off by the closing procedure, to be ruled at the next /r-start. `_None._` if empty.
```

🔴 **No push-status field** — the push is a later step; `/r-start` reports ahead/behind from a fetch
(evidence), not self-report.

## DECISIONS.md entry

Newest-first. IDs never reused or renumbered.

```markdown
### DEC-NNN-N — <title>
**Decision:** what was settled.
**Rationale:** why this and not the alternative — name the alternative that lost.
**Consequences:** what it now forces or forbids. Omit when genuinely none.
```

Tombstone (supersession): `### DEC-NNN-N — ⛔ superseded by \`DEC-MMM-M\`` and nothing else.
