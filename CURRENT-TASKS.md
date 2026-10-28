# CURRENT-TASKS — fgw

**This file is the durable board state.** Keyed by `[CODE]` mnemonic — the sole stable id. Codes are
**readable, hyphenated, up to ~10+ chars** (`SITE-DEPLOY-STAGING`, not `SDS`); collision → numeric
suffix. Format adopted from `fps-docs` (`DEC-007-1`); unlike fps, **every section — including
`📋 Unordered` — lives in this one file** (`DEC-000-4`).

📖 **Row format.** A substantial row leads with a plain-language `#### Status — Conv NNN` block a
non-author can scan in ten seconds (*what works · what's not built · what's buildable next*), with any
dense spec/build-log below it as the archive; the Status block's `Conv NNN` is its freshness stamp,
refreshed whenever the row is touched. Small rows don't need one. A gated / multi-phase row also carries
its continuity explicitly: what is **built**, what is **owed by the operator**, and the **deferred
remainder**.

> **The board vs. the hopper.** [`HOPPER.md`](HOPPER.md) is the hopper — spin-off capture during a conv,
> subject to scrutiny and *not* a commitment. A row here is a commitment. Hopper items are ruled at
> `/r-hopper` / `/r-end` — promote / do now / drop.

---

## 🔥 Ordered — index

⚡ = do next. Full detail in the task bodies below; the critical-path sequence sits between.

1. **[SITE-VISUAL]** — substantially done Conv 010: mocked 3 directions → operator picked **A
   (warm-editorial)** → implemented site-wide + deployed to staging. Remainder: real headshot
   (hoppered), dark-mode per-page spot-check, optional device-review polish. Pre-go-live polish.
2. **[SITE-NARRATIVE]** — real site copy. Bulk drafted + live on staging Conv 009; **remaining: a
   whole-site voice pass against `reference/VOICE.md` (operator-queued "C", next conv)**, an optional
   urantia case, and client sign-off (production gate). Critical-path **Phase 2**.
3. **[SITE-SEO]** — SEO infrastructure the scaffold lacks (site URL, sitemap, robots.txt, canonical,
   og:image, `schema.org` JSON-LD). Opened Conv 009. Critical-path **Phase 3**.
4. **[SITE-AI-SEO]** — AI/LLM discoverability (llms.txt, structured facts, AI-crawler policy). Opened
   Conv 009. Critical-path **Phase 3**; shares machinery with [SITE-SEO].
5. **[SITE-PERF]** — page-speed as a tracked discipline (Lighthouse/CWV + budget, image optimization).
   Opened Conv 009. Critical-path **Phase 3**; mostly satisfied already by the static+edge architecture.
6. **[SITE-GO-LIVE]** — production deploy + cut `frasergorrie.com` over to fgw-26 on Cloudflare. Opened
   Conv 007; lean until the pre-go-live work lands. Critical-path **Phase 4** — the destination.

(**[SITE-DEPLOY-STAGING]** — Phase 1 — ✅ Conv 008 · **[SITE-ASSESS]** — ✅ Conv 009; both in ✅ Completed.)

---

## 🎯 Critical path — to fgw-26 live on Cloudflare at frasergorrie.com

Set Conv 007. The arc from the current scaffold (placeholder copy, now live on staging as of Conv 008)
to the real site serving at **frasergorrie.com**.

🔴 **This section is pure sequence + pointers.** Every step names an **existing** task by `[CODE]` or an
operator action; the row holds the work, detail, and done-condition — this holds the order *over* them,
not a second copy.

**Already true — NOT a gate:** the app is scaffolded (Astro 7 + Cloudflare Workers adapter + Tailwind
v4), `npm verify` green, WCAG AA verified, Node 24 baseline (all Conv 006); the staging deploy pipeline
is proven (Conv 008); and real copy for all pages + Work cases (with independent "The record" blocks) is
drafted and live on staging (Conv 009). What's missing is (a) the visual + voice pass, (b) findable/fast
(SEO), (c) the production deploy + the domain.

