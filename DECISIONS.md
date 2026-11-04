# Decisions — fgw

Every decision (design and process alike), numbered `DEC-NNN-N`, **newest-first**. Each: `Decision:` /
`Rationale:` (name the alternative that lost) / `Consequences:`. 🔴 IDs are never reused or renumbered;
a superseded decision is **tombstoned, never deleted** (`### DEC-NNN-N — ⛔ superseded by \`DEC-MMM-M\``
and nothing else), so every handle ever issued resolves. Scan `DECISIONS-DIGEST.md` for precedent, then
open the cited entry here. Full format: `reference/CONV-FORMAT.md`.

---

## Conv 023

### DEC-023-3 — translation-platform: multi-language is intent only; the target language is not named
**Decision:** On the `translation-platform` case, the multi-language scope is presented as **design intent**,
not delivered scope — the "ten languages" claim is de-emphasised — and the single language it was actually
developed in is **not named** on the card.
**Rationale:** The project was architected for multiple languages but developed and proven in one (Brazilian
Portuguese — deliberately unnamed). Naming the target language risks linking this de-identified engagement to
the named Center-for-Unity Urantia cases (same client and source text; the `[CASE-RECORD-SIGNOFF]` masking
constraint). Operator chose generic over naming the language. Alternatives that lost: keep "ten languages" as
a delivered accomplishment (overstates — it was single-language in practice); name Brazilian Portuguese
explicitly (the de-id link the operator rejected).
**Consequences:** Title keeps "Multi-language" (reads as intent); `summary` says "developed and proven on
one"; the count removed from `summary` + `problem`. The body "The problem" was also rewritten from operator
copy (DeepL / glossary-adherence detail) and lost its solution-mechanism sentences (duplicated "What I
built"). 🔴 Future edits to this card must not name the target language.

### DEC-023-2 — Every Work case opens with a "Why it matters" section
**Decision:** Each `/work/<slug>` case study carries a dedicated **"Why it matters"** section as its first
`##` heading — 1–2 lines stating the project's motivation (the broader need it answers) — placed before "The
problem". "The problem" is correspondingly trimmed to the *difficulty* only, so motivation and difficulty no
longer share the opener.
**Rationale:** Operator wants a reader to follow the flow of thought — client need → chosen approach — and a
standalone "why" section is the hinge that makes "What I built" read as a chosen response rather than an
arbitrary build (conv 023). A section (not just a lead line inside "The problem") so the beat is explicit and
consistent site-wide. Heading "Why it matters" chosen over the question-form "Why do this?" — declarative,
matching the other noun-phrase headings ("The problem", "Where it stands"). Alternatives that lost: a 1–2
line "why" folded into the top of "The problem" (keeps the redundancy the operator flagged — motivation and
difficulty blurred); "Why do this?" question heading (the home page uses question headings, but the case
sections are declarative).
**Consequences:** Applied to all seven cases (translation-platform, learning-marketplace, redline,
personal-productivity-app, this-site, discover-jesus, discover-the-ub); each "The problem" trimmed to the
difficulty. De-identified cases (translation-platform, learning-marketplace) keep their "Why" generic — no
client/source-text identity. In translation-platform this pass also removed the two solution-mechanism
sentences from "The problem" (duplicated "What I built") and kept the "black box" aim line — folding in the
unresolved earlier trim question. Not deployed — local dev only.

### DEC-023-1 — Case narration: "I" for Fraser's own calls, "we" for client-shared decisions
**Decision:** In Work case-study narration, first-person **"I"** denotes Fraser's own decisions and actions;
first-person-plural **"we"** denotes decisions made jointly with the client. The operator works closely with
clients on strategy, so a mix of the two within one client case is intentional, not voice drift.
**Rationale:** Operator's stated working practice (conv 023). The distinction is meaningful — it marks which
calls were solo and which were shared — and does positioning work (signals collaboration with the client,
not just work done for them). Carries no de-identification risk ("we" names no one). Alternative that lost:
normalise all case narration to "I" for a uniform voice (would erase the real solo-vs-shared distinction and
misrepresent shared calls as Fraser's alone).
**Consequences:** Governs the client cases (`translation-platform`, `learning-marketplace`, and the two named
Center-for-Unity cases `discover-jesus` / `discover-the-ub`). Fraser's own-project cases (`this-site`,
`redline`, `personal-productivity-app`) have no client, so no shared "we" arises. Verbatim log quotes inside
the "Fraser's Role" record sections are exempt — they stay faithful to the source even where they contain
"we" (e.g. the "we haven't hemmed in what we want to build" quote in `translation-platform`). Under this
rule, "we were out to minimize… the black box" in `translation-platform` is correct.

## Conv 022

### DEC-022-5 — `::selection` uses the `--accent`/`--on-accent` pair, not `--accent-tint`
**Decision:** The global `::selection` rule sets `background-color: var(--accent)` + `color: var(--on-accent)`
instead of the old `background-color: var(--accent-tint)`.
**Rationale:** `--accent-tint` in dark mode (`#2a2114`) is near-invisible against the near-black page — the
operator confirmed text highlighting looked broken in dark, fine in light. `--accent`/`--on-accent` is the
existing button pairing engineered to contrast in both themes. Alternative that lost: a bespoke
`light-dark()` selection pair (extra tokens for no gain over the accent pairing).
**Consequences:** Legible selection in both themes — verified live (light: dark-orange bg / white text;
dark: amber bg / near-black text). `global.css` `::selection` only.

### DEC-022-4 — Record section → "Fraser's Role — an AI's independent audit", written third-person
**Decision:** Every case's on-page record summary is retitled **"Fraser's Role — an AI's independent audit"**
(from "The record — an independent read") and rewritten in third person naming Fraser (past tense), matching
the already-third-person transcripts.
**Rationale:** The summaries were framed as an AI's independent read yet narrated in Fraser's first-person
"I" voice — incoherent, and inconsistent with the transcripts. The new title names what is assessed
(operator: "Fraser's Role … this is what is being assessed") and connotes an AI assessor. Alternative that
lost: keep "The record — an independent read" + first person (the very incoherence that prompted the fix).
Transcripts left unchanged (already third person; their residual "I" are verbatim log quotes that must stay
faithful).
**Consequences:** All five record-bearing cases updated (learning-marketplace, redline, this-site,
translation-platform, personal-productivity-app). translation-platform needed a full conversion; the others'
bodies were already third person (intro + title only). The unrendered `this-site` `outcome:` frontmatter
still reads first-person (dead metadata, left as-is).

### DEC-022-3 — Click-to-enlarge lightbox for case mockups (native `<dialog>`)
**Decision:** Case mockups open to a full-size view via a native `<dialog>` lightbox, reusing RecordMethod's
delegated-inline-script pattern (bound once on `document`, dialog looked up at click time, ClientRouter-safe).
**Rationale:** The learning-marketplace system map is only legible at retina scale in the small 2:3 slot;
enlarging lets a viewer actually read it (and as a vector it stays crisp at any size). Alternative that lost:
open-in-new-tab (simpler, ~2 lines) — rejected as less built-in; CSS hover/focus zoom rejected (poor on
touch).
**Consequences:** Applies to every case mockup (redline PNG + learning-marketplace SVG); a ⤢ badge + a
"click to enlarge" caption hint aid discoverability. 🔴 The `is:inline` script must sit inside the layout
content — a first attempt placed after `</SiteLayout>` (outside `<html>`) never ran. `global.css`
`.mockup-modal*`, `[slug].astro`.

### DEC-022-2 — learning-marketplace mockup is an illustrative, de-identified system-map SVG
**Decision:** The learning-marketplace (Peerloop) case uses a generated, de-identified **system-map SVG** as
its sidebar mockup (sized 2:3 to fill the box), captioned "the moving pieces are real; the connections
between them are representative, not the client's exact architecture" (label also baked into the SVG). The
old mock `.case-figure` flow diagram was removed and its SVG deleted.
**Rationale:** The app is proprietary — no screenshots, and no accurate flow/page diagram may be shown. A
representative map implies the project's scale/complexity while staying NDA-safe; honesty is preserved by the
"representative, not actual" caption + baked label (the site's checkable thesis). Alternatives that lost: an
accurate diagram or a screenshot (NDA-unsafe); keeping the small generic mock flow (undersells scale, and a
"Sample diagram" caption beside a real map reads wrong). Operator chose the top-down layout and "use the
whole map scaled in" over cropping a window.
**Consequences:** learning-marketplace no longer renders a `.case-figure` (its `[CASE-DIAGRAMS]` need is met
via the mockup). The map's nodes are industry-standard LMS/marketplace/community pieces (several already named
in the public record), so no new disclosure; the identifying `package.json` names were excluded.

### DEC-022-1 — Mockup wiring by filename convention, not a caseExtras field
**Decision:** Case product mockups are wired by **filename convention** — a `src/mockups/<slug>.{png,svg}`
asset is globbed and rendered as a plain `<img>` cover-fit into the 2:3 `.case-mockup` box; a labelled
placeholder shows when no file exists. Caption text comes from an optional `caseExtras.mockupCaption`.
**Rationale:** A file's presence is itself the "a mockup exists" signal, so no per-case flag is needed —
unlike the `diagram` field. Alternative that lost: a named `caseExtras.mockup` field mirroring `diagram`
(redundant — it would just repeat the slug). Plain `<img>` chosen over `astro:assets`; raster optimization
deferred to the gated `[SITE-PERF]` to dodge the Cloudflare image-service rabbit hole.
**Consequences:** The glob accepts `.png` and `.svg`; image `alt` derives from the caption. `redline.png`
(344 KB) + the mockup optimization are noted on the `[SITE-PERF]` row. `[slug].astro`, `global.css`
`.case-mockup*`, `content.config.ts` (`mockupCaption`).

## Conv 021

### DEC-021-4 — A/B labels required only for options-bearing asks; open-ended `👉👉👉` questions are fine
**Decision:** The A/B-options rule (`DEC-002-1`, extended `DEC-005-1`) is refined: labelled `A)`/`B)` options
are required only when a `👉👉👉` question **offers options** (a fork — in practice the word "or"); a purely
open-ended question carries the `👉👉👉` anchor alone and needs no labels. `check-ab-options.sh` now allows a
label-less block that contains no standalone "or", and blocks only an options-bearing block that lacks
labels. CLAUDE.md's `👉👉👉` bullet reworded to match.
**Rationale:** Operator (Conv 021): "You may ask open-ended questions (in fact you should do so whenever you
need more input). You only ask in A/B/C format if your ask contains options, and in particular the word
'or'." The old hook demanded labels on every anchored question and misfired three times this conv on
legitimate open-ended asks ("What do you make of it?"). The "or" test is the operator's own stated signal.
Alternatives that lost: relax the hook to warn-only or drop it (loses the guard entirely); try to detect
options-bearing asks more cleverly than "or" (no reliable mechanical signal). Known limits accepted: an
options ask phrased without "or" and without labels slips through (narrower miss than the prior
over-blocking); "or" in open-ended prose can over-trigger (rare, usually it is in fact offering a choice).
**Consequences:** Does **not** supersede `DEC-002-1`/`DEC-005-1` — refines their scope. `check-ab-options.sh`
(logic + header comment + feedback message) and CLAUDE.md §Interaction-model updated. Verified by running the
hook against five inputs (open-ended→allow, or-fork-unlabelled→block, labelled→allow, no-anchor→allow,
or+labels→allow).

### DEC-021-3 — `paused` added to the case-status enum; translation-platform relabelled + card reworded
**Decision:** The `caseExtras.status` enum (set in Conv 019) gains a fourth value, `paused`. The
`translation-platform` case moves from `experimental` to `paused`, its over-long two-sentence card summary
is cut to one sentence, and the summary now opens with "Exploratory." (renders as a lead on the Work card).
**Rationale:** Operator (Conv 021): the engagement was exploratory/experimental and ran several months; the
client paused it to explore AI-only pipelines on newer models — so it is on hiatus, not experimental-ongoing.
The chip ("experimental") contradicted the prose ("clean and deliberate hiatus… not abandoned") and the audit
("wound down cleanly"); `paused` reconciles them and is consistent with the honesty frame. Alternatives that
lost: keep `experimental` and soften the prose (bends the truer text to the weaker label); leave it as the
deliberate public framing (the mismatch stays visible). "Exploratory." as the card lead keeps the exploratory
character the status word drops. The enum renders through `.eyebrow` (uppercased), so lowercase `paused`
displays as "PAUSED" like the others.
**Consequences:** `content.config.ts` enum widened; `case-extras.json` status set to `paused`; the summary in
`content/work/translation-platform.md` rewritten. Build green; verified on the Work index (card shows
"Exploratory. …" + PAUSED, length now comparable to its neighbour). Not deployed. `paused` is now available
to any future case.

### DEC-021-2 — A shared "Why this is checkable" framing line + modal above every audited record
**Decision:** Every audited `/work` case renders, above its "The record" CTA, a shared one-line frame —
"An independent read like this is only possible because the project is built to be examined." — with a
"Why this is checkable" link that opens a modal explaining the method that makes the audit possible: a
separate docs repo, numbered decisions (the wrong ones kept, not erased), turn-by-turn capture the AI
learns from so a documented mistake isn't repeated, and full client access to every repo. Single-sourced
in a new `RecordMethod.astro`, rendered by `work/[slug].astro` only where a `record` exists (never on the
live-link-only Urantia cases). The modal is a native `<dialog>` driven by a view-transition-safe delegated
inline script — no hydrated island.
**Rationale:** Operator (Conv 021): the Work cases' self-audits are only possible because of the method,
and readers should be told why — "we need to frame for our readers why this kind of meta-analysis is
possible." It also states the transparency guarantee (client has every repo). Placement chose a shared line
over per-case prose; option C (shared line) over A (this-site-only) / B (Method-page-only). A native
`<dialog>` over a framework island keeps the near-zero-JS discipline (`ThemeToggle` stays the sole island);
over a CSS-only `<details>` it gives focus-trap + Esc free. Placed with the CTA (just under the summary)
rather than lifting the "## The record" heading out of markdown — lean over an exact-position refactor.
**Consequences:** New `src/components/RecordMethod.astro`; `work/[slug].astro` imports + renders it in the
`record` branch; styles added under `@layer components` in `global.css` (`.record-method`, `.record-modal`
+ `::backdrop`, themed via `light-dark()` tokens). Verified in the running product (localhost dev): renders
on audited cases, absent on `discover-jesus`; modal opens, closes via × and backdrop, correct light + dark.
Copy to be reconciled against `reference/VOICE.md` at the consistency pass. Not deployed (local dev only).

