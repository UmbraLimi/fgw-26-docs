# Evidence Ledger — competence base for frasergorrie.com

> Compiled 2026-10-23 at project start, from the projects in `~/projects`.
> Purpose: an **honest** evidence base for the new frasergorrie.com — proof of applied competence,
> and the raw material for site copy. Audience in mind: would-be clients (business owners), not
> engineers. Companion doc: `WORKING-METHOD.md` (how Fraser and AI work together — the method and
> the caveats). Secrets were never read or reproduced during this survey; sensitive files are noted
> by existence only.

## The reframe that matters

These are **not** scattered one-off projects. They are, substantially, **two deep client
engagements + a personal R&D lab + personal tooling + the legacy site**:

- **The Urantia Book translation engagement** (The Center for Unity; client Gabriel, expert
  translator Carlos) is one continuous, three-generation effort: `translation-system` (V1, "straw
  man") → `spt-v2` (planning, frozen) → `spt` / **SPT V3** (production, now on clean hiatus), with
  `urantia-book-papers` as its data package.
- **Peerloop** — a second major client build (client Brian): a peer-to-peer learning marketplace.
- **fps** — Fraser's personal knowledge-management system and, more importantly, the lab where the
  AI-collaboration *method* was developed.
- **redline** — a personal Chrome tool that bridges visual review into Claude Code.
- **frasergorrie** — the legacy site being replaced.

The strongest story is **sustained, multi-generation client partnerships under real constraints**,
not a portfolio grid.

---

## SPT / translation-system — *The Urantia Book* translation (CLIENT WORK)

**What it is.** A production translation *business*: a self-documenting service translating *The
Urantia Book* (internally "DTUB") EN→~10 languages for The Center for Unity. The competitive edge is
"the moat" — a strictly enforced spiritual-terminology glossary. Client **Gabriel** sets the vision;
**Carlos** is the human expert PT-BR translator who reviews output.

**Tech & scale (V3).** Node 22 ESM, TypeScript strict, Zod, Drizzle over SQLite → **Cloudflare D1**,
DeepL MT, **Cloudflare Workers + R2 + Durable Objects**, Express API + React 19/Vite/Tailwind viewer,
Vitest. ~507 source files, ~72k LOC, **3,872 tests passing**. ~506 conversations (Mar–Aug 2026);
DECISIONS.md ≈ 1.0 MB / ~892 recorded decisions. V3 cutover was a force-push rebuild under push-only
access. As of Conv 504, V3 is on **indefinite hiatus — wound down cleanly, not abandoned.**

**Hard problems solved.** A 3,322-entry copy-on-write glossary with per-row provenance and a 5-tier
plurality cascade, worked around DeepL's 1000-glossary account cap; n:m sentence re-alignment (human
translators legitimately merge and split sentences); a cross-Worker D1-vs-R2 data split; and metric
calibration (COMET) that was ultimately **excluded from the headline because it didn't track the
human expert's judgment.**

**How the business is run (notable).** The *business* side is engineered, not improvised:
**timecards** tie billable hours to a Statement of Work (`Bill?:: SOW-01`), derived from git commits
and conversation heartbeats — an auditable billing pipeline; **deliverables** are split into a
client bundle and a translator bundle; reports render in an **operator mode vs a de-jargoned client
mode**; and there is a hard **"pause before paid runs"** rule (show the command, inputs, and expected
cost; wait for "go").

**Publishability — 🔴 client-owned.** Names a real client throughout (Gabriel, Carlos, the CFU org,
the DTUB corpus, SOW-01). A self-contained **`PROTO/__NATIVE`** demo project exists precisely so the
whole pipeline can be run end-to-end **without any client files** — that is the showable artifact,
alongside the de-identified method.

---

## Peerloop — peer-to-peer learning marketplace (CLIENT WORK, flagship build)

**What it is.** A marketplace for paid 1:1 / small-group peer teaching, engineered around Bloom's "2
Sigma" thesis with a hard **≥75% course-completion** target (vs the 15–20% MOOC norm). Discovery,
enrollment, scheduling, live video, marketplace payments/payouts, communities, certificates.

