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
1. **Coordinate-view redline — whole-draft-first (`DEC-049-2`).** Once the arc + key design are locked
   (`GUIDE-CREATE.md`), **CC writes the entire piece in one coherent pass against the approved `✎ ARC`
   block** — *not* block-by-block with a ruling between each. Editing one block at a time fractures CC's
   intent and lets the arc drift; a whole-draft pass keeps the story intact (operator, Conv 049).
   Regenerate the `P#S#` view (`node scripts/number-content.mjs <file>`, from `fgw-26`) for addressing.
   🔴 **The whole-draft pass marks deferred items inline, it never fabricates:** `✎ ANECDOTE` for the
   operator's own stories (CC never invents a personal anecdote in his voice), provisional wording flagged,
   `✎ OPTIONAL` author insertions. CC then **self-checks the finished draft against the `✎ ARC` block and
   reports any drift**. **Then the operator reads/edits the whole piece first, and only then moves block by
   block.** Foundation; everything below assumes the body is passed through.
2. **"It" pass** — the default "it" = the piece's core subject (e.g. *your AI-built software*); every
   non-subject "it" named so no referent is ambiguous. (Trust, `DEC-040`.)
3. **Anecdote check** — does the piece carry **enough personal-experience anecdotes** (the operator's
   own)? Surface thin or missing spots; add or strengthen. A core voice element (the from-experience
   register, `PERSONA.md`/`VOICE.md`) — applies to articles as much as guides.
4. **Glossary** — the `glossary` field present, 3–5 terms, accurate, rendered as the muted block in the
   **sticky right aside** with the image (`DEC-040-3`; sticky-together Conv 052). 🔴 **Aside-length check
   (Conv 052):** image + glossary pin as one sticky unit; a combined block taller than the viewport keeps
   its lowest glossary terms off-screen until the page bottom. CSS doesn't solve this — **the operator
   visually confirms the aside fits** (during the rendered read, step 11) and trims to fit: drop terms or
   shorten definitions (we control the glossary). (Guides; an article may have none.)
5. **Headings — each H2 a standalone, liftable question.** Each H2 is a
   natural-language question with FAQ-lift nouns seated so the JSON-LD `FAQPage`
   auto-extraction is clean (`DEC-043-3`). 🔴 **Liftability scrutiny (`DEC-053-1`,
   Conv 053):** read every H2 **cold — out of the page**, the way it appears in a
   `FAQPage` rich result, an AI/GEO answer, or a search snippet, with *none* of the
   surrounding prose. Confirm it still names its own subject. A heading that borrows
   its referent from the paragraph above it (*"How do I test each part?"* → part of
   **what?**) goes vague once lifted; seat the subject in the heading itself —
   usually the entity keyphrase. **Worked example (Deciding §4, Conv 053):** *"How
   do I test each part?"* → *"How do I find the parts of my AI-built software I'm
   unsure of?"* (self-contained when extracted, and seats *AI-built software*). Weigh
   against length — seat the entity where the lift payoff is real, not on every H2.
6. **Entity naming** — the agreed key phrase ("AI-built software") seated where it belongs; a frozen
   piece is not re-seated without a new ruling (`DEC-043-4`).

**Voice & presentation**
7. **Conjunction audit** — `VOICE.md` workflow: CC lists every sentence-initial *And/But/So* per type;
   operator rules; target ~2 of each per article, a guideline not a cap (`DEC-040-4`).
8. **Metaphor audit** — `VOICE.md` workflow: CC lists local metaphors / clichéd phrasings; operator rules
   keep-or-reword; a structural metaphor (a whole analogy) is handled as a unit. Carry any inputs noted
   during the redline (e.g. intuition-echo proximity).
9. **Signature-phrase / AI-tell audit** — CC counts phrases repeated often enough to read as an AI
   verbal tic (CC's own register) and surfaces each with its body count + context; the operator rules
   keep / vary / trim per phrase. Distinct from the metaphor audit (clichés) and conjunction audit
   (openers): this catches **repetition of a signature phrase or construction**. A deliberate throughline
   (e.g. "stand behind") is a conscious keep-or-vary call, not an automatic cut. (Added Conv 054, operator.)
10. **Pull quote** — select **one** pull quote and decide where it goes (the seam or beat it reinforces).
   (Steering used a bridging pull-quote at the planning→steering seam, Conv 045.)
11. **Rendered read** — the operator reads the whole piece **as it renders** (dev/browser), not just the
    source; apply edits. The pass that caught 11 edits on Trust (Conv 041). Includes the **aside-length
    check** (step 4): scroll the desktop view and confirm the sticky image + glossary fit without hiding
    the lowest terms; trim the glossary if not (Conv 052).
12. **Em-dash sanity check** — surface every em-dash for a conscious ruling (CLAUDE.md; an AI tell on
    social, and these pieces feed social).

**Image**
13. **Colophon selection + fitting** — select the public-domain plate, create the square tile + colophon,
    crop / duotone-normalize / size, and fit it to the piece. Full how-to + standards: `COLOPHON.md`
    (the operator frames the candidate square inner-extracts; CC treats, builds, and wires `image`).

**Metadata**
14. **Card + SEO/GEO snippet match** — after the redline, confirm the card `description` (evocative) and
    the `snippet` (meta / og / twitter, SEO + GEO) still accurately match the **final** content. They are
    decoupled by `DEC-043-2`, but both must be true to the piece.

**Safety**
15. **Masking check** — every personal-experience anecdote is confirmed **not client-identifiable**: no
    real client / source / target exposed, nothing that bridges to a de-identified case
    (`[CASE-RECORD-SIGNOFF]`, 🔴). Generalize where needed (Conv-045 precedent: "a big client project").
    Applies to any piece carrying anecdotes — guides and articles alike.

**Gate**
16. **Final whole-page review + declare final + graduate** — strip/resolve author-insertion markers
    (`✎ OPTIONAL`, `✎ ANECDOTE`); the **operator does a final manual review of the whole rendered page**;
    then declares it **final**. **Graduate the dossier:** write the piece's board-row dossier (take,
    outline, decisions, publish status + date) to a permanent **`fgw-26-docs/docs/content/<slug>.md`**,
    then retire the board row.

## Out of scope here
Per-piece JSON-LD (`[SITE-STRUCTURED-DATA]`) is auto-generated (`DEC-043-3`), not a manual step. The
live-flip itself (`CONTENT_HOME_LIVE`) is separate (`[SITE-CONTENT-HOME]`).