### DEC-021-1 — The four pre-existing "The record" transcripts accepted as genuine; no re-run
**Decision:** The four Conv-014 "The record" transcripts (`redline`, `this-site`, `translation-platform`,
`learning-marketplace`) are accepted as genuine independent-subagent captures and left as-is — no re-audit,
no re-label. Resolves the open question `DEC-020-4` carried to this `/r-start`.
**Rationale:** Operator, after the investigation: "satisfied the work … for these 4 projects is already
accurate and representative of what I would [want] the sub-agents to uncover." The committed record
consistently documents fresh-subagent-per-repo production (`DEC-014-1`, `DEC-009-4`; the Conv-014 record +
dialogue; an incidental capture-hook detail — subagent hand-backs landing in `.conv-turns.jsonl` as
user-role turns — that is hard to fabricate), and this production path differs from fps's first-pass, which
`DEC-020-4` records as authoring-model composition. The dispositive raw capture is not recoverable
(`.conv-turns.jsonl` resets per conv; the raw audits were gitignored scratch), so acceptance rests on the
operator's judgement of accuracy, not on re-verifiable machine evidence. Alternatives that lost: re-run the
four as fresh audits like fps (operator judged the content already accurate); re-label the `unedited`-opener
wording on `redline`/`this-site` (provenance is genuine, so the wording is not a false claim).
**Consequences:** The four transcripts stand unchanged. The Work-section-wide honesty question is closed.
`[CASE-RECORD-REFRESH]` (staleness of the `this-site` convs-000–008 read + final-state client reads) is a
separate, still-open content concern, untouched by this.

## Conv 020

### DEC-020-4 — "The record" transcripts must be genuine independent audits (redacted), not model-composed
**Decision:** A case's "The record" transcript must be the verbatim output of a genuine independent read — a
fresh AI agent, given no prior conclusions, pointed at the project's own documentation — not authoring-model
prose dressed in transcript framing. For fps the read is `fps-docs` only, never `fps-sensitive`. The output
is redacted per `DEC-014-2` (typed `{braces}` + in-body legend) and may be followed by a clearly-separated
author's-response section, with the audit above left unedited.
**Rationale:** The first-pass fps transcript was composed by the authoring model and falsely labelled "the
full, unedited transcript of the independent audit" — fabricated provenance on the one site whose pitch is
"check my work." Operator: "It has to be real." A fresh agent (not a fork) makes the read genuinely
independent of the authoring context. Alternative that lost: reframe the page as a "compiled assessment" and
keep model-authored prose (honest, but abandons the independent-audit claim the other cases make).
**Consequences:** Replaced the fabricated fps transcript with a real redacted audit (463 decisions;
per-line-tiering build-then-reversal; docs out-commit code ~3:1; "the roof is not on") + an author's-response
section; the case-body "The record" summary was reconciled to it. ✔ Resolved by `DEC-021-1`: the four
pre-existing transcripts (redline, this-site, translation-platform, learning-marketplace) accepted as
genuine captures, no re-run.

### DEC-020-3 — Public-site copy states the confidentiality hardening present-tense and vague, though planned-not-built
**Decision:** The fps case states name-obfuscation and secret-encryption as present capabilities, worded
vaguely ("identifying names obfuscated, secrets kept encrypted"), with no mechanism named. fps's committed
design is egress-only **isolation** (plaintext-at-rest; `fps-docs/07 §1`); obfuscation/encryption is
planned-not-built.
**Rationale:** Operator: the public site "is not tuned in on my status on projects that finely" — it
describes capability, not build-state granularity; the detailed roadmap (translation-layer obfuscation, a
separate manual encryption tool) stays off public copy. To avoid a published self-contradiction, the audit
transcript's threat-model point was reworded to not assert "encryption not committed." Alternative that lost:
state it as "planned, not yet built" (my draft) — rejected as more status detail than a public site warrants.
**Consequences:** The case body + summary carry the present-tense vague claim and the transcript no longer
contradicts it. A deliberate accuracy-vs-framing call, operator-owned; dropped from the hopper after ruling.

### DEC-020-2 — Per-case `hideMockup` opt-out for the case-study sidebar mockup box
**Decision:** `caseExtras` gains an optional `hideMockup` boolean; `/work/[slug]` renders the sidebar
mockup-placeholder box only when it is unset. The fps case sets `hideMockup:true` — its diagram fills the
sidebar slot.
**Rationale:** Operator, viewing the fps page: "remove the mock image as the diagram does the job." Scoped to
fps only (not every diagram-bearing case), leaving the others slated for real screenshots per `[CASE-MOCKUPS]`.
Named distinctly from the existing `mock` content-flag to avoid confusion. Alternative that lost: hide the box
for any case that has a diagram (would retire the placeholder for all four diagram cases at once).
**Consequences:** Amends `DEC-019-3`'s "a `.case-mockup` placeholder renders for every case." `[CASE-MOCKUPS]`'s
owed screenshot set no longer includes fps. Field documented in `src/data/README.md`.