**Tech & scale.** Astro SSR on **Cloudflare Workers** (migrated off Pages), **D1** + **R2** + KV,
**Stripe Connect** payments, **BigBlueButton/PlugNmeet** video behind a provider abstraction, Resend
email, React islands + Tailwind v4, custom JWT auth. Vitest + Playwright + a bespoke browser-run
harness ("PLATO"). **~144k LOC, 769 files, 335 routes, 548 test files, ~1,065 commits, Dec 2025 →
Sep 2026.** 460 conversations, ~2,160 session documents, 396 decisions. The largest build in the set.

**Hard problems solved.** A forced Cloudflare Pages→Workers migration (the adapter dropped Pages;
vendor docs were stale — diagnosed from a GitHub issue); a Stripe webhook that **silently 400'd for
~8 weeks** on the edge runtime, root-caused and fixed; a remote-D1 schema-migration trap with a
decision tree (surgical `ALTER` vs destructive reseed); timezone/DST correctness hardened with
**flip-verified** tests.

**Client mediation (a strength worth showing).** The client ships his own design branches; a
"MERGE-BRIAN" process dispositions each change **ADOPT / ADAPT / DROP** with written rationale
(one page: 8 ADAPT, 3 DROP, 0 ADOPT — "intent harvested almost everywhere, implementation almost
nowhere"). A client objection was resolved by *tokenizing his colors* rather than overruling the
effect — "dissolved, not overruled." This is judgment mediating between literal client input and a
maintainable result.

**Publishability — 🔴 client-owned.** The real client's name is woven through token names, branch
names, and the workstream label. The de-identified engineering + collaboration narrative is highly
publishable; the client identity is the only hard blocker. Secrets files present — never publish.

---

## fps — personal PKM system + the AI-collaboration method lab

**What it is.** A personal knowledge-management system (a CLI tool, an MCP server Claude queries, a
Tauri desktop app, two Obsidian vaults). Explicitly personal/non-client — and in practice the
**laboratory where the collaboration method itself was developed.**

**Tech & scale.** TypeScript core/CLI/MCP (~16.4k LOC) + Tauri app (React/Vite + Rust + Node
sidecar, ~8.5k LOC). **153 conversations in ~2.5 months. 452 numbered decisions, 28 formally
superseded (tombstoned, never deleted).**

**What it demonstrates.** A confidentiality architecture where the AI can *query* a corpus but is
architecturally barred from reading sensitive content into its context; a session lifecycle whose
state survives crashes without corrupting; an off-machine backup design that never lets a
confidential vault reach a cloud remote. Most of all: a method built around **not trusting the AI's
unverified claims** and catching where guardrails fail silently (detailed in `WORKING-METHOD.md`).

**Publishability.** Personal (freely usable as Fraser's own), **except** the sensitive vault tier,
which must never be shown. The method and structure are the strongest "how I think" artifact.

---

## redline — Chrome tool that feeds visual review into Claude Code

**What it is.** A personal MV3 Chrome extension that pins notes to elements on a page and exports
them as a Markdown change-list (CSS selectors + visible text) to paste straight into Claude Code as
a work order. A concrete illustration of how Fraser actually drives AI tooling.

**Tech & state.** Deliberately minimal — vanilla JS, no build, no dependencies; one ~1,550-line
content script. **Built in a single day (2026-07-30); finished, not abandoned.**

**What it demonstrates.** Punches above its size: a 5-tier anchor-resolution fallback, honest
"≈ approximate / unanchored" labelling rather than faking anchors, shadow-DOM isolation,
SPA-safe storage. Restraint and taste — the simplest tool that works, with its limits named.

**Publishability — ✅ the most freely showable of all.** No client, no secrets, local-only by
design. A good demo / open-source candidate.

---

## urantia-book-papers — structured data package (supports the translation engagement)

**What it is.** The complete Urantia Book (197 papers, ~1.09M words) extracted from PDF into typed
JSON as an npm package with a query/search API. Org-owned; part library, part data-quality exercise.

**What it demonstrates.** Empirical decision-making: a **Python-vs-JS PDF-extraction bake-off that
measured Python missing 10.5% of content**, so the measured-100%-accurate tool was chosen (documented
in `docs/PYTHON-INVESTIGATION.md`), plus an exhaustive validation harness over all 14,585 paragraphs.
Doesn't trust tools on faith — measures, validates, picks on evidence.

**Publishability.** Content is CC0 / public-domain; the data and the bake-off approach are freely
showable. The repo is org-owned, so presenting it as Fraser's own property needs client-attribution
framing. No secrets.

---

## frasergorrie (LEGACY) — the site being replaced

**What it says today.** Title: *"Fraser Gorrie — Veteran Coder / NoCode Strategist."* The hero
pitches **40 years**, worldwide clients, custom apps under "complex mixes of constraints," and — the
thesis of *this* version — **"NoCode-First as a strategy for every new project."** Plus testimonials,
a "How I Work" partnership narrative, coaching offers, a blog, and a podcast.

**Tech & state.** Next.js 11 (Pages Router), React 17, Chakra 1, Stripe/next-stripe, Netlify, Node
16. **231 commits Jan 2021 → Jan 2023, then dormant ~3 years.** Technically stale; useful as source
material and contrast, not as a codebase to carry forward.

🔴 **Repositioning implication.** The new AI-era "judgment / helmsman" thesis is a genuine pivot. It
must **retire the "NoCode-First for everything" framing** and update **40 → 44 years.** Reusable
carry-forward: testimonials (attributed by role/country — low sensitivity), bio facts, proof of
longevity. Note he has repositioned before (2021 → NoCode) — itself evidence of adaptability. The
legacy code integrates Stripe; any keys/`.env` must not be reused.

---

## Publishability map

| Project | Owner | Publish as-is? | Showable with care |
|---|---|---|---|
| **redline** | Fraser | ✅ Yes — no client, no secrets, local-only | Whole thing; demo / open-source candidate |
| **fps** (method) | Fraser | ⚠️ Structure & method yes | Never the sensitive vault tier |
| **urantia-book-papers** | CFU org | ⚠️ Content is CC0 / public-domain | Data + the Python-vs-JS bake-off; frame as client work |
| **SPT / translation-system** | CFU (Gabriel) | 🔴 No — names client throughout | The `PROTO/__NATIVE` self-contained demo + the method, **de-identified** |
| **Peerloop** | Client (Brian) | 🔴 No — client identity woven in | The engineering + good/bad narrative, **de-identified** |
| **frasergorrie (legacy)** | Fraser | ✅ Public copy & testimonials reusable | Avoid stale code + any Stripe keys |

**Hard blockers before anything client-related goes public:** de-identify client names everywhere
(Brian + all `brian-*` tokens/branches/slugs; Gabriel / Carlos / CFU / DTUB); exclude every `.env`,
`.secrets*`, `.dev.vars`, `.var.*`; get client sign-off on naming. The engineering and collaboration
*narratives* are the asset — client identity is the only consistent blocker.

## Candidate site proof-points (business-value framing)

1. **"I steer; AI drives — and I know when to overrule it."** Fraser reversed AI direction on
   judgment grounds repeatedly: preserving a client's exact source text even when it had typos (SPT);
   refusing a mass-refactor after the AI quantified a ~3,900-utility blast radius (Peerloop);
   dissolving a client's design objection by tokenizing his colors rather than overruling the effect
   (Peerloop). Route planner + helmsman, evidenced.
2. **"I catch the bugs that pass every automated check."** A course filter where *no product code
   ever populated the key column* (Peerloop); a cross-run test that structurally could not fail
   (SPT); an 8-week silent Stripe-webhook outage root-caused (Peerloop).
3. **"I'll tell you when it isn't working yet."** SPT's blind A/B honestly reported the enhanced
   pipeline tied the *free* baseline, against the project's own interest — and the project was paused
   rather than oversold. The most credible trust signal available.
4. **"I measure instead of guessing."** Tool bake-offs with evidence (Python vs JS PDF extraction);
   a quality metric trusted only until it failed to track the human expert, then excluded.
5. **"Range, across 44 years and the whole stack."** LLM/translation pipelines, a payments
   marketplace on the edge, data engineering, browser tooling, web/commerce — plus the business
   machinery (auditable timecards tied to SOWs, client-vs-operator reporting) of a solopreneur who
   does every part of the job.
6. **"My work is legible."** The docs repos themselves — numbered decisions with rationale and what
   they replaced, session learnings, honest failure records — are handed to clients as proof. The
   documentation rigor *is* a deliverable.