### Phase 1 — Staging reachable *(prove the deploy pipeline)* — ✅ DONE Conv 008
- **1.0 — operator: clear Cloudflare auth** — ✅ done Conv 008 (`wrangler login`, OAuth).
- **1.1 — `[SITE-DEPLOY-STAGING]`** — ✅ done Conv 008. Deploy env-selection corrected to build-time
  `CLOUDFLARE_ENV` + a fail-closed resolved-name guard (`DEC-008-1`, correcting `DEC-007-2`'s wiring).
  Scaffold live + correct at `fgw-staging.fgorrie.workers.dev` (HTTP 200). CI stays deferred (`DEC-003-2`).

### Phase 2 — Publishable content *(the site must say something true)*
- **2.1 — `[SITE-NARRATIVE]`** — real copy/messaging + de-identified `/work/<slug>` cases. Bulk landed +
  live on staging Conv 009; whole-site voice pass (`reference/VOICE.md`) remains for next conv.

### Phase 3 — Findable & fast *(in place before the domain points at production)*
- **3.1 — `[SITE-SEO]`** — set astro `site:`, add `@astrojs/sitemap` + `robots.txt`, canonical +
  `og:url`/`og:image`, `schema.org` JSON-LD (Person/ProfessionalService). All additive; dev/staging only.
- **3.2 — `[SITE-AI-SEO]`** — LLM/generative-engine discoverability: `llms.txt`, structured facts, an
  AI-crawler policy. Shares the JSON-LD + crawlability work with 3.1.
- **3.3 — `[SITE-PERF]`** — page-speed as a tracked discipline: a Lighthouse / Core Web Vitals pass +
  budget, image optimization when imagery lands. Largely satisfied already (static + edge + near-zero JS).

### Phase 4 — Live at frasergorrie.com *(production + domain cutover)*
- **4.1 — operator: confirm where `frasergorrie.com` DNS lives today** and whether/when its zone is in
  this Cloudflare account. The legacy `frasergorrie` site currently answers the domain.
- **4.2 — `[SITE-GO-LIVE]`** — a production worker + a custom-domain/route binding (apex + `www`) + the
  DNS cutover. 🔴 **Outward-facing + hard to reverse** — this takes the domain off the live legacy site;
  needs an explicit operator go-ahead, never autopilot. **Done-when:** frasergorrie.com serves fgw-26.

---

## 🔥 Ordered

### [SITE-NARRATIVE] · critical-path Phase 2

#### What it is
Build the site messaging/structure from `discovery/EVIDENCE-LEDGER.md`'s proof-points and the
`WORKING-METHOD.md` honesty frame (`DEC-000-6`), honouring the publishability map — de-identify all
client-owned material. The scaffold provides the routes + the `work`/`blog` content collections + the
component library to drop copy into; each `/work/<slug>` case is gated on its de-identification, so start
with the most showable (`redline` is fully clear). The copy must carry the **positioning thesis** below.

#### Positioning thesis — operator input, Conv 007 (the brief to draft from; not yet copy)
The guiding message for client attraction. Two halves, held deliberately **in balance** — the first
opens the door, the second must close it:

1. **The shift (worldview).** AI is upending a world where programmers were scarce, highly valued, and
   highly paid. Bespoke software — long too expensive to build per-business — is becoming viable for any
   organization, because AI now does much of the writing, deployment, and former IT work.
2. **FG's place + the reassurance (why pay FG).** FG uses intuitive judgment and the ability to *steer*
   AI development to help **small-to-medium companies and organizations** build their **own** bespoke
   software so their operations run well. 🔴 The reassurance half is load-bearing: the site must answer
   *why steering AI is a skill worth paying FG for* — rather than the buyer attempting it alone or hiring
   a cheaper AI-wrapper. That proof comes from the `WORKING-METHOD.md` honesty frame (`DEC-000-6`) + the
   `EVIDENCE-LEDGER.md` proof-points: the worldview is the hook, the evidence is the warrant.

Draft this at Phase 2, not now — it is held above the copy on purpose.

#### Status — Conv 009
**Bulk delivered, live on staging.** All five pages (Home, Method, Contact, About, nav) carry real copy,
and there are five Work cases — `redline`, `this-site` (fgw-26 itself), and the two de-identified client
cases — each with an independent **"The record"** assessment block (`[SITE-ASSESS]`). Biography verified
and recorded in `discovery/BIO-VERIFIED.md`; About in the lightly-warmed register. All live at
`fgw-staging.fgorrie.workers.dev` (Conv 009).

🔴 **Case → project mapping lives here, never in the `fgw-26` site source:** `translation-platform.md` =
the translation-system/SPT engagement; `learning-marketplace.md` = the Peerloop engagement.

**Remaining:**
- **Whole-site voice pass (operator-queued "C", next conv)** — re-read every page against
  `reference/VOICE.md` (Fraser-to-client, lightly-warmed, candid). The Conv-009 copy was written toward
  this voice but predates the written standard.
- Optional urantia bake-off case — deferred (overlaps the translation case; its proof is already on Home
  card #4).
- 🔴 **Client sign-off** required before the **production** deploy (`[SITE-GO-LIVE]`), **not** for
  dev/staging. De-identification guards dev/staging; sign-off guards production.

**Source material (Conv 008):** `discovery/NARRATIVE-SOURCE-GEMINI.md` (Gemini synthesis, historical);
the honesty frame + evidence came from `discovery/WORKING-METHOD.md` + `discovery/EVIDENCE-LEDGER.md`.

### [SITE-SEO] · critical-path Phase 3 · opened Conv 009

#### What it is
Traditional search-engine infrastructure the scaffold doesn't yet have (audit Conv 009). **Present
already:** per-page `<title>` / `<meta description>` / Open Graph (title/description/type), multi-page
URLs, `lang`, semantic HTML + WCAG AA. **Missing:** astro `site:` URL · `sitemap.xml` (`@astrojs/sitemap`)
· `robots.txt` · canonical link · `og:url` / `og:image` / Twitter card · `schema.org` JSON-LD
(Person/ProfessionalService). All additive, dev/staging only, no production action. Must be in place
before go-live (Phase 4). Not in the original plan — SEO was cited there only as the rationale for the
multi-page IA (`DEC-004-2`).

### [SITE-AI-SEO] · critical-path Phase 3 · opened Conv 009

#### What it is
Discoverability for LLMs / generative engines — not addressed anywhere in the current build (audit
Conv 009). Candidate work: `llms.txt`, `schema.org` JSON-LD as machine-readable facts (shared with
[SITE-SEO]), an explicit AI-crawler policy in `robots.txt`. The static, semantic, text-first HTML
already helps. Scope to be specced; lean until [SITE-SEO] lands, since they share machinery.

### [SITE-PERF] · critical-path Phase 3 · opened Conv 009

#### What it is
Page speed as a tracked discipline rather than a happy accident (audit Conv 009). **Already good by
construction:** static output on Cloudflare's edge, near-zero JS (one hydrated island, `ThemeToggle`),
immutable `Cache-Control` on `/_astro/*`, small Tailwind v4 CSS. **Not yet deliberate:** a Lighthouse /
Core Web Vitals pass + a budget, and image optimization (the Cloudflare `IMAGES` binding is enabled but
unused — no imagery yet). The lightest of the three.

### [SITE-VISUAL] · opened Conv 009 · pre-go-live polish

#### Status — Conv 010
**Delivered + live on staging.** Mocked 3 distinct directions (`.scratch/visual-dir{A,B,C}*.jpg`);
operator chose **A — warm-editorial**. Implemented site-wide and deployed to
`fgw-staging.fgorrie.workers.dev`: deepened the warm light palette so warmth reads to the eye (was flat
near-white); ember eyebrows + a lead-rule variant; **ember-as-text moved to `--accent-strong` to hold
WCAG AA on the deeper paper** (ember-as-fill stays `--accent`); new `Icon.astro` feather set; card icon
chips; sun/moon/menu icons; two-column Home hero + About header with a swap-ready portrait; warm
proof-card band; Work "Read the case" arrows + case "Back to work" link. `npm run verify` green (lint,
typecheck, 2 tests, 10-page build); committed `d486082` (code) / `f76108e` (docs), not yet pushed.
Design decision (Direction A + the tokens/AA rule) **to be recorded as a `DEC-010` entry at `/r-end`.**

**Remainder:** real headshot asset (hopper — placeholder on Home + About); dark-mode per-page
spot-check (only Home confirmed in dark); any polish from operator device review (e.g. the "Auto" toggle
glyph). 🔴 Client sign-off still gates **production**, not staging.

#### What it is
Close the gap between the *intended* look — "warm neutrals + a single ember accent," "quiet editorial
authority," explicitly "distinct in the saturated field of mono-accented dev-portfolio sites"
(`DEC-004-5/6`) — and the *delivered* look: near-monochrome, no icons, no imagery, reads "AI-default"
(operator critique Conv 009). The thesis is human judgment steering AI; the site must not read as
machine boilerplate. Dimensions:
- **Warmth** — the warm neutrals (`#faf7f2` / `#1c1a17`) are warm in hex but flat to the eye; verify and
  likely deepen against the live render.
- **Accent** — the ember appears on ~2 buttons total, none on Method/About; bring it in deliberately
  without losing the "signal not noise" discipline.
- **Icons** — theme toggle ("Auto/Light/Dark") and mobile "Menu" are plain text; add real icons.
- **Imagery** — none exists; plan a headshot + work visuals + `og:image` (feeds `[SITE-SEO]`/`[SITE-PERF]`).

#### Approach (operator A+B, Conv 009)
First mock up **2–3 distinct visual directions** on the styleguide / live pages so a direction can be
chosen (B); then spec and implement the chosen one (A). No restyle committed until a direction is picked.

### [SITE-GO-LIVE] · opened Conv 007 · critical-path Phase 4

#### What it is
Take fgw-26 to production on Cloudflare and point **frasergorrie.com** at it: a production worker (the
top-level `wrangler.jsonc` name), a custom-domain/route binding for the apex (+ `www`), and the DNS
cutover from the legacy site.

#### Status — Conv 007 (plain language)
Lean placeholder — opened so the critical path's destination resolves to a real row. Not specced;
blocked behind Phases 1–3. 🔴 **The cutover is outward-facing + hard to reverse** (it takes the domain
off the live legacy `frasergorrie` site) — needs an explicit operator go-ahead, never autopilot.

#### Owed by the operator (when Phase 3 opens)
- Where `frasergorrie.com` DNS lives today + whether/when its zone moves into this Cloudflare account.
- The go-ahead for the cutover itself.

---

## 📋 Unordered

_None._

## ⏸️ Parked

_None._ (`[SITE-TEST-SETUP]` completed Conv 006; its gate — the scaffold — is satisfied.)

## ✅ Completed this conv

### [SITE-ASSESS] · ✅ Conv 009
Built and proved the independent-assessment mechanism, then rolled it out across the whole current Work
set. A fresh subagent per project read that project's own repo and returned a cited, honest three-part
assessment (scale / steering / what-went-wrong / the plan); each became a **"The record"** block on its
`/work/<slug>` page — `this-site`, `redline`, `translation-platform`, `learning-marketplace`. Full
candor (operator call); the two client cases de-identified, including scrubbing a client-named folder
reference that surfaced in a read. Standing approach for any future Work case (not just these four).
Candor standard lives in `reference/VOICE.md`; mechanism detail in the conv record.