### DEC-020-1 — [CASE-FPS] built: the fps case, whole-system scope, generically named, with a diagram + "The record"
**Decision:** The `personal-productivity-app` case is built real (replacing the Conv 019 mock): scope = the
whole FPS system (two-vault corpus + local-LLM confidentiality + CLI/MCP + desktop app), not the app alone;
kept generically named ("Secure personal productivity app", slug unchanged); type `desktop application` /
status `ongoing`; a new two-tier-egress diagram; real `tools`/`benefit`; `mock:false`; and a "The record"
independent-audit block.
**Rationale:** Four operator rulings — scope (whole system over app-only), name (generic over the real "FPS",
so the system guarding confidential data isn't advertised), diagram (yes — the architecture is the point),
record block (yes — the honest-frame signature). The record is sourced from `fps-docs` (how Fraser performs
with AI is locked in each project's `-docs` repo); `fps`/`fps-app` were read for what's built; `fps-sensitive`
never opened. Alternatives that lost: app-only scope, the real name, diagram-less, no record block.
**Consequences:** fps joins the Work cases as real work. Its "The record" block was first fabricated then
redone (`DEC-020-4`). The case summary was corrected from the Conv-019 placeholder, which had described an
un-adopted per-note-encryption design rather than the committed tier-separation.

## Conv 019

### DEC-019-4 — Retire the per-case motif; cards + case pages share one type→icon map
**Decision:** The Conv 012 per-case "motif" icon is retired. `/work` cards **and** `/work/<slug>` case-page
headers both derive their glyph from the project `type` via one shared map (`src/lib/type-icon.ts`):
website→globe, web application→blocks, server application→box, browser extension→pin, desktop application→
monitor. The now-dead `caseExtras.icon` field is removed from the schema, every `case-extras.json` entry,
and the data README.
**Rationale:** Conv 019 switched the cards to type-driven icons (`DEC-019-2`), leaving the case-page header
still on the per-case motif — so card and page glyphs diverged on 4 cases. Operator chose consistency (card
↔ page match) over the distinctive per-case motif. A shared module avoids duplicating the map across its two
consumers. Alternative that lost: keep the per-case motif on case pages (distinctive per case, but glyphs
differ card vs page).
**Consequences:** Amends `DEC-012-1` (its index-card motif enrichment is gone; diagram/tools/benefit stand).
`Icon.astro` keeps the full glyph set as a library — `languages`/`nodes`/`compass` are no longer referenced
by cases but remain available. A new project type now requires a `type-icon` entry (TS enforces it).

### DEC-019-3 — Case-study pages: two-column layout with a portrait mockup sidebar
**Decision:** `/work/<slug>` pages become a two-column grid at `lg`: a prose main column + a **sticky** right
sidebar (`top:5rem`, clears the header) holding, top-to-bottom, a **~2:3 portrait mockup** then the benefit /
diagram / tools (moved out of the flow above the prose). Each case gets a per-case mockup **placeholder** box
(labeled with the title) until real ~2:3 screenshots land; the Client badge is mirrored under the h1.
**Rationale:** The single measure-width column (`--measure` 62ch) left ~45% of the ≤72rem container empty on
desktop. Operator chose a sidebar (option A) over a newspaper two-column prose flow (rejected — poor web
reading: down column 1, back up column 2) and over merely centering the column (doesn't use the space). The
mockup was first set to 1:2 as a "go tall" signal, then to ~2:3 to match the real images' shape (and ease
the sticky overflow). Real images are operator-owed (`[CASE-MOCKUPS]`).
**Consequences:** A `.case-mockup` placeholder renders for every case (`mock` doesn't badge it). A sidebar
taller than the viewport keeps its lower items below the fold while pinned, until release at page end.
Mobile stacks main-then-aside (ordering flagged under `[CASE-MOCKUPS]`).

### DEC-019-2 — /work cards surface project type, status, and client
**Decision:** Each `/work` card header shows the project **type** (type-driven icon + uppercase eyebrow
label) on the left and **status** (uppercase eyebrow) right-aligned; client-owned cases also carry a tinted
**"Client" pill** (left cluster, mirrored under the case-page h1). `type` (website / web application /
server application / browser extension / desktop application) and `status` (ongoing / deployed /
experimental) are **required** `caseExtras` enums; the client marker is driven by the existing `work.client`
field and shows a **generic "Client"** — never the client's name (masking).
**Rationale:** Operator wanted the card to communicate what each project is, its lifecycle, and whether it
was client work. Enums get build-time validation (not free strings). The client marker reuses existing data
(`client` presence) rather than a new flag. A text pill beat an icon (no unambiguous "client" glyph); the
generic label keeps de-identified and public cases identical and exposes no confidential name. Alternative
that lost: badge personal projects too ("Personal") — operator chose client-only (absence = personal).
**Consequences:** `type` drives the shared icon map (`DEC-019-4`). Adding a case now requires `type` +
`status` values. The per-case `summary` renders under the type/status/client labels.

### DEC-019-1 — Project/testimonial data keeps the markdown-prose / JSON-structured split; no unified JSON
**Decision:** Per-case and testimonial data keeps its current **two-store** shape: long-form prose (the
`/work/<slug>` case bodies, and the reserved blog) stays in markdown content collections; structured
attributes (per-case `type`/`icon`/`tools`/`benefit`/`diagram`, and testimonials) stay in zod-schema'd
JSON (`src/data/case-extras.json`, `src/data/testimonials.json`). We do **not** build a unified per-case
JSON record, and do not migrate the card fields (`title`/`summary`) out of markdown. The two-file authoring
rule holds: **card text = `src/content/work/<slug>.md`; structured attributes = `src/data/case-extras.json`.**
**Rationale:** Operator weighed a React + "database-like" single-JSON-per-project/testimonial approach and
chose against it. (1) The structured data already *is* JSON, and Astro content collections are themselves a
build-time queryable store (`getCollection(...).filter().sort()`), so the DB-like layer exists without a DB.
(2) The site is static, near-zero-JS on Cloudflare's edge; React for content pages would add a client
runtime, hydration, and a fetch story for no benefit on a lead-gen site. (3) The case body is long-form
prose that renders to semantic HTML via Astro `render()` and diffs legibly in review (the operator reviews
even AI-authored prose); markdown-in-JSON keeps the markdown while losing the file and the clean diff. The
authoring-ergonomics argument for markdown is admittedly weaker while an agent is the sole author, but
reasons (2)–(3) hold regardless of who authors. Alternatives that lost: **unified JSON per case, fields
only, body left in markdown** (option A) and **everything incl. body into JSON** (option B) — both from the
Conv 019 discussion. **React + a projects/testimonials data store** — rejected as a heavier architecture
than a static lead-gen site needs.
**Consequences:** This conv's `type` field stays in `case-extras.json` (the structured side of the split).
Reaffirms `DEC-004-2` (single-sourced prose) and the Conv 012 JSON split — neither is superseded. No code
change results from this decision; it records the road not taken so it isn't re-litigated.

## Conv 018

### DEC-018-3 — Home surfaces the two AI testimonials in a "Recent testimonials" band, shared + masked
**Decision:** The home page gains a "Recent testimonials" band rendering the two AI-era testimonials, read
from `src/data/testimonials.json` (the same source the `/testimonials` page uses, not a copy), SAMPLE-badged
via the existing `mock` flag, with a secondary "See all testimonials" button → `/testimonials`. Attributions
stay the masked role descriptors for now.
**Rationale:** Operator wanted AI-project proof on the home page; both named people (Gabriel/translation,
Brian/marketplace) have agreed to give real quotes but none exist yet. Sharing the data file keeps home and
`/testimonials` from drifting. Attribution kept masked because naming **Gabriel** publicly would link the
confidential translation engagement to the publicly-named Urantia cases (same client — `[CASE-RECORD-SIGNOFF]`).
Alternative that lost: naming the two people now — rejected, it breaks the masking and the quotes aren't real
yet. Alternative also rejected: hard-coding the quotes on home — would drift from `/testimonials`.
**Consequences:** The home cards are still mock + SAMPLE-badged; the swap for real signed-off quotes now must
cover home *and* `/testimonials` (`[SITE-TESTIMONIALS]`), and the Gabriel-vs-masked attribution decision is
owed when the real quotes land (`[CASE-RECORD-SIGNOFF]`). A new `scales`-unrelated import (`testimonials.json`)
is added to `index.astro`.

### DEC-018-2 — "Find your phase" framing: everyone starts at phase one; progression is not guaranteed
**Decision:** The "Find your phase" band's prose is reworded from "Most people… pass through the same three
phases" to "Everyone starts at phase one. Getting beyond it is the hard part, and far from guaranteed."
**Rationale:** Operator — the old copy implied progression through all three phases is something everyone
completes; in reality those attempting AI coding start at phase 1 and advancing is not guaranteed. The new
copy makes the phases a progression one can stall in, not an escalator. Avoided an unverified prevalence
claim ("most people stall"). Alternative that lost: the measured rewrite ("Whether you progress… isn't
guaranteed") — operator chose the punchier version.
**Consequences:** The home funnel copy now matches the self-qualification intent of `/phases`; no change to
`phases.astro` itself.

### DEC-018-1 — "Judgment in practice" re-led as a question with conceptual "It happens in…" cards
**Decision:** The home "Judgment in practice" band is reframed: a question lead-in ("Where does my judgment
come in?") + intro sentence, and the three concrete anecdote cards (passing-tests fault / honest-when-not-
working / measured bake-off) are replaced with three conceptual cards — "It happens in choosing between AI's
options / judging whether the tests are enough / knowing when AI lacks the context to choose" — all using one
new `scales` balance icon. Card titles are `h3` under the new section `h2`.
**Rationale:** Operator — the cards read as answering "when does my judgment play a role?", so the lead should
pose that question and the cards answer it; the three "It happens in…" moments generalise better than three
specific anecdotes. One shared `scales` icon signals the common theme (weighing a call). Alternative that lost:
keeping the anecdote cards and only restyling the mis-used sentence "eyebrows" into headings.
**Consequences:** A `scales` icon was added to `Icon.astro`. The anecdote content is dropped from home (the
anecdotes still live in the Work cases / `/testimonials`). The sibling "What I do" section was given a matching
lead-in h2 + intro and its card titles corrected `h2`→`h3` for heading hierarchy.

## Conv 017

### DEC-017-4 — Home-only tighter, uniform section rhythm via scoped modifiers
**Decision:** Home section spacing is unified with two modifier classes — `.section.section-tight` and
`.band.band-tight`, both `padding-block: 2.5rem` — applied to all five home blocks, replacing the prior
band→section `pt-0` pattern. Scoped to the home page only; every other page keeps the global
`--section-rhythm` (`clamp(4rem, 8vw, 8rem)`).
**Rationale:** Operator wanted a consistent, narrower vertical rhythm. The old pattern alternated wide
(full+full) and tight (full+0 via `pt-0`) gaps; shrinking only the white sections left the bands
ballooned (112px vs 40px) — a cramped-white / airy-band mismatch. Putting sections and bands on one
shared reduced padding gives uniform 40px internal / 80px gaps (verified live via the Chrome bridge).
Scoped to home (not the global token) per the per-page discipline. Alternative that lost: editing the
global `--section-rhythm` — rejected because it re-spaces all 12 pages the operator hasn't reviewed.
**Consequences:** Home uses a 2.5rem block rhythm; all other pages unchanged. The modifier selectors are
compound (`.section.section-tight`) deliberately: a plain `.band-tight` tied `.band` on specificity and
**lost on source order** (the base rule is defined later). Rolling the rhythm out site-wide later means
promoting the modifiers or the global token.

### DEC-017-3 — Home experience figure reads "over 40 years"; true 44 kept in `llms.txt`; other pages deferred
**Decision:** On the home page the "44 years" figure (hero sub-headline + "meet Fraser" teaser) is
replaced with the static phrase "over 40 years", and the now-unused `yearsExperience` import is dropped
from `index.astro`. The exact computed figure (`yearsExperience()`, =44) is deliberately **kept** in
`llms.txt.ts`; the remaining consumers (`about.astro` + its "1982" anchor, `faq.astro`) are left on the
computed 44 — the "44 vs over-40" call is deferred per-page.
**Rationale:** Operator — past a point an exact number is "noise in the guise of detail"; "over 40" reads
cleaner in marketing copy, while the machine-readable `llms.txt` keeps the precise true figure. Narrows
the "44" specifics of `DEC-010-3` for the home hero only. Alternative that lost: reconcile every page now
— rejected per the per-page discipline (a hopper item to do so was dropped, Conv 017).
**Consequences:** `index.astro` no longer consumes `yearsExperience()`; its consumers are now
`about.astro`, `faq.astro`, `llms.txt.ts` — narrowing `DEC-016-2`'s "every consumer (index, about, faq,
llms.txt)". If all displays eventually go static, `yearsExperience()` + its `DEC-016-2` eslint guard /
vitest test become candidates to retire (not tracked — revisit when reached).

### DEC-017-2 — Em-dash footnote owns the AI "tell"; marker is a pseudo-element anchor to an inner id
**Decision:** A site-wide footer `<details>` note ("On the em dashes…") reframes the em-dash "AI tell"
as the tool-vs-work thesis — collapsed to one teaser line + a `more…`/`less…` disclosure (no JS). The
home h1's first em dash carries a small circled "1" marker linking to it. The digit is a CSS `::before`
(presentational) so it stays **out of the h1's indexed/DOM text** (clean for SEO); the link's accessible
name is an `aria-label`. The anchor's `href` targets an id on an element **inside** the `<details>` (not
the `<details>` itself) so fragment navigation auto-opens the note (ancestor-reveal).
**Rationale:** Operator keeps em dashes as deliberate punctuation and wants to pre-empt readers who'd
dismiss AI-written prose. Spelling standardized to the dictionary "em dash" (two words). Marker evolved
superscript-asterisk → circled "1" (subtler), sized/positioned by operator. SEO: a link inside an h1 is
fine, but the literal "1" polluted the indexed heading, so it was moved to a pseudo-element (verified: h1
DOM text is clean). Auto-open: verified live (Chrome 156) that targeting the `<details>` itself only
**scrolls**, while targeting an inner id **opens** it; older browsers degrade gracefully (scroll +
manual expand).
**Consequences:** The footer note renders on every page using `SiteLayout` (all current pages); the in-h1
marker is home-only. Copy spelling is "em dash" throughout.

### DEC-017-1 — Home hero reworked: new positioning h1 + supporting deck + two-paragraph narrative
**Decision:** The home above-the-fold h1 becomes **"Custom software, designed with you — kept on course
by me."** (replacing `DEC-010-3`'s "Software development — built with AI, kept on course."). A supporting
deck follows (designed with you / AI builds for speed / I correct for quality — "Serious software, made
with you rather than handed over"), then a two-paragraph narrative (the shift + AI's capability; the
catch at scale) with a new **"Where I come in"** `<h2>` over the "my role" material. The "Let … years"
differentiator line stays beside the headshot (now "over 40 years", `DEC-017-3`).
**Rationale:** Operator, Conv 017, via a tagline assessment. The new headline leads with the outcome
(custom software) and the collaborative framing ("designed with you") — anti-elitist but premium
("expensive, not elitist") — with the human-steering reassurance ("kept on course by me") in the headline
itself. Chosen (tagline B) over the shorter "Custom software, designed with you." (A) to keep the
nautical motif + personal accountability up top. Supersedes the **h1-text** specifics of `DEC-010-3`; that
decision's hero structure (flow stepper, headshot, meet-Fraser band) still stands.
**Consequences:** `index.astro` hero rebuilt; the positioning thesis (`[SITE-NARRATIVE]`) is now expressed
in live home copy. Other pages' prose not yet reconciled to this voice (deferred per operator — per-page
as reached).

## Conv 016

### DEC-016-2 — Career length is computed at call time, not at module load (Workers Date-at-global-scope)
**Decision:** `src/consts.ts` exposes `yearsExperience()` (a function) instead of the former
`YEARS_EXPERIENCE` module const. Every consumer (`index`, `about`, `faq`, `llms.txt`) calls it at
render/request time. `CAREER_START_YEAR = 1982` stays a const.
**Rationale:** On the Cloudflare Workers runtime, `new Date()` evaluated at module/global scope returns
epoch 0 (year 1970), so the old `new Date().getFullYear() - CAREER_START_YEAR` module const froze at
`1970 − 1982 = −12` and rendered "-12 years" **site-wide on live staging** (home, about, FAQ). Moving the
computation into a function defers it to render time, which executes with the real clock (verified: built
output shows 44). Alternative that lost: forcing the affected pages to on-demand SSR (`prerender = false`)
— heavier, changes caching, and unnecessary since render-time eval already has the real date.
**Consequences:** The number recomputes each render and never goes stale (preserves the Conv 013 intent).
General rule for this codebase: never read `Date`/time in a module top-level const — compute it inside a
render/handler. Found while verifying `[SITE-AI-SEO]` in the running product (Conv 016).

### DEC-016-1 — AI-crawler policy: welcome answer/search crawlers, decline training-only crawlers
**Decision:** The production `robots.txt` endpoint (`[SITE-AI-SEO]`) adds explicit AI-crawler stanzas:
**allow** the generative-engine *answer/search* crawlers that drive discoverability — OAI-SearchBot,
ChatGPT-User, PerplexityBot, Perplexity-User, Claude-SearchBot, Claude-User, Google-Extended — and
**disallow** the *training-only* crawlers GPTBot, CCBot, ClaudeBot. Staging is unchanged (`Disallow: /`
for everyone, `DEC-015-1`). The roster lives in `src/pages/robots.txt.ts` and is easy to tune.
**Rationale:** The task's goal is to *be found* by LLMs/answer-engines; "found" (live answer surfaces)
and "trained on" (future model weights) are separable mechanisms served by different bots. Allowing the
search/answer bots preserves essentially all live discoverability; declining training-only bots opts the
content out of model training on principle at ~no discoverability cost, since training-corpus inclusion
gives a brand-new low-authority site little in the near term. Google-Extended is deliberately **allowed**
despite its training association, because blocking it also drops Google AI-Overviews grounding — a live
discoverability surface. Alternatives that lost: (a) *welcome all* — rejected, concedes content to
commercial model training for negligible extra discoverability; (b) *block all AI bots* — rejected, it
contradicts the whole point of building llms.txt + JSON-LD.
**Consequences:** `robots.txt` is advisory — this states a preference, not a wall; non-compliant fetchers
ignore it. The AI-crawler policy exists only in the production build string, so like all robots policy it
takes effect only on the eventual production deploy (`[SITE-GO-LIVE]`); nothing is live until then. The
bot roster drifts over time and must be tended as crawlers are renamed/added.

## Conv 015

### DEC-015-1 — Staging builds are held out of search indexes, keyed on build MODE
**Decision:** Staging builds are blocked from indexing two ways: the `robots.txt` endpoint emits
`User-agent: * / Disallow: /`, and every page carries `<meta name="robots" content="noindex, nofollow">`.
Both are gated on `import.meta.env.MODE === "staging"` — the mode `astro build --mode staging` sets (the
`deploy:staging` script) — with production builds unchanged (allow-all robots, no robots meta). To make
the robots policy differ per build, the static `public/robots.txt` was converted to a prerendered endpoint
`src/pages/robots.txt.ts`.
**Rationale:** The SEO assets added in `[SITE-SEO]` (astro `site:`, `@astrojs/sitemap`, per-page canonical)
all resolve against `https://frasergorrie.com` regardless of which env is built, so the staging worker
would otherwise be independently crawlable and indexable under its `*.workers.dev` domain. Keyed on `MODE`,
**not** `import.meta.env.PROD`: under Vite `PROD` is derived from `NODE_ENV` and is `true` for both the
staging and production builds, so it cannot tell them apart. Alternative that lost: rely on the
canonical→prod tag alone — rejected because a canonical is a de-duplication *hint*, not a crawl block, and
leaves the staging origin crawlable on its own.
**Consequences:** `fgw-staging.fgorrie.workers.dev` is now fully disallowed + `noindex`ed (verified live on
staging this conv); production is untouched. The robots policy now lives in code (an endpoint), not a
static asset — any future env that *should* be indexed must be whitelisted in both the endpoint and the
Layout `isStaging` check. The gate is build-time, so it only takes effect on the next deploy of each env.

## Conv 014

### DEC-014-2 — Client "The record" transcripts: light typed-token redaction, not heavy rewriting
**Decision:** The two **client** "The record" transcripts (translation-platform, learning-marketplace) are
**light-token-redacted**: only true identifiers are replaced with typed `{braces}` placeholders carrying an
in-body legend — client/org, product, source-text identity, people, target languages — while counts, dates,
decision IDs, and the concrete steering moments and misses stay **verbatim**. Common third-party products
(DeepL, COMET, BigBlueButton, PlugNmeet, GetStream, Stripe, Cloudflare) and the owner's own harness (PLATO)
are named as themselves. The client summaries + transcripts are gated on **client sign-off before the
production deploy** (`DEC-009-2`); dev/staging is fine.
**Rationale:** Operator, Conv 014 — typed tokens keep the relational structure legible (who overruled whom,
who reviewed what) while masking identity, and read as visibly, honestly redacted. Chosen over heavy prose
de-identification (loses the concrete evidence that makes the audit credible) and over giving client cases no
transcript at all (an asymmetry the operator rejected). Naming common third-party tools is safe once the
identifying anchors are tokenized. 🔴 Mandatory and load-bearing: the translation-platform client is The
Center for Unity and the source text is the Urantia Book — the *same* client named publicly in the two
Urantia cases — so source-text/client/people must stay masked or the confidential engagement links to the
named one.
**Consequences:** the two client transcripts carry a legend + `{tokens}`; `[CASE-RECORD-SIGNOFF]` promoted to
the board and added to the `[SITE-GO-LIVE]` pre-production gates as the sign-off checkpoint. Raw unredacted
audits were kept only in gitignored session scratch, never committed.

### DEC-014-1 — "The record" overhauled into genuine re-audits rendered as full, linkable transcripts
**Decision:** Each audited Work case (redline, this-site, translation-platform, learning-marketplace) is
re-audited by a **fresh independent subagent** reading that project's own repo (the `DEC-009-4` three-axis
method carried forward), the full question-plus-answer **transcript** is stored in a new `record` content
collection and rendered **read-only at `/work/<slug>/record`**, reached by a button below the case summary;
the public summary is re-derived from that real audit. The transcript is **viewable in-page, never
downloaded**. The two named/public Urantia cases — whose repos **predate Claude Code**, so there is no
decision-log to audit — take a **"Visit the live site"** button in the same slot instead.
**Rationale:** Operator, Conv 014 — the prior blocks read too generalised and operator-massaged; showing the
actual audit transcript substantiates the "my work is checkable" claim far better than a polished paragraph.
A dedicated rendered route beat an inline `<details>` expander (keeps long transcripts off the case page,
shareable) and a JS modal (breaks the no-JS ethos); **download was rejected** (operator: render it, don't let
them download the file). The auditor's third-person voice is kept verbatim (VOICE.md exemption) because the
independence is the point. Builds on `DEC-009-4` (not superseded — its audit method + fresh-subagent-per-repo
approach carry forward).
**Consequences:** `record` collection + `src/pages/work/[slug]/record.astro` route + `.record-cta` /
`.record-stamp`; four transcripts live, each stamped with review date + model; the four summaries updated with
corrected scale; Urantia cases gain `liveUrl` on `caseExtras`. Client-transcript redaction specified in
`DEC-014-2`.

