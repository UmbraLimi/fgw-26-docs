# Guide review — the finalize pass (fgw)

One repeatable pass to take a cornerstone guide (or article) from **body-redlined** to **prose final**.
Codified Conv 047 (`DEC-047-3`) from the Trust-guide precedent — the Conv-040 tone/presentation review +
the Conv-041 rendered read — so each guide's review is identical instead of reconstructed from memory.
**Lean by intent: a checklist, not a gate.** Consult `PERSONA.md`, `VOICE.md`, `CHANNELS.md` first
(CLAUDE.md §References).

Each step: CC does the mechanical part and presents; **the operator rules**. Not every step changes
something — "checked, clean" is a valid outcome, stated (never silently skipped) and recorded in the conv.

## The pass (in order)

**Structure & content**
1. **Coordinate-view redline** — regenerate the `P#S#` view (`node scripts/number-content.mjs <file>`, run
   from `fgw-26`), redline section by section. Foundation; everything below assumes the body is passed
   through.
2. **"It" pass** — the default "it" = the guide's core subject (e.g. *your AI-built software*); every
   non-subject "it" named so no referent is ambiguous. (Trust, `DEC-040`.)
3. **Glossary** — the `glossary` field present, 3–5 terms, accurate, rendered as the muted end-of-page
   block (`DEC-040-3`).
4. **Headings** — each H2 a natural-language question; FAQ-lift nouns seated so the JSON-LD `FAQPage`
   auto-extraction is clean (`DEC-043-3`).
5. **Entity naming** — the agreed key phrase ("AI-built software") seated where it belongs; a frozen
   guide is not re-seated without a new ruling (`DEC-043-4`).

**Voice & presentation**
6. **Conjunction audit** — `VOICE.md` workflow: CC lists every sentence-initial *And/But/So* per type;
   operator rules; target ~2 of each per article, a guideline not a cap (`DEC-040-4`).
7. **Metaphor audit** — `VOICE.md` workflow: CC lists local metaphors / clichéd phrasings; operator rules
   keep-or-reword; a structural metaphor (a whole analogy) is handled as a unit. Carry any inputs noted
   during the redline (e.g. intuition-echo proximity).
8. **Rendered read** — the operator reads the whole guide **as it renders** (dev/browser), not just the
   source; apply edits. The pass that caught 11 edits on Trust (Conv 041).
9. **Em-dash sanity check** — surface every em-dash for a conscious ruling (CLAUDE.md; an AI tell on
   social, and these guides feed social).

**Gate**
10. **Markers + declare final** — strip/resolve author-insertion markers (`✎ OPTIONAL`, `✎ ANECDOTE`) per
    the pre-flip gate; resolve any open masking-confirm caveats (`[CASE-RECORD-SIGNOFF]`); operator
    declares the prose **final**.

## Out of scope here
Images (`[CONTENT-ART]`) and per-piece JSON-LD (`[SITE-STRUCTURED-DATA]`) are tracked on the board, not in
this prose pass. The live-flip itself (`CONTENT_HOME_LIVE`) is a separate step (`[SITE-CONTENT-HOME]`).
