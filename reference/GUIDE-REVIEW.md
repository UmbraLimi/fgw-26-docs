# Guide / article review — the finalize pass (fgw)

One repeatable pass to take a **cornerstone guide OR a blog article** from **body-redlined** to **prose
final** — the same pass applies to both (article-specific notes called out inline). Codified Conv 047
(`DEC-047-3`) from the Trust-guide precedent — the Conv-040 tone/presentation review + the Conv-041
rendered read — and expanded the same conv with the operator's steps (anecdotes, pull-quote, colophon,
metadata, final review) so each review is identical instead of reconstructed from memory. **Lean by
intent: a checklist, not a gate.** Consult `PERSONA.md`, `VOICE.md`, `CHANNELS.md`, `COLOPHON.md` as
relevant.

Each step: CC does the mechanical part and presents; **the operator rules**. Not every step changes
something — "checked, clean" is a valid outcome, stated (never silently skipped) and recorded in the conv.

## The pass (in order)

**Structure & content**
1. **Coordinate-view redline** — regenerate the `P#S#` view (`node scripts/number-content.mjs <file>`, run
   from `fgw-26`), redline section by section, **checking each change back against the creation outline's
   arc** (`GUIDE-CREATE.md`) — a rewritten paragraph must stay on-story. Foundation; everything below
   assumes the body is passed through.
2. **"It" pass** — the default "it" = the piece's core subject (e.g. *your AI-built software*); every
   non-subject "it" named so no referent is ambiguous. (Trust, `DEC-040`.)
3. **Anecdote check** — does the piece carry **enough personal-experience anecdotes** (the operator's
   own)? Surface thin or missing spots; add or strengthen. A core voice element (the from-experience
   register, `PERSONA.md`/`VOICE.md`) — applies to articles as much as guides.
4. **Glossary** — the `glossary` field present, 3–5 terms, accurate, rendered as the muted end-of-page
   block (`DEC-040-3`). (Guides; an article may have none.)
5. **Headings** — each H2 a natural-language question; FAQ-lift nouns seated so the JSON-LD `FAQPage`
   auto-extraction is clean (`DEC-043-3`).
6. **Entity naming** — the agreed key phrase ("AI-built software") seated where it belongs; a frozen
   piece is not re-seated without a new ruling (`DEC-043-4`).

**Voice & presentation**
7. **Conjunction audit** — `VOICE.md` workflow: CC lists every sentence-initial *And/But/So* per type;
   operator rules; target ~2 of each per article, a guideline not a cap (`DEC-040-4`).
8. **Metaphor audit** — `VOICE.md` workflow: CC lists local metaphors / clichéd phrasings; operator rules
   keep-or-reword; a structural metaphor (a whole analogy) is handled as a unit. Carry any inputs noted
   during the redline (e.g. intuition-echo proximity).
9. **Pull quote** — select **one** pull quote and decide where it goes (the seam or beat it reinforces).
   (Steering used a bridging pull-quote at the planning→steering seam, Conv 045.)
10. **Rendered read** — the operator reads the whole piece **as it renders** (dev/browser), not just the
    source; apply edits. The pass that caught 11 edits on Trust (Conv 041).
11. **Em-dash sanity check** — surface every em-dash for a conscious ruling (CLAUDE.md; an AI tell on
    social, and these pieces feed social).

**Image**
12. **Colophon selection + fitting** — select the public-domain plate, create the square tile + colophon,
    crop / duotone-normalize / size, and fit it to the piece. Full how-to + standards: `COLOPHON.md`
    (the operator frames the candidate square inner-extracts; CC treats, builds, and wires `image`).

**Metadata**
13. **Card + SEO/GEO snippet match** — after the redline, confirm the card `description` (evocative) and
    the `snippet` (meta / og / twitter, SEO + GEO) still accurately match the **final** content. They are
    decoupled by `DEC-043-2`, but both must be true to the piece.

**Safety**
14. **Masking check** — every personal-experience anecdote is confirmed **not client-identifiable**: no
    real client / source / target exposed, nothing that bridges to a de-identified case
    (`[CASE-RECORD-SIGNOFF]`, 🔴). Generalize where needed (Conv-045 precedent: "a big client project").
    Applies to any piece carrying anecdotes — guides and articles alike.

**Gate**
15. **Final whole-page review + declare final + graduate** — strip/resolve author-insertion markers
    (`✎ OPTIONAL`, `✎ ANECDOTE`); the **operator does a final manual review of the whole rendered page**;
    then declares it **final**. **Graduate the dossier:** write the piece's board-row dossier (take,
    outline, decisions, publish status + date) to a permanent **`fgw-26-docs/docs/content/<slug>.md`**,
    then retire the board row.

## Out of scope here
Per-piece JSON-LD (`[SITE-STRUCTURED-DATA]`) is auto-generated (`DEC-043-3`), not a manual step. The
live-flip itself (`CONTENT_HOME_LIVE`) is separate (`[SITE-CONTENT-HOME]`).