## Conv 013

### DEC-013-5 — Work cases: named + public (live-URL proof) alongside de-identified (record-block proof)
**Decision:** The two Urantia sites (DiscoverJesus.com, DiscoverTheUB.com, for The Center for Unity) are
published as **named, public** Work cases whose proof is the **live URL**, kept as **two** separate cases
(meaningfully different stacks), with **no "The record — an independent read" block**. They sit alongside the
de-identified client cases, whose proof is the NDA-safe "The record" audit.
**Rationale:** Operator, Conv 013 — these clients/sites are already credited publicly on the live site, so
naming them is cleared and a live URL is stronger proof than a de-identified write-up; the two sites use
different stacks, so one combined case would blur them. Rejected: one combined case (blurs the stacks);
de-identifying them (needless — they're public); a fabricated "The record" block (no decision-log to audit).
**Consequences:** `/work/discover-jesus` + `/work/discover-the-ub`; `caseExtras` icon enum widened
(+ `blocks`, `compass`). Pattern set: named-public cases prove via live URL, de-identified via the record
block. Tool lists provisional pending operator elaboration.

### DEC-013-4 — Career length is computed from 1982, never hardcoded
**Decision:** "Years of experience" is computed site-wide as `currentYear − 1982` (`src/consts.ts` →
`YEARS_EXPERIENCE`), not a hardcoded number. 1982 (the software-business start) is the load-bearing anchor.
**Rationale:** Operator, Conv 013 — a hardcoded "44" drifts and goes stale yearly (the live site already had
a 43-vs-44 wobble that was only the year); computing from the anchor fixes it everywhere, matching the live
site's approach. Rejected: hardcoding the number (drifts); recomputing per page (duplication).
**Consequences:** `src/consts.ts` holds `CAREER_START_YEAR`/`YEARS_EXPERIENCE`; Home, About, FAQ interpolate
it; renders 44 in 2026.

### DEC-013-3 — `fg` is the authoritative legacy reference; `frasergorrie` superseded
**Decision:** `~/projects/fg` (the current live frasergorrie.com source, Astro 5) is the authoritative legacy
reference; the `frasergorrie` repo (Next.js, frozen `2023-01-21`) is superseded, kept only for deep history.
Both are read-only (never committed/pushed). `fg` added as a working dir (`fgw` launch + guard roots + the
VS Code workspace).
**Rationale:** Conv 013 — discovered mid-conv that `frasergorrie` is a dead 2023 snapshot while the live site
is years ahead (modern AI-era FAQ, named clients, current stack); an early review used the stale repo and
wrongly concluded there was no FAQ. Rejected: scraping the live site per-need (no local source to grep);
treating `frasergorrie` as current (it isn't).
**Consequences:** `_cc/repo-layout.md`, `CLAUDE.md`, `README.md`, `fgw.code-workspace` updated; current-site
reference work goes to `fg`.

### DEC-013-2 — The site is dev-only: no coaching, no pricing surfaces
**Decision:** fgw-26 presents **software development only** — no AI-coaching offering and no pricing /
hourly-block / "buy hours" surfaces (coaching may happen off-site; it is not promoted on the site).
**Rationale:** Operator, Conv 013 — the live site sells dev + coaching with pricing, but the new site is
deliberately dev-focused (the nav already reflects this). This gated the FAQ: coaching/pricing/consultation
questions dropped, and the "$250/hour" question reframed to "why pay an experienced developer" with no price.
Rejected: porting the live site's coaching + pricing content.
**Consequences:** FAQ scoped to 15 dev-only Q&As; no `/services`, `/ai-coaching`, or pricing pages; future
mining of the live site must screen out coaching/pricing.

### DEC-013-1 — Two-tier IA: top-nav = decide-to-look, footer links = explore-mode depth
**Decision:** Split navigation into two tiers by visitor intent. The **top nav** (Home, Work, Method, About,
Contact) is the "should I look further?" surface — lean, hook-and-differentiate, for a cold visitor deciding
whether FG is worth their time. **Footer links** are the "explore mode" surface — depth and reassurance for a
warmer, already-interested visitor: **Testimonials, FAQ, and a standalone History page** live here, not in the
top nav. Pages are also cross-linked as appropriate, so footer material is reachable by more paths than the
footer alone.
**Rationale:** Operator, Conv 013 — the two surfaces serve different visitor states; keeping conversion-critical
hooks in a lean top nav while parking depth content in the footer stops the nav bloating and matches how
interested visitors actually explore. Confirmed the model and chose to record it. Rejected: everything in the
top nav (bloats the decide-to-look surface); a single flat nav.
**Consequences:** Testimonials (Conv 013) is footer-linked; FAQ and a standalone History page are confirmed as
footer-tier builds. Top nav stays at its current five. Cross-linking between pages is an explicit follow-on so
footer pages aren't reachable only from the footer.

## Conv 012

### DEC-012-4 — the site header uses the elevated `--surface` tone
**Decision:** Change `.site-header` background from `--paper` to `--surface` (the elevated tone the footer
already uses) so the sticky header reads as a subtle step above the body in both themes.
**Rationale:** Operator — the 1px `--line` separator was near-invisible in dark. Chose the *lighter*
`--surface` (no new token, matches the footer; "lighter" because dark `--paper` is already near-black and
"darker" would crush). Rejected: a scroll-triggered shadow (more app-like, off the flat editorial look); a
frosted/translucent header (reads SaaS); a stronger border; leaving it.
**Consequences:** `global.css`; verified light + dark in the running product. Bookends the page with the
footer's surface tone.

### DEC-012-3 — file-based secret-vs-config convention (`VARS_SECRETS.md`)
**Decision:** Adopt a documented, file-based convention: non-secret config as `vars` in `wrangler.jsonc`
(committed, commented); secret *names* declared in `secrets.required` (per env); secret *values* in
gitignored `.dev.vars[.<env>]` deployed via `wrangler deploy --secrets-file`. For the contact form,
`EMAIL_FROM` is a var; `RESEND_API_KEY` + `EMAIL_TO` are secrets. Captured as a portable playbook,
`VARS_SECRETS.md`.
**Rationale:** Operator's recurring cross-project pain — secret/config homes should be obvious and
documented *in files*, not scattered across `wrangler secret put` history and the dashboard. Verified
wrangler 4.153.0 supports `--secrets-file`, `secret bulk`, and the `secrets.required` property. Rejected:
interactive `secret put` / dashboard (opaque, undocumented); treating all three as secrets (one mechanism
but documents nothing); aligning to another project's `EMAIL_DOMAIN` convention (operator chose minimal —
Resend mandates only `RESEND_API_KEY`).
**Consequences:** Deploy fails closed without the env's secrets file; separate `.dev.vars.production` vs
local `.dev.vars` keeps dev fakes out of prod. **Also surfaced + fixed** a latent bug: the `DEC-008-1`
deploy guard (`assert-worker.mjs`) read `dist/client/wrangler.json`, but `@astrojs/cloudflare` v14 writes
it to `dist/server/` — the guard had silently stopped working (passed only on a stale leftover). Now reads
`dist/server/`.

### DEC-012-2 — contact form via a Worker → Resend route (supersedes `DEC-004-2`'s mailto-only surface)
**Decision:** Replace the Contact page's `mailto` with a real form posting to a Cloudflare Worker route
(`src/pages/api/contact.ts`) that emails via Resend; honeypot spam trap; progressive-enhancement fetch
with a no-JS mailto fallback.
**Rationale:** Operator found the `mailto` high-friction (hands off to an often-unconfigured mail client).
Surveyed 2026 consultant-site practice (scheduling links / hosted form backends / self-hosted form); chose
self-hosted Worker → Resend to keep the "direct line, no funnel" positioning on-brand/on-domain and reuse
the edge stack. Rejected: keeping/enriching `mailto` (the friction being fixed); a hosted form backend
(e.g. Web3Forms — third-party funnel/branding, data off-domain); a scheduling link (e.g. Cal.com —
different interaction; can be an additive secondary path later). **Supersedes the mailto-only conversion
surface of `DEC-004-2`** (not the rest of that decision — so no tombstone).
**Consequences:** The site's first on-demand server route (`prerender = false`). `[SITE-CONTACT]` carries
the owed operator config (Resend key/domain, per-env secrets) and the deferred Turnstile hardening before
launch. Env wired per `DEC-012-3`.

### DEC-012-1 — `/work` case extras as a JSON data collection, separate from the prose
🔧 **Amended by `DEC-019-4` (Conv 019):** the index-card **motif** enrichment is retired — card + case-page
icons now come from the project `type` (`lib/type-icon`) and `caseExtras.icon` is removed. The JSON
collection, diagram, tools, and benefit all still stand.
**Decision:** Enrich each `/work` case with a vertical line-art **diagram** (SVG), a **tools** list, a
**benefit** line, and an index-card **motif**, driven by a JSON data collection (`src/data/case-extras.json`
+ a zod-schema'd `caseExtras` collection) kept separate from the markdown prose.
**Rationale:** Operator (idea-set item 1) wanted case imagery + a reusable, content-replaceable structure,
and asked explicitly for "a JSON file with a schema." Diagram medium (operator): operator-supplied source
images redrawn as sanitized, theme-aware, vertical line-art SVG. Rejected: extending md frontmatter (less
visible/editable as a set); raster screenshots (image weight → PERF, theme mismatch, re-identification risk
on de-identified cases); decorative stock imagery (undercuts the evidence-first "The record" tone). Mock
content shipped for all four cases pending real/NDA-approved material.
**Consequences:** A second content source beside the md collection (prose in md, structured extras in JSON)
— a mild split from `DEC-004-2`'s single-sourcing, accepted for the editability win. Client-case diagrams
stay NDA-gated (generic shape, "Sample" caption) under the `[SITE-NARRATIVE]` sign-off gate.

## Conv 011

### DEC-011-3 — nvm `default` alias set to 24.22.1 (global) over a project-scoped direnv
**Decision:** Fix the recurring "wrong Node" friction by setting the machine's nvm `default` alias to
**24.22.1** (`nvm alias default 24.22.1`). Root cause: the alias was `22.19.0`, below the project floor
(Astro ≥22.23.4, `.nvmrc` 24.22.1), so every new shell nvm-activated a below-floor Node and
`npm run verify` died in `astro check` until a manual `nvm use`.
**Rationale:** Operator confirmed nothing else on the machine needs Node 22, so the one-command global
fix is simplest and leaves the `.zshrc` "warn, don't auto-switch" choice intact. Rejected: a committed
`.envrc` + direnv (project-scoped, no global change, but needs `brew install direnv` + a `~/.zshrc` hook
per machine — more moving parts); dropping it (keep prefixing — rejected as "we are building a durable
system"). Verified a clean login shell now auto-uses v24.22.1.
**Consequences:** The alias is machine-local (`~/.nvm`), so a rebuilt/new machine must re-set it —
recorded in `_cc/repo-layout.md` § "Dev environment — Node". A session already running when the alias
changed keeps its initialized Node (this conv's shells stayed on 22.19.0, hence continued prefixing).

### DEC-011-2 — the site header is sticky
**Decision:** Make `.site-header` sticky site-wide (`position: sticky; top: 0; z-index: 50`, opaque
`--paper` background, existing bottom border) so the nav stays reachable as a visitor scrolls any page.
**Rationale:** Operator — the header scrolled off every page and a prospect should always be able to
navigate. Rejected: the non-sticky status quo.
**Consequences:** Global in `global.css`; verified light + dark on staging. `z-index: 50` floats it above
page content and the hydrated `ThemeToggle`.

### DEC-011-1 — a `/phases` self-qualification page (three phases), with on-ramps and a dual nature
**Decision:** Add a new **Phases** page (`/phases`) walking the three phases of building software with AI
— **straw man → tin man → steel man** — so a prospect can place themselves and judge the fit. Reached
via a **"Phases"** nav item (after Method) and a **Home banner** ("Where are you in building with AI?").
The phases are **dual-natured**: they describe FG's build discipline *and* map the reader's own journey
(stated in the lede, demonstrated in the close). Each phase carries a "Where I come in" help callout.
**Rationale:** Operator — the live site (Home/Method/Work) told only FG's story; nothing let a reader
locate themselves or self-qualify. The straw→tin→steel arc is grounded, not invented — it mirrors the
real prototype→rebuild→productionize progression and the SPT V1→V2→V3 history (`EVIDENCE-LEDGER.md`
calls SPT V1 the "straw man"), and it concretizes the positioning thesis's reassurance half as felt
experience. Rejected: folding it into Method (distinct job — the reader's journey, not "how I work");
not adding it (leaves the self-qualification gap). Nav label **"Phases"** chosen over "Where you are" /
"Start here" — a terse noun fits the all-noun nav set; the pull lives in the banner, which can carry a
question a nav label can't (the operator judged a phrase-label "advertising in the navigation").
**Consequences:** `src/pages/phases.astro` added; `Nav.astro` gains a sixth item; `index.astro` gains a
`.band` funnel section. Written to `VOICE.md` (humility rule) — `VOICE.md` Scope updated to list Phases.
Content is generic (no client material), so not gated on client sign-off; it rides `[SITE-GO-LIVE]` to
production like the rest of the content. Reuses the existing `.prose blockquote` ember rule for the
callouts (no new CSS).

## Conv 010

### DEC-010-3 — Home hero leads with the business identity + a 44-year differentiator
**Decision:** Restructure the Home above-the-fold so the top headline states the **business** —
"Software development — built with AI, kept on course." The method sentence ("I plan, then steer — AI
drives development, and I course-correct where it's needed") is demoted and then replaced by a **44-year
client-experience differentiator** line ("Let 44 years of building software for clients guide your own
project"), with a small headshot beside it; the method is carried visually by the hero **flow sequence**
(Plan → Steer → AI drives → Course-correct). A "meet Fraser" teaser band (headshot + About link) was
also added lower on Home.
**Rationale:** Operator, Conv 010 — the above-the-fold neither identified the business (a scanner
couldn't tell it was a software developer's site) nor differentiated him from other AI shops. Leading
with the discipline + "44 years" (verifiable, consistent with About) fixes both and ties to the "build
your own software" thesis. Rejected: carrying the business identity in the eyebrow (operator: eyebrows
shouldn't hold the important reader clue); keeping the method line as the h1 (it describes *how*, not
*what*).
**Consequences:** Home `index.astro` hero rebuilt; the `.flow` stepper + `.headshot` placeholder stand
up here. The "44 years" number must stay consistent with About (currently 44, from ~1982). The
differentiator depends on the real headshot (now `public/fraser.jpg`).

### DEC-010-2 — Voice gains a humility rule: seasoned, not above the reader or the field
**Decision:** Add a **Humility** section to `reference/VOICE.md` (extends `DEC-009-5`): avoid the
"I know…" / "I catch what others miss" / "…before you do" / "what a cheaper X can't do" framing — write
from "I'm good at this, I'm seasoned, here's how I can help you." Reframe the existing copy site-wide to
match (main pages, the four Work cases, the footer).
**Rationale:** Operator, Conv 010 — "I am not a person that would say 'I know x, y, z'. It sounds
boastful." Grounded, checkable specifics should carry credibility instead of a comparative/superior
claim. Rejected: leaving `DEC-009-5`'s standard as-is (it bans hype but not the subtler "above-others"
framing the operator flagged).
**Consequences:** `VOICE.md` Humility section added; Home cards, Method, footer, and Work cases
reframed; the `learning-marketplace` unproven "far higher completion than typical" line dropped (also a
`DEC-009-5` candor fix — the project is pre-launch). Copy work is tracked under `[SITE-NARRATIVE]`.

### DEC-010-1 — Visual direction A (warm-editorial) shipped; ember-as-text uses `--accent-strong` for AA
**Decision:** From three mocked directions, implement **A — warm-editorial**: deepen the light palette
so the warmth reads to the eye (paper `#faf7f2`→`#f2e8d7`, surface/line/accent-tint likewise); bring the
ember in as a disciplined accent (eyebrows + lead-rule, card icon chips, Work arrows, back-link, icons).
**Ember used as text moves to `--accent-strong`; ember as fill stays `--accent`.**
**Rationale:** Operator critiqued the Conv-009 render as "AI-default" near-monochrome, imageless. A
directly fixes warmth/accent/icons/imagery while honoring the locked editorial brief (`DEC-004-5`).
Rejected: B (ember & ink / signal) — the mono labels + hard edges read younger/more engineered, which
`DEC-004-5` weighed against; C (ink-first / dark premium) — too gallery/agency for an SMB-owner
audience. The text/fill split was **forced by measured contrast**: ember `#b45309` on the deeper paper
is 4.14:1 (fails AA for small text); `--accent-strong` `#92400e` is 5.84:1 (passes).
**Consequences:** Evolves `DEC-004-6`'s light palette values (not a supersede — same ramp, deepened);
`global.css` gains `.card-icon` / `.band` / `.hero-portrait` / `.flow` / `.headshot`; new `Icon.astro`;
`ThemeToggle` + nav icons; nav-active/`.btn-link`/prose links moved to `--accent-strong`. Deployed to
staging; feeds `[SITE-PERF]` (image optimization) and `[SITE-SEO]` (`og:image`).

## Conv 009

### DEC-009-5 — One documented site voice: Fraser to a client in a first meeting, lightly-warmed and candid
**Decision:** Every page adheres to a single voice/tone, documented in `reference/VOICE.md`: first person
as if Fraser is speaking to a prospective client in a first meeting; the **lightly-warmed** register
(contractions, plain verbs, measured but human); **candid** to the point of naming what went wrong (the
`this-site` "The record" block is the exemplar). No marketing superlatives/hype/AI-default cadence; no
engineer-speak at a business-owner reader.
**Rationale:** Operator's call, Conv 009 — he wanted "the whole site with the same voice and candor — as
if I was talking directly to them in my initial meeting with a client," with the warmth "documented and
adhered to." Losers: the sparer and the more-performative register options (both rejected for About
earlier this conv); leaving voice implicit/per-page (lets the AI-default cadence creep back — the exact
thing the operator flagged). A machine-enforceable voice config *in the site repo* was considered and
deferred (no need yet).
**Consequences:** `reference/VOICE.md` is the standard all `[SITE-NARRATIVE]` copy and every
`[SITE-ASSESS]` "The record" block follow. The Conv-009 copy predates the written standard, so a
whole-site re-pass against it is queued for next conv ("C").

### DEC-009-4 — "The record": an independent, evidence-cited assessment of Fraser's steering on each Work project
**Decision:** Each Work case carries a **"The record"** block — an independent read of that project's own
docs repo answering, with citations a reader could check: how big the project was (**convs first**), where
Fraser steered or overruled the AI (**including where he did NOT steer well**), and how well he planned.
Produced by a **fresh subagent per repo** (independent; keeps the big read out of the main context). Full
candor — documented misses stay. Client-project assessments are de-identified like the cases.
**Rationale:** Operator's call, Conv 009 — the site claims the work is checkable, so substantiate it:
"ask the docs repo for that project for an assessment of what my value was. Did I plan well? Did I
steer." On-thesis: an AI independently assessing the human's steering is itself the proof; what makes it
verifiable is the cited record, not the AI's authority. Losers: a self-written assessment (not
independent); owned-projects-only (the client repos aren't publicly openable — asymmetry accepted because
the de-identified narrative is still the asset); hiding the misses (less credible, not more). Piloted on
`fgw-26`, then rolled out to `redline` + the two client cases.
**Consequences:** four "The record" blocks live (Conv 009). Standing approach for any future Work case.
Client-case blocks are also part of what the client signs off before production (`DEC-009-2`).

### DEC-009-3 — Critical path gains Phase 3 (findable & fast); go-live becomes Phase 4
**Decision:** The critical path adds **Phase 3 — Findable & fast**: `[SITE-SEO]` (site URL, sitemap,
robots.txt, canonical, og:image, `schema.org` JSON-LD), `[SITE-AI-SEO]` (llms.txt, structured facts,
AI-crawler policy), `[SITE-PERF]` (Lighthouse/CWV + budget, image optimization) — plus `[SITE-VISUAL]` as
pre-go-live polish. `[SITE-GO-LIVE]` (production + domain) becomes **Phase 4**.
**Rationale:** Operator asked (Conv 009) whether the plan handled SEO, AI SEO, and page speed; an audit
found none were explicit plan items (SEO was cited only as the rationale for the multi-page IA,
`DEC-004-2`) and the delivered visuals read "AI-default." These belong in place before the domain points
at production. Losers: leaving them implicit / post-launch; a "Phase 2.5" insert (rejected — renumbered
cleanly instead).
**Consequences:** rows `[SITE-SEO]` / `[SITE-AI-SEO]` / `[SITE-PERF]` / `[SITE-VISUAL]` opened;
`[SITE-GO-LIVE]` relabelled Phase 4. `[SITE-VISUAL]` is next conv's ⚡.

### DEC-009-2 — Client-case publishability: sign-off gates production only; de-identification guards dev/staging
**Decision:** The two de-identified client Work cases ship to **dev and staging freely**; **client
sign-off is required only before the production deploy** to frasergorrie.com (`[SITE-GO-LIVE]`).
De-identification (no client/org/product/source-text identity, verified by scan — including HTML comments
and the independent reads) is the guard that makes dev/staging safe; sign-off is the guard for production.
**Rationale:** Operator's call, Conv 009: "The changes you made do not need client sign off yet. That
happens before I push to production which is connected to frasergorrie.com. So go ahead and make them
live on dev." Loser: gating dev/staging on sign-off too (the initial `draft: true` treatment —
over-cautious; dev/staging are not the live client-facing domain).
**Consequences:** both client cases are `draft: false`, live on dev + staging. The case→project mapping
lives only in `fgw-26-docs`, never in the site source. Production stays gated on sign-off.

### DEC-009-1 — Site IA unchanged; the three "services" fold into a "What I do" block, no Services page
**Decision:** The built 5-page IA (Home, Work + `/work/<slug>`, Method, About, Contact) stands; the three
candidate services (prototype→production, architecture & refactoring, fractional mentorship) appear as a
light **"What I do"** block on Home rather than a dedicated Services page/route. Also settled: Home `h1`
kept ("I steer; AI drives…"); the 3 Home proof cards = catch-what-checks-miss / tell-you-when-it-isn't-
working / measure-not-guess.
**Rationale:** Operator's call ("A for now"), Conv 009. Work (evidence) + Method (how) already carry the
offering (`DEC-004-2`); a Services page is the conventional brochure move the IA deliberately avoided.
Loser: a dedicated Services page (reopens the IA — revisitable if it earns its place).
**Consequences:** no new route; a "What I do" block added to Home. The dedicated-page option stays open.

---

## Conv 008

### DEC-008-2 — A footgun/caveat noted in prose is a routing trigger: highlight + hopper
**Decision:** Any footgun, warning, caveat, or special condition CC notes in prose is treated not as a
remark but as a routing trigger: CC **(1)** highlights it in a dedicated line at the end of the turn and
**(2)** adds it to `HOPPER.md` as a `- [ ]` line. A caveat already mitigated within the same turn is
stated as resolved rather than hoppered; a live one is hoppered. Recorded as a rule line under CLAUDE.md
*Surfacing & guards*.
**Rationale:** A caveat buried in turn prose is too easy for the operator to miss — the project's whole
surfacing discipline (`DEC-000`-era "never say flag"; route every finding) exists because prose is not a
route. Operator's call, Conv 008: "a footgun … that you note in the prose is too easy to miss … and is
therefore a trigger to 1) highlight at the end of the turn and 2) add to the hopper." Losers: trusting
inline prose to carry a warning (the status quo that let the staging→production footgun sit in a
paragraph); a passive "I'll remember it" (a no-op promise by this file's own rule).
**Consequences:** CLAUDE.md *Surfacing & guards* gains the rule line. End-of-turn highlighting + hopper
capture of caveats becomes standing behavior. The hopper will carry caveat `- [ ]` lines for ruling at
`/r-hopper` / `/r-end` alongside other spin-offs.

### DEC-008-1 — Select the Cloudflare deploy env at build time via `CLOUDFLARE_ENV`, guarded by a resolved-name assertion
**Decision:** The staging/production split is driven by **`CLOUDFLARE_ENV` at build time**, not by
`wrangler deploy --env` at deploy time. `deploy:staging` = `npm run build -- --mode staging && node
scripts/assert-worker.mjs fgw-staging && wrangler deploy`; `deploy` = `npm run build && node
scripts/assert-worker.mjs fgw && wrangler deploy`. The selector lives in a committed, non-secret
`.env.staging` (`CLOUDFLARE_ENV=staging`). Env-var files are split by consumer into two maintained
families — **`.env.*`** (build-time, read by astro/vite/the Cloudflare plugin; `.env.<mode>` committable,
`.env*.local` secret/ignored) and **`.dev.vars.*`** (wrangler-dev runtime secrets, ignored; with a
committed `.dev.vars.example` template) — **not** symlinked to one source. A fail-closed guard
(`scripts/assert-worker.mjs`) reads the build output `dist/client/wrangler.json` and refuses to deploy
unless the resolved worker name matches the expected target. This **corrects the deploy-script wiring in
`DEC-007-2`** (the `fgw` / `fgw-staging` *naming* decision there stands unchanged).
**Rationale:** The `@astrojs/cloudflare` adapter flattens the wrangler env into `dist/client/wrangler.json`
at **build** time (keyed off `CLOUDFLARE_ENV`), so a `--env staging` passed to `wrangler deploy` arrives
too late and silently deploys the top-level `fgw` — which is exactly what happened on Conv 008's first
deploy (a production-named `fgw` worker, since deleted). Vite mode and `CLOUDFLARE_ENV` are independent:
`--mode staging` only loads the `.env.staging` *file*; the plugin keys off the *variable* inside it, so a
missing selector silently falls back to production (confirmed: build exit 0, no warning, resolved `fgw`).
The guard checks the actual build artifact, not a proxy, so it catches every cause (missing file, missing
var, wrong mode, typo). The two file families are kept separate because wrangler turns every key it loads
into a runtime `secret_text` binding and only reads `.env*` when `.dev.vars` is absent
(`CLOUDFLARE_LOAD_DEV_VARS_FROM_DOT_ENV` defaults true) — so a shared source would inject the build-only
`CLOUDFLARE_ENV` as a stray runtime secret and collapse the committed/ignored boundary. Losers: `--env`
at deploy (the broken `DEC-007-2` wiring); inline `CLOUDFLARE_ENV=` in the npm script (works but hides
the selector, no fresh-checkout reproducibility, no guard); a single env file symlinked into both
families (unnecessary — wrangler already falls back to `.env*` — and hazardous to the secret boundary).
**Consequences:** `fgw-26` gains `.env.staging` (committed), `.dev.vars.example` (committed),
`scripts/assert-worker.mjs`, a hardened `.gitignore` (`.env*.local`, `.dev.vars`, `.dev.vars.*`, keep
`!.dev.vars.example`), and both deploy scripts rewired to build→assert→deploy. Staging deploys verified
end-to-end at `fgw-staging.fgorrie.workers.dev` (HTTP 200); the guard verified to block a deploy on a
missing selector (exit 1). Production (`deploy`) now also fails closed unless it resolves to exactly
`fgw`. `[SITE-DEPLOY-STAGING]` done-when met. **Dev-only caveat — verified Conv 008, ruled benign:** with
no `.dev.vars.staging`, the local dev path (`getPlatformProxy`, which backs `astro dev` / `wrangler dev`)
reads `.env.staging` via the `.env` fallback (`CLOUDFLARE_LOAD_DEV_VARS_FROM_DOT_ENV` defaults true;
confirmed by wrangler's own "Using secrets defined in .env.staging" log) and exposes
`CLOUDFLARE_ENV="staging"` as a runtime binding. Harmless: local-dev only, non-secret value, and
production deploys are unaffected (the Conv 008 deploy listed only `SESSION` + `IMAGES` bindings). Left
unshielded on purpose — a `.dev.vars.staging` shield is gitignored so it would not survive a fresh
checkout, committing one would break this decision's secret boundary, and disabling the fallback is extra
machinery for a cosmetic. Known-benign.

## Conv 007

### DEC-007-2 — Deploy to brand-stable `fgw` worker names, decoupled from the yearly repo
**Decision:** The Cloudflare Worker names are the stable brand `fgw`, independent of the per-year repo
name. Production worker = **`fgw`**; staging worker = **`fgw-staging`** (a `wrangler.jsonc` `env.staging`
block). The repo `fgw-26` — and future `fgw-27`, … — is a yearly rebuild that deploys *into* these same
two workers: a new year points a new repo at the existing names rather than minting `fgw-27`-named
infrastructure. The staging URL is therefore `fgw-staging.<account>.workers.dev` (`*.workers.dev` —
option A of the `[SITE-DEPLOY-STAGING]` staging-URL ruling).
**Rationale:** The site is expected to be redone over the years; tying the deploy target to the repo
name (`fgw-26`) would churn worker names, URLs, and eventually the domain binding on every rebuild. A
stable `fgw` / `fgw-staging` pair survives the rebuilds — only the source repo changes. `*.workers.dev`
(over a `staging.frasergorrie.com` subdomain) keeps staging zero-DNS, free, and decoupled from the
Phase 3 domain cutover; frasergorrie.com stays on the live legacy site until then. Losers: keeping the
scaffold's repo-derived `fgw-26` worker name (couples infra to the yearly repo); a custom staging
subdomain now (needs the zone + DNS — premature coupling to Phase 3).
**Consequences:** `wrangler.jsonc` top-level `name` changed `fgw-26` → `fgw`; an `env.staging` block
→ `fgw-staging` added; `deploy` / `deploy:staging` scripts added to `package.json`. The production
deploy (Phase 3) and the custom-domain binding will attach to the `fgw` worker.
`[SITE-DEPLOY-STAGING]`'s open staging-URL ruling is resolved (A).

### DEC-007-1 — Adopt the fps `CURRENT-TASKS.md` format; all sections stay in one file
**Decision:** Restructure fgw's `CURRENT-TASKS.md` to the `fps-docs` board format: a header stating it
is the durable state + the `[CODE]`-mnemonic rule; a `## 🔥 Ordered — index` (⚡ = do-next one-liners
pointing to the bodies below); a `## 🎯 Critical path` sequence-and-pointers section; the full
`## 🔥 Ordered` task bodies (a substantial row leads with a plain-language `#### Status — Conv NNN`
block, dense detail below it); then `## 📋 Unordered`, `## ⏸️ Parked`, `## ✅ Completed this conv`.
**Deviation from fps:** fps splits its backlog across three files (Unordered → `UNORDERED-TASKS.md`,
doc-debt → `DOC-TASKS.md`); fgw keeps **every** section — including `📋 Unordered` — in the single
`CURRENT-TASKS.md` (`DEC-000-4`).
**Rationale:** The fps format earned its shape over ~150 convs — the index + critical-path + status-block
conventions keep a growing board scannable and give a non-author a ten-second entry point per row
(fps's `DEC-093-3`). fgw needs the same, and specifically needs the **critical-path sequence** to hold
the arc from scaffold to a live site. But fgw's board is small, so fps's file-split (its Conv-076
readability move) is not yet worth its cost (lean-process, `DEC-000-7`) — one file is still scannable.
Losers: inventing a bespoke fgw format (no reason to diverge from a proven sibling); adopting the
file-split now (premature for a small board — revisit at the trigger fps hit, ~a page per section).
**Consequences:** `CURRENT-TASKS.md` gains the index + critical-path + status-block conventions. Revisit
the file-split if the board outgrows one scannable file. `## ✅ Completed this conv` stays (emptied each
`/r-end`).

## Conv 006

### DEC-006-4 — Node 24 LTS as the project runtime, enforced by `engines.node >=24`
**Decision:** Baseline **Node 24 LTS** (`.nvmrc` = `24.22.1`), with `engines.node` raised to
`>=24.0.0` so the `predev`/`prebuild` guard (`scripts/check-node.mjs`) and `engine-strict` **refuse
anything older**. Supersedes an interim 22.23.4 pick made earlier this conv (the minimal bump to clear
Astro 7's floor; never recorded as a standing decision).
**Rationale:** Nothing in the stack imposes an upper Node bound (every dep is `>= floor`), so sitting
on Node 22 (maintenance LTS, two lines back) was only a conservative default; at project start, active
LTS is the durable runtime. Enforce the floor (chosen **B**) over the honest-minimum floor (**A**: keep
`>=22.23.4`) because the app is `private: true` — the consumer-exclusion argument for a permissive
floor doesn't apply — and the guard's purpose is to fail loud on the wrong Node, not merely suggest it.
Losers: **staying on Node 22**; **Node 26** (newest, but Current not a promoted LTS — bleeding edge for
a client site); **floor at `>=22.23.4`** (permits silent drift to untested Node 22).
**Consequences:** Node 24 ships **npm 11**, which blocks dependency install scripts by default — a
fresh `npm install` would skip the `esbuild`/`workerd` binary postinstalls and break the checkout.
Added an `allowScripts` allow-list (`esbuild`, `workerd` ×2, `fsevents`), proven by a clean reinstall.
🔴 `allowScripts` entries are **version-pinned**, so those scripts re-block on a version bump until
re-approved — a small recurring maintenance touch. `npm run verify` green on Node 24; `npm audit` clean.
The two safe bumps from the same tooling pass — `typescript-eslint` → 8.72.1, `wrangler` pin → 4.153.0
(exact) — ride here.

### DEC-006-3 — Resolve the `undici` dev-toolchain advisories with a scoped override, not `--force`
**Decision:** Add `overrides: { miniflare: { undici: "7.30.1" } }` to lift miniflare's transitive
`undici` (7.29.1, flagged) to the patched **7.30.1**, clearing all three advisories (their ranges are
`<7.30.1`).
**Rationale:** The advisories sit in `undici` **under `miniflare`** — the *local* Workers dev
simulator, not Cloudflare's production runtime. 7.30.1 is a patch bump inside miniflare's own major
(API-compatible; verified serving). Losers: **`npm audit fix --force`** (npm's own suggestion) —
downgrades `@astrojs/cloudflare` 14→12 and breaks the exact wrangler pin (`DEC-000-1`); a **global**
`undici` override — would wrongly downgrade the unrelated, current `undici` 8.12.3 elsewhere in the
tree; **dropping it** — leaves a high advisory that re-surfaces every audit.
**Consequences:** `npm audit` clean (0, prod + dev). The override is version-pinned, so a future
miniflare wanting a different `undici` major needs re-checking (revisit trigger).

### DEC-006-2 — Pin ESLint 9 / eslint-plugin-astro ^1 / TypeScript 6; latest elsewhere
**Decision:** Pin **ESLint 9** (`@eslint/js` 9 to match) and **`eslint-plugin-astro` `^1`**, and accept
**TypeScript 6.x** — all one major behind latest (ESLint 10, astro-plugin 3, TS 7). Every other package
is on latest.
**Rationale:** `eslint-plugin-jsx-a11y` (the a11y linter `DEC-003-2` chose ESLint *for*) has no ESLint
10 support, and `eslint-plugin-astro` 2.x/3.x *require* ESLint 10 — so **ESLint 9 is the only major
where jsx-a11y + astro linting coexist**; `@astrojs/check` (our `astro check` typecheck) declares
`peer.typescript "^5 || ^6"`, capping TS at 6. Loser: **bleeding-edge majors** (ESLint 10 / TS 7) —
would forfeit a11y linting or risk the typecheck gate, for no gain. Deviates from `DEC-000-1`'s "latest
package versions", which anticipated concrete scaffold-time pins. Not a **Biome** switch (`DEC-003-2`
stands — Biome has no `jsx-a11y` equivalent).
**Consequences:** Revisit triggers — bump ESLint→10 **with** astro-plugin→3 once jsx-a11y ships ESLint
10 support; bump TS→7 once `@astrojs/check` supports it. These are the *only* packages held back; all
others track latest.

### DEC-006-1 — fgw-26 scaffold architecture: static output, `light-dark()` theming, Fontsource fonts
**Decision:** Scaffold fgw-26 as Astro **`output: 'static'` + `@astrojs/cloudflare` adapter** (per-route
SSR available later via `export const prerender = false`). Light/dark via CSS **`light-dark()`** driven
by `color-scheme`, with `[data-theme]` on `<html>` overriding for the optional toggle (a no-flash inline
script persists the choice). The `DEC-004-7` component styles live as **semantic classes in one
`global.css` `@layer components`** (the single durable source). Fonts **self-hosted via Fontsource
variable** packages (Fraunces, Inter); **no mono webfont** (system mono stack for inline code).
**Rationale:** static+adapter is exactly `DEC-000-1`'s "mostly static + a Worker only if an endpoint
appears" — `/contact` is an email CTA with no server route (`DEC-004-2`). `light-dark()` states both
themes in one declaration per token (`DEC-004-5` "both first-class"), and the primary-button inversion
falls out of the `--ink`/`--paper` swap for free. Losers: **`output: 'server'` everywhere** (needless
SSR for a static site); **duplicated `@media (prefers-color-scheme)` + class-based dark blocks** (two
sources, drift-prone); **Google Fonts CDN / Astro's experimental fonts API** (runtime CDN dependency /
experimental flag) — Fontsource is self-hosted and offline; **loading JetBrains Mono** (webfont weight
for rare inline code).
**Consequences:** Five routes + `/work/[slug]` + a reserved-unsurfaced `blog` collection; `/styleguide`
renders every token/component. **Discharges the `DEC-004-6/7` "🔴 contrast not yet verified" flag:**
every required WCAG AA pair passes in both themes (computed + visual); **light accent-as-text is a thin
4.70:1 pass** (deepen `--accent` if more headroom is wanted); `--faint` is sub-AA but placeholder-only
and WCAG-exempt. Adding a server endpoint later = `prerender = false` on that page alone.

## Conv 005

### DEC-005-1 — The 👉👉👉 trigger covers every answer-expecting question, incl. the end-of-turn "what next?"
**Decision:** Extend the 👉👉👉 rule (`DEC-002-1`) in `CLAUDE.md` §Interaction model: the anchor is
required on *every question expecting an answer — ruling, pick, or aside alike, never a rhetorical one*,
not only on questions I classify as decisions. The A/B rule and the `check-ab-options.sh` Stop hook are
left unchanged.
**Rationale:** Twice in two convs I ended a turn with a bare "what next?" question (e.g. "Want me to
start it, or something else?") carrying no anchor — so the Stop hook, which only enforces the `A)`/`B)`
labels *once an anchor is present*, never fired. Root cause was wording, not the hook: the "Default is
normal conversation / no mandatory per-turn ceremony" line gave cover to treat an end-of-turn aside as
casual. The sibling projects (peerloop, fps) never miss the anchor and have **no** anchor Stop hook —
they close the loophole in the rule text (fps `DEC-005-7`: "the end-of-turn 'what next?' included"). The
losing alternative was a heuristic extension to `check-ab-options.sh` that would detect question-shaped
endings lacking the anchor — rejected as elaborate and false-positive-prone when the sibling evidence
shows the rule wording alone suffices.
**Consequences:** One line of `CLAUDE.md` changed. A rhetorical/self-answered question still takes no
anchor. Separately, surfacing that wording work exposed a latent false positive in the
`check-ab-options.sh` Stop hook: it treated **any** 👉👉👉 in the turn — including the emoji merely
quoted in prose — as the start of a question block, so a non-question turn that mentioned the anchor was
wrongly blocked. Fixed same conv: the hook now counts a 👉👉👉 **only when it begins a line** (how a real
ask is written — "👉👉👉 …" heads its line; a mid-sentence mention never does), walking lines to isolate
the block from the last anchor-headed line to end of turn. The A/B labelling rule and the Stop hook's
enforcement are otherwise unchanged; unit suite (18) + mutation suite (5, incl. a line-start-removed
mutation) green, and the original mis-firing message now exits 0 against the live hook. The rejected
alternative — a heuristic that guesses whether a turn is "question-shaped" — stays the documented
fallback only if misses recur despite the wording.

## Conv 004

### DEC-004-7 — `[STYLE-THEME]` component styles (buttons, inputs, cards, prose, nav/footer)
**Decision:** Component layer of the style guide, all driven by the `DEC-004-6` tokens + the new tokens
below. Chosen from rendered in-browser sheets; the `.scratch` mockups are illustrative only — this is
the durable source.
**Buttons** — variants **primary (ink)**, **accent (ember)**, **secondary (outline)**, **ghost**,
**link**. Primary = `--ink` fill + `--paper` text; **ember reserved for the single top conversion CTA +
accents** (not the default). Hover: primary→`--primary-hover`, accent→`--accent-strong`,
secondary/ghost→`--tint-hover`. **Focus = 2px `--accent` ring with 2px offset, site-wide.** Disabled =
45% opacity. Radius `--radius-sm`. In dark, primary inverts (light fill/dark text); accent text uses
`--on-accent`.
**Inputs (boxed)** — `--surface` bg, 1px `--line`, `--radius-sm`, 16px text, placeholder `--faint`;
focus = `--accent` border + 3px `--accent-tint` ring; error = `--danger` border + 3px `--danger-tint`
+ message; label Inter 500 / 13px; help & error text 12.5px.
**Cards/surfaces** — `--surface` fill, 1px `--line`, `--radius-md`, **no shadow**; interactive cards
hover → border `--accent` (no lift).
**Prose** — body `--body`/`--muted` at ~62ch; links `--accent` (underline-offset 3px) → `--accent-strong`;
`ul/ol` disc; blockquote left 3px `--accent` rule, `--subtle`, no italics; inline `code` in `--font-mono`
on `--code-bg`; `hr` 1px `--line`.
**Nav/footer** — header `--paper` + hairline underline, Fraunces brand, nav links Inter 14px `--subtle`
→ hover/active `--accent`; footer `--surface`, columnar, small `--subtle` text.
**Misc** — breakpoints Tailwind defaults (640/768/1024/1280); motion 150ms ease on hover/focus + Astro
View Transitions (subtle cross-fade), all behind `prefers-reduced-motion`.
**New tokens (light values; dark mirrors per `DEC-004-6`):** `--on-accent #fff` · `--primary-hover
#332e27` · `--tint-hover #f1ece3` · `--danger #b4231a` · `--danger-tint #fbeceb` · `--radius-sm 4px` ·
`--radius-md 8px` · `--radius-lg 12px` · `--font-mono "JetBrains Mono",ui-monospace,…` · `--code-bg
#f0ebe2`. Dark values for `--on-accent #1b1712` · `--primary-hover #e4ddd0` · `--tint-hover #2b251d`;
dark `--danger*`/`--code-bg` to be set at scaffold.
**Rationale:** Hairline-only, no drop shadows, ember-as-rare-accent — all serve the "quiet authority /
editorial" direction (`DEC-004-5`) and keep the warm accent powerful by scarcity. Boxed inputs over
underline for clarity on a contact form. Primary=ink over ember so the accent stays a signal, not noise.
**Consequences:** Completes the `[STYLE-THEME]` **design** (direction `DEC-004-5` + tokens `DEC-004-6` +
components here). Remaining is **implementation** as Tailwind v4 `@theme` + components at
`[SITE-SCAFFOLD]`, the canonical **`/styleguide` page**, and a **live review** — where WCAG AA contrast
(ember-on-paper, `--muted` tiers, `--danger`) is verified and nudged as needed.

### DEC-004-6 — `[STYLE-THEME]` concrete token values (fonts, palette, scale)
**Decision:** Finalise the stand-ins from `DEC-004-5` into concrete tokens (all chosen from in-browser
specimens). These are the durable source — the `.scratch/style-*.html` mockups are illustrative only.
**Fonts:** headings **Fraunces** (variable, optical-size, weight 500); body/UI **Inter** (400/500/600).
No mono in the theme (add only if a later need appears).
**Palette (CSS-variable tokens) — light:** `--paper #faf7f2` · `--surface #fffdf9` · `--ink #1c1a17` ·
`--muted #44403a` · `--subtle #6b6459` · `--faint #9a9087` · `--line #e7e1d8` · `--accent #b45309` ·
`--accent-strong #92400e` · `--accent-tint #f6ead9`.
**Palette — dark:** `--paper #1b1712` · `--surface #241f18` · `--ink #f3eee5` · `--muted #cabfb0` ·
`--subtle #9a8f80` · `--faint #6f6557` · `--line #342e25` · `--accent #f0a53f` ·
`--accent-strong #f6b85e` · `--accent-tint #2a2114`. Accent derived from the legacy amber `#ffae1a`
(deepened for light, lifted for dark).
**Type scale (base 16px):** `--display clamp(2.75rem,5vw,3.75rem)` lh 1.08, -0.01em ·
`--h2 clamp(2rem,3.5vw,2.5rem)` lh 1.12, -0.005em · `--h3 1.6rem` lh 1.2 · `--h4 1.3rem` lh 1.3 ·
`--lede 1.25rem` lh 1.6 · `--body 1.0625rem` lh 1.65 (~42ch measure) · `--small 0.875rem` ·
`--eyebrow 0.75rem` +0.14em uppercase (Inter 600). All headings Fraunces 500.
**Spacing:** adopt Tailwind v4's default 0.25rem scale; section rhythm token `clamp(4rem,8vw,8rem)`.
**Rationale:** Each value was judged on a rendered specimen in-browser, not from a swatch list
(`DEC-000-7` verify-in-product, applied to design). Fraunces+Inter chosen over Newsreader/Source
Serif 4/Spectral (heading) for distinctiveness + warmth at seniority. Warm neutrals + a single ember
accent keep the palette disciplined and tie to the legacy without inheriting its brightness. The
modular scale gives a clear, even hierarchy at an editorial measure.
**Consequences:** These become the Tailwind v4 `@theme` definitions at `[SITE-SCAFFOLD]`. 🔴 **Contrast
not yet verified** — accent-as-text and the muted tiers must be checked against WCAG AA at scaffold
(`jsx-a11y` + manual), and nudged if any tier fails. `[STYLE-THEME]` design is now complete (direction
`DEC-004-5` + these tokens); only implementation remains, folded into `[SITE-SCAFFOLD]`.

### DEC-004-5 — Visual direction: "quiet authority / editorial craft"
🔧 **Tokens finalised in `DEC-004-6` (Conv 004):** the Fraunces/Inter + hex stand-ins here are now
concrete values there.
**Decision:** fgw-26's visual personality is **direction A — quiet authority / editorial craft**:
- **Editorial serif headings** + **clean humanist sans body** (Fraunces / Inter shown as stand-ins).
- **Warm neutral palette** — off-white "paper" ground + near-black ink + **one disciplined accent**, an
  ember/ochre that **evolves the legacy amber** (`#ffae1a`) rather than discarding it (continuity +
  seniority).
- Generous type scale, roomy spacing, legibility-as-aesthetic (mirrors the honesty frame).
- **Light and dark both first-class**, via Tailwind v4 CSS-variable tokens (`DEC-004-3`).
- Exact font families, colour ramp, type scale and spacing are **not yet fixed** — the fonts/hexes in
  the Conv 004 mockup (`.scratch/style-directions.html`) are illustrative stand-ins; finalising them is
  the next `[STYLE-THEME]` step.
**Rationale:** Chosen from a **rendered side-by-side mockup** (A vs B, real evidence-based copy, viewed
in-browser) rather than labels. A differentiates hardest from both the dated coaching-era legacy *and*
the saturated field of mono-accented dev-portfolio sites, and the "seasoned judgment for business
owners" thesis (`DEC-000-6`) is carried better by editorial warmth than by builder-minimal signalling.
Rejected: **B — engineered minimal** (stronger for overt technical signalling but reads younger/more
generic); **C — hybrid** (unnecessary once A was decisive).
**Consequences:** `[STYLE-THEME]` direction is locked; the remaining work is concrete **token values**
(palette ramp incl. dark, final serif+sans families with weights, type scale, spacing) on Tailwind v4
`@theme`. Feeds `[SITE-SCAFFOLD]` (tokens stood up at scaffold) and sets the visual frame for
`[SITE-NARRATIVE]`. The legacy amber is evolved, not dropped; the legacy playful faces (Comfortaa,
Raleway Dots) are retired.

### DEC-004-4 — Claude runs `/r-commit` autonomously on its own judgment
**Decision:** Claude may run `/r-commit` **without asking**, on its own judgment, whenever meaningful
and relatively self-contained work has been completed. (`/r-commit` was already a standing right in
`CLAUDE.md`; this grants autonomous *timing* — no per-commit approval.) `/r-end` still needs explicit
approval and remains the only operation that pushes.
**Rationale:** Operator grant, Conv 004. Mid-conv commits are local-only and reversible, so the
per-commit ask was friction without a safety payoff. Rejected: continue asking before each mid-conv
commit.
**Consequences:** Claude picks commit points; it still stages **CC-authored paths by name** (never
`git add -A`), uses the `fgw-1` message format under the current conv number, never touches
`frasergorrie`, and never pushes. Full operator review remains at `/r-end`.

### DEC-004-3 — Do not adopt shadcn/ui; Tailwind v4 CSS-first theming instead
**Decision:** Resolve `DEC-000-1`'s open "shadcn under consideration" clause **against adoption**. The
token/theming layer is **Tailwind v4 CSS-first `@theme`** (CSS-variable tokens) directly. The few
interactive pieces (mobile nav; optional theme toggle, image lightbox, contact form) are built as
**CSS-only or tiny vanilla/React islands**. shadcn is deferred to a **per-component, island-scoped
trigger**: pull in a *single* shadcn component only if/when a genuinely complex interactive component
appears, and then only that one.
**Rationale:** After `DEC-004-2` the site is mostly-static lead-gen with minimal interactivity, so
shadcn's React/Radix components cost hydration weight for little benefit and fight Astro's near-zero-JS
strength (`DEC-000-7` lean). shadcn's two offerings are separable — its CSS-variable theming convention
is the only part that applied here, and Tailwind v4's CSS-first `@theme` already delivers that natively,
so the attraction is obtained without the React tax. Rejected: **adopt shadcn now** — premature weight;
polish and a11y come from design + the `jsx-a11y` lint (`DEC-003-2`), not from shadcn specifically.
**Consequences:** The Astro + Workers + Tailwind v4 stack (`DEC-000-1`) stands unchanged; only the
shadcn question resolves. `DEC-003-2`'s conditional "if `[STYLE-THEME]` picks shadcn, lift fps's
`vitest.setup.ts` jsdom-hardening" **does not fire** — simpler jsdom test setup, revisit only if the
per-component trigger later pulls in a Radix component. `[STYLE-THEME]` builds its theme on Tailwind v4
`@theme` tokens; interactive islands stay minimal and island-scoped.

### DEC-004-2 — fgw-26 launch information architecture (page set + scope)
**Decision:** The launch site is these routes (multi-page, per `DEC-004-1` as amended below):
- **`/`** — home: hero (the "I steer; AI drives — and I know when to overrule it" helmsman thesis), the
  "sustained partnerships, not a portfolio grid" reframe, condensed proof-points, work teasers, a
  testimonial, and the contact CTA.
- **`/work`** — a rich index of **summary cards** (problem → outcome → proof), each **single-sourced**
  from its case's own excerpt; plus **`/work/<slug>`** detail pages where the full case text lives
  **once**. (Resolves A/B "both": rich index + detail pages, no full-text duplication.)
- **`/method`** — the working method + honesty/verification frame (from `WORKING-METHOD.md`); the key
  differentiator, successor to legacy `how-i-work`.
- **`/about`** — bio, 44 years, longevity, repositioning-as-adaptability.
- **`/contact`** — the **sole** conversion surface: email CTA, no checkout.

Scope calls: **(1) Commerce dropped** — no Stripe; the legacy SKU / `_agreement` / `-purchase-thanks`
pages are retired; this is a positioning/lead-gen site. **(2) Blog/podcast deferred from launch but
planned-for** — reserve the `/blog` route and stand up the Astro content-collection pattern at scaffold
so a blog is an *additive* insertion later, not a restructure; it is not surfaced in nav or launched
now. **(3) `/spa` reservation abandoned** — amends `DEC-004-1`.
**Rationale:** Page set follows the evidence base (`discovery/EVIDENCE-LEDGER.md`): the 6 proof-points
and the five showable projects are the spine, framed for business owners not engineers. Alternatives
that lost: **keep coaching/commerce** — rejected, the new thesis is software judgment/partnership not
coaching, and dropping it also removes the Stripe-key reuse risk the ledger flags; **single `/work`
page, or full-content on both index and detail** — rejected, duplication splits SEO signal
(cannibalization) and drifts, whereas single-sourced summaries give best-of-both; **ship a blog now** —
rejected, the legacy blog is 3 years dormant with no current content and an empty blog reads worse than
none, but it is cheap to design for. **`/spa` long-scroll** — abandoned by the operator once the
multi-page SEO/scale case landed; single-page offered nothing multi-page didn't.
**Consequences:** `[SITE-SCAFFOLD]` stands up five routes + a `/work/<slug>` content collection + a
reserved (unsurfaced) blog collection. `[STYLE-THEME]` designs nav for the four/five top-level items
with the blog planned as a sixth. `[SITE-NARRATIVE]` produces hero/thesis copy, per-case
summary+detail, the method narrative, and bio — all client material **de-identified** per the
publishability map before publish; case studies are gated on that de-identification, so start with the
most showable (`redline` is fully clear) and add as each clears. No payments surface, no Stripe deps.

### DEC-004-1 — Site structure: multi-page primary + reserved `/spa` long-scroll view
🔧 **Amended by `DEC-004-2` (Conv 004):** the reserved-`/spa` long-scroll clause is **dropped** (operator
abandoned the single-page variant). The multi-page-primary decision and single-sourced-section-component
practice below still stand; only the `/spa` consumer is gone.
**Decision:** fgw-26 is a **multi-page site** as its primary structure — real Astro routes
(`/`, plus topic pages), with View Transitions (`<ClientRouter>`) for SPA-smooth navigation where it
helps. Build each content block as a **single-sourced Astro section component**, so routes compose
subsets of a shared component library. **Reserve a `/spa` route** that assembles all sections into one
long-scroll page — a *secondary view of the same source*, not a separate build. `/spa` earns its keep
only if a real job emerges (read-it-all-on-one-page / print-friendly / single-link-to-share); if none
does it can be dropped with zero content loss, and if single-page later wins outright its content is
promoted to `/`.
**Rationale:** SEO is the tie-breaker for a broad-appeal marketing site — multi-page gives each topic
its own URL/`<title>`/meta/OG and ranks per theme, and scales cleanly as content grows. Alternatives
that lost: **(a) single long-scroll landing page as primary** — rejected because one URL caps the SEO
surface and scales poorly, but retained as the `/spa` view at near-zero marginal cost; **(b) true
client-routed SPA (React Router)** — rejected: fights Astro, forfeits per-page static output, no
marketing upside; **(c) defer the decision until content is sized from `EVIDENCE-LEDGER.md`** — operator
chose to decide on strategic intent now (`B` offered, `A` taken), so content volume is demoted from a
blocker to a revisit trigger. Single-sourced section components make the two views cost almost nothing
and keep them from drifting (ties `[SITE-NARRATIVE]`). Independent of the shadcn/CSS-variable question
(`DEC-000-1`).
**Consequences:** `[SITE-SCAFFOLD]` stands up a multi-route Astro app with `<ClientRouter>` and a
section-component library; `[STYLE-THEME]` designs a multi-page IA + nav, not just one page. `/spa` is
reserved from scaffold time as an assembled view; its fate (keep / drop / promote to `/`) is decided
once content and a concrete use-case are known. **Revisit trigger:** if `EVIDENCE-LEDGER.md` yields too
little for several substantial pages, collapse to single-page (promote `/spa` to `/`). **Watch item:**
two navigation models (route-links vs anchor-scroll) must stay single-sourced to avoid drift. Feeds
`[SITE-NARRATIVE]` (copy single-sourced per section) and shapes `[STYLE-THEME]`.

## Conv 003

### DEC-003-2 — fgw-26 testing strategy (all layers)
**Decision:** Adopt one testing strategy across layers, most infra standing up at `[SITE-SCAFFOLD]`:
- **Unit/integration:** Vitest, co-located `*.test.ts`, kept thin (a marketing site has little logic).
  Add a `better-sqlite3`-as-D1 in-memory helper (Peerloop/fps pattern) **only if/when** the site reads
  or writes D1 — not before.
- **UI/component:** React Testing Library on Vitest/jsdom, testing the **interactive React islands
  only** (static Astro markup is eyeballed via the bridge, not unit-tested). If `[STYLE-THEME]` picks
  shadcn/ui, lift fps's `vitest.setup.ts` jsdom-hardening (Radix `ResizeObserver`/`matchMedia`/
  pointer-capture) wholesale.
- **Browser/e2e:** `/chrome` bridge is the live tool (ad hoc). PLATO deferred (`DEC-003-1`); Playwright
  deferred until real flows exist and then kept to a tiny genuinely-gating set (not left to rot as
  Peerloop's did).
- **Harness CLI/scripts:** hand-rolled POSIX `sh`/bash harnesses + a `test-harness.sh` aggregator;
  **mutation-check the guards** — each guard test names, in a comment, the deliberate break it must
  catch, verified to fail on it.
- **Gates/CI:** npm `verify` = lint + typecheck (`tsc --noEmit`) + test + build as the commit-safety
  command; **ESLint (flat) + Prettier** for `eslint-plugin-jsx-a11y` + `react-hooks`; GitHub Actions
  deferred to `[SITE-SCAFFOLD]`/deploy; no TZ-matrix.
- **Discipline:** keep the `[checked:]` tags + re-run-baseline-this-conv rule (`DEC-000-7`); treat the
  bridge-rendered DOM as ground truth (Peerloop's "only a DOM check exposed the empty feeds" lesson).
**Rationale:** Vitest + RTL/jsdom is the unanimous sibling default and native to the Astro/Vite/Workers
stack. Choices made against alternatives: **ESLint+Prettier over Biome** (Biome is leaner and fps uses
it for its core, but a public "broad-appeal" marketing site makes `jsx-a11y` accessibility linting
load-bearing, and that's an ESLint plugin — revisit if a11y linting underdelivers); **hand-rolled bash
over bats/shunit2/`node:test`** (zero new deps; our scripts are shell and we already have one such test,
`check-ab-options.test.sh`); **mutation-checking the guards but skipping spt's full `*.mutants.json`
formalism** (discharges our own "an unproven guard is unproven however green" rule at the lean end);
**CI deferred** (fps ships with none; add it with a deploy target, as Peerloop/spt did). Thin-by-default
and island-only testing keeps this from over-building for a mostly-static site (`DEC-000-7`).
**Consequences:** Two board rows created — `[HARNESS-TESTS]` (actionable now) and `[SITE-TEST-SETUP]`
(parked on `[SITE-SCAFFOLD]`). Most of the stack materialises at scaffold time; the harness aggregator +
mutation-checked guards can proceed independently now. Every deferral (PLATO, Playwright, CI, D1 test
helper) sits behind a named trigger (here and in `_cc/PLATO.md`). Complements `DEC-003-1`; not a
supersession.

### DEC-003-1 — Defer PLATO for fgw-26; document the adoption playbook
**Decision:** Do not build a PLATO-style journey runner for fgw-26 now. Start browser/UI testing with
Vitest + React Testing Library on jsdom for components, and the `/chrome` bridge used ad hoc for visual
checks. Capture the full "what PLATO is / when to adopt / how to adopt" playbook in `_cc/PLATO.md` so
the deferral is revisitable. Browser testing still models on Peerloop's quadrant division of labour
(unit/API → PLATO → bridge-scripted UI walk → sparse Playwright) — only the PLATO layer is deferred.
**Rationale:** PLATO (Peerloop's Platform Action Test Orchestrator) proves that one endpoint's output
is valid input to the next across a *deep, data-accumulating* user journey; its value scales with
journey depth. fgw-26 is a marketing site whose journeys are thin (view → read → CTA/contact), so the
full runner/persona/scenario/`SqlTopUp` apparatus is unjustified weight (`DEC-000-7` lean). Rejected:
A) adopt the full four-layer model incl. PLATO from the start (apparatus over-built for current scope);
B) borrow only the pattern now — PLATO-style step defs scripting the `/chrome` bridge walk — without the
runner (still premature with no real journeys; retained in `_cc/PLATO.md` as the *middle path* to reach
for first once journeys appear).
**Consequences:** Near-term UI verification is an ad-hoc bridge walk, not a scripted/repeatable one — a
known gap, with the trigger conditions for closing it recorded in `_cc/PLATO.md` (a server-gated
multi-step journey, a need for realistic seed data, or the bridge walk becoming repetitive/regression-
prone). The Peerloop quadrant model is adopted as fgw-26's browser-testing frame minus the PLATO layer.
Revisit at `[SITE-SCAFFOLD]` and whenever a trigger fires.

## Conv 002

### DEC-002-1 — A/B Stop guard: read `last_assistant_message`, assess only the ask block
**Decision:** `check-ab-options.sh` no longer parses the transcript. It reads the turn text from the
`last_assistant_message` field CC passes to the Stop hook, isolates the **ask** — everything after the
*last* `👉👉👉` anchor (`${text##*"$anchor"}`) — and requires both an `A)` and a `B)` label within that
block. A durable 15-case test suite (`.claude/hooks/check-ab-options.test.sh`) covers the behaviour.
DEC-001-1's decision (enforce A/B via a Stop hook) still stands; only the mechanism changes — this is
not a supersession.
**Rationale:** The Conv-001 hook used `tail -n1` on the transcript, which CC writes asynchronously and
lags behind the live conversation (documented behaviour). Observed live in Conv 002: it read a prior
`thinking` record (empty text → silent miss, the false negative) and, on the next turn, a stale earlier
message (fired citing the wrong turn, the false positive). `last_assistant_message` is the documented,
race-free source. Separately, scanning the whole message let a stray `A)`/`B)` in lead-up prose satisfy
the guard; scoping to the ask block targets the actual question, and using the *last* anchor (not the
first) keeps a `👉👉👉` merely mentioned in prose from mis-targeting it. Rejected: B) keeping transcript
parsing with a flush-wait (still racy, version-dependent); C) a `MessageDisplay` pre-render hook
(display-only — cannot block or regenerate the turn or change what the model sees, confirmed from the
CC hooks docs); D) splitting on the *first* anchor (a prose mention mis-targets the block — caught in
live verification, not by the tests).
**Consequences:** The A/B convention tightens: labelled options must sit in the trailing ask block —
**anchor first, then `A)`/`B)`** — so options listed *above* the anchor now (correctly) count as
non-compliant. The guard remains after-the-fact: it forces a corrective re-ask but cannot revise an
already-displayed turn (no CC hook can — the only pre-display hook, `MessageDisplay`, is display-only).
Re-run the test suite after any change to the hook. DEC-001-1 is not tombstoned; its handle still
resolves.

## Conv 001

### DEC-001-2 — Capture the operator's turns verbatim via a UserPromptSubmit hook
**Decision:** A `UserPromptSubmit` hook (`.claude/hooks/capture-turn.sh`) appends each operator prompt
verbatim as one JSON line to the untracked `.conv-turns.jsonl`; `/r-end` renders those into a per-conv
dialogue companion (`docs/convs/.../Conv NNN — dialogue.md`, specced in `reference/CONV-FORMAT.md`) and
deletes the `.jsonl`. The hook gates on `.conv-current`, writes only to files (never stdout — a
UserPromptSubmit hook's stdout enters context), and fails open.
**Rationale:** `## Progress` only summarizes; the back-and-forth that shapes the project was being lost
(Conv 000's companion was hand-built). Surveyed all three siblings: FPS captures nothing (what fgw
inherited); Peerloop uses a manually-maintained `.scratch/conv-turns.md` plus a separate transcript
viewer; SPT auto-captures via a `UserPromptSubmit` hook. Chose SPT's hook model — capture must not
depend on live discipline (the thing that failed on A/B this same conv). Rejected: B) Peerloop's
manual log; C) a transcript-scraping viewer tied to CC's undocumented JSONL format.
**Consequences:** New hook + a `/r-end` render/drain step + a `CONV-FORMAT.md` companion spec (weighed
against `DEC-000-7`: lean — one `jq`-writing shell hook, not SPT's multi-type `event.js` Node system).
Capture only runs inside an open conv. If CC's UserPromptSubmit payload shape changes, the hook's
`.prompt` read breaks — health-logged to `.scratch/hook-health.log`, not silent.

### DEC-001-1 — Enforce the A/B question format with a Stop hook, not willpower
**Decision:** A project Stop hook (`.claude/hooks/check-ab-options.sh`, registered in
`.claude/settings.json`) inspects the last assistant turn; if it ends with a `👉👉👉` question but
presents no labelled `A)`/`B)` options, it blocks the stop (exit 2) and feeds the lapse back to be
re-asked. The `👉👉👉` anchor (CLAUDE.md "Interaction model") is the detection handle. Permission asks
count — every `👉👉👉` question must offer labelled options. The hook fails open and has a
`stop_hook_active` loop guard (at most one forced correction).
**Rationale:** The A/B rule already lived in `CLAUDE.md` and was still violated in-conv; "I'll apply
it going forward" is the same judgment that just lapsed, so only a check outside that judgment is
worth anything. Rejected: B) relying on manual enforcement (the trust that already failed).
**Consequences:** New process artifact (weighed against `DEC-000-7` lean-process: small, single-purpose,
self-testing). Takes effect once the session reloads hook config. If the anchor convention changes,
the detection handle changes with it.

---

## Conv 000 — bootstrap (manual setup, predates the lifecycle)

### DEC-000-7 — Keep the process lean by policy
**Decision:** The conv/documentation methodology is kept deliberately lean. Prune `CLAUDE.md` past
~120 lines; treat the documentation apparatus as a cost; verify in the running product, not just in
tests; a green check is not proof.
**Rationale:** The sibling projects' scars: SPT cut its `CLAUDE.md` 96% (1,009→41 lines) after it
over-grew, and in one stretch its harness out-committed its product 22:2; Peerloop shipped a silent
14% icon shrink because a page was never live-verified. The method should practice what the new site
preaches. Rejected: porting fps's full ~150-line rule set and five-skill surface verbatim.
**Consequences:** Skills and `CLAUDE.md` are trimmed adaptations, not copies; `r-vocab` and the
vault/sensitive/MCP machinery were dropped; `dep-check`/`dist-check` deferred until `fgw-26` exists.

### DEC-000-6 — Site thesis: judgment over commoditized code
**Decision:** The new frasergorrie.com positions Fraser as the "route planner and helmsman" whose
44 years of judgment steer AI-driven development — understanding client needs and knowing when a
solution will actually work. It retires the legacy site's "NoCode-First for everything" framing and
updates "40 years" to 44.
**Rationale:** In the AI age, writing code is commoditized; judgment is not. The evidence base
(`discovery/`) supports the judgment thesis far better than a capabilities list. Rejected: carrying
forward the NoCode-strategist positioning (dated, and undersells the differentiator).
**Consequences:** Site copy is built from the `EVIDENCE-LEDGER.md` proof-points; messaging must avoid
reading as "not technical." Style/theme to be decided separately (marketing site, broad appeal).

### DEC-000-5 — Full decisions + learnings + generated digest from day one
**Decision:** `DECISIONS.md` (numbered, tombstoned), per-conv learnings records (`docs/convs/`), and
the generated `DECISIONS-DIGEST.md` are all set up from the start — not deferred until the record is
large.
**Rationale:** Going back into the decision record to chart local choices is where both parties
benefit; the digest is how that scan stays cheap as the record grows. Rejected (my initial
recommendation): defer the digest until the record is big — the user wants the mechanism in place from
conv one.
**Consequences:** `gen-decisions-digest.sh` ported and run from Conv 000; `/r-end` regenerates the
digest whenever `DECISIONS.md` changes.

### DEC-000-4 — Single-file task board to start
**Decision:** The board is one file, `CURRENT-TASKS.md`, with sections 🔥 Ordered / 📋 Unordered /
⏸️ Parked / ✅ Completed this conv.
**Rationale:** A new, small project does not need fps's two-file Ordered/Unordered split; lean first.
Rejected: fps's `CURRENT-TASKS.md` + `UNORDERED-TASKS.md` split.
**Consequences:** Split into two files only if the single board demonstrably earns it.

### DEC-000-3 — Conv lifecycle adapted from fps (most current)
**Decision:** The session methodology is adapted from **fps**, the most current of the sibling
lifecycles: skills `r-start` / `r-commit` / `r-end` / `r-hopper`, plus `conv-state.sh` and
`gen-decisions-digest.sh`. Skill names kept as-is.
**Rationale:** fps is the latest iteration of the pattern used across fps/Peerloop/SPT. Keeping the
names avoids needless divergence. Rejected: rebranding the skills; porting from the older
Peerloop/SPT variants.
**Consequences:** `r-vocab` (fps PKM-specific) not ported; vault/sensitive-egress/MCP machinery and
the decile/sweep scaffolding dropped; the global `SessionStart` machine-detection hook is reused.

### DEC-000-2 — Dual-repo control
**Decision:** `fgw-26-docs` is the project home and governs the website code repo `fgw-26`; the
lifecycle commits and pushes both. `frasergorrie` (the legacy site) is read-only reference and is
never committed or pushed by the lifecycle.
**Rationale:** Mirrors the proven `fps-docs`/`fps`, `peerloop-docs`/`Peerloop`, `spt-docs`/`spt`
pattern. Rejected: a single combined repo; treating `fgw-26` as the home.
**Consequences:** `--add-dir ../fgw-26 --add-dir ../frasergorrie` on launch; skills stage by name
across the two owned repos only.

### DEC-000-1 — Tech stack: Astro + Cloudflare Workers + Tailwind v4 (latest)
🔧 **shadcn/ui clause resolved by `DEC-004-3` (Conv 004): not adopted** — Tailwind v4 CSS-first theming
instead. The rest of this decision (Astro + Workers + Tailwind v4) stands.
**Decision:** The website is built on Astro (SSR, Cloudflare adapter) deployed to **Cloudflare
Workers**, with **Tailwind v4** (CSS-first, via `@tailwindcss/vite`), on latest package versions.
**shadcn/ui** is under consideration for styling consistency (React islands + Tailwind + CSS-variable
theming). TypeScript throughout; Vitest; ESLint + Prettier; wrangler exact-pinned.
**Rationale:** Adopts peerloop/SPT's battle-tested stack decisions (Workers over Pages — the adapter
dropped Pages; exact-pin wrangler to dedupe Miniflare). shadcn's copy-in, CSS-variable model suits a
style-guide + theme. Rejected: Cloudflare Pages; the legacy Next.js/Chakra stack; Vercel.
**Consequences:** Marketing site may not need `output: 'server'` (could be mostly static + a Worker
only if a form/endpoint appears); shadcn to be weighed against JS weight during the style discussion.
Concrete versions pinned when `fgw-26` is scaffolded.
