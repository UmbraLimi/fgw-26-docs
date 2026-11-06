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

1. **[SITE-NARRATIVE]** — real site copy + de-identified Work cases. Bulk live Conv 009; voice/humility
   pass Conv 010; two named Urantia cases added Conv 013. Remainder: 🔴 client sign-off (production
   gate). Critical-path **Phase 2** — content-complete, gated on sign-off.
2. **[SITE-PERF]** — page-speed as a tracked discipline (Lighthouse/CWV + budget, image optimization —
   `public/fraser.jpg` exists). Opened Conv 009. Critical-path **Phase 3** — the last Phase 3 build, now
   that [SITE-SEO] (Conv 015) and [SITE-AI-SEO] (Conv 016) are done. 🔴 **Waits until all images are added**
   (operator, Conv 016) — the image-optimization leg needs the full image set in hand first.
3. **[SITE-GO-LIVE]** — production deploy + cut `frasergorrie.com` over to fgw-26 on Cloudflare. Opened
   Conv 007; lean until the pre-go-live work lands. Critical-path **Phase 4** — the destination.

⚡ **Do-next — Conv 029:** Conv 028 completed the page-by-page **prose review** — **FAQ + Testimonials**
reworked with the operator (voice/accuracy edits throughout; the redundant FAQ "Common concerns" note
moved to a Testimonials→FAQ cross-link; UK "judgement" fixes). Two **accordion-legibility** styling
changes landed on FAQ: group headings lifted (weight 700 + accent underline rule) and open answers bound
with a left accent bar (`DEC-028-1`); the same grouping-heading rule was reused to separate the
Testimonials AI-era / pre-AI blocks. Spelling variety standardised on **UK** (`DEC-028-2`). All deployed
to staging (version `4e10f27c`). **The page-by-page prose pass is now complete**, so the pre-go-live
quality sweep is runnable: **[SITE-CONSISTENCY]** (now also carrying the site-wide spelling + "honest/
honestly" rewords, parts 6–7) and **[SITE-A11Y]** are ungated — a natural do-next. Critical path still
gated: [SITE-PERF] on the full image set (Conv 016); [SITE-NARRATIVE] on client sign-off; [SITE-GO-LIVE]
on operator DNS + go-ahead (+ legal-review + prod-`EMAIL_TO` gates). Open polish rows: [SITE-CONSISTENCY],
[SITE-A11Y], [SITE-OG-IMAGE], [CASE-RECORD-SIGNOFF], [SITE-ANALYTICS], [SITE-TOOLS], [SITE-SOCIAL],
[NODE-FLOOR], [CASE-MOCKUPS] (residual only — see row).

(**[CASE-DIAGRAMS]** / **[CASE-RECORD-REFRESH]** ✅ Conv 025 ·
**[SITE-AI-SEO]** ✅ Conv 016 · **[SITE-SEO]** / **[SITE-CROSSLINK]** ✅ Conv 015 ·
**[SITE-CONTACT]** ✅ Conv 013 · **[SITE-TESTIMONIALS]** / **[SITE-FAQ]** / **[SITE-HISTORY]** ✅ Conv 013 ·
**[SITE-DEPLOY-STAGING]** ✅ Conv 008 · **[SITE-ASSESS]** ✅ Conv 009 · **[SITE-VISUAL]** ✅ Conv 010 ·
**[SITE-PHASES]** ✅ Conv 011; all in ✅ Completed / conv records.)

---

## 🎯 Critical path — to fgw-26 live on Cloudflare at frasergorrie.com

Set Conv 007. The arc from the current scaffold (placeholder copy, now live on staging as of Conv 008)
to the real site serving at **frasergorrie.com**.

🔴 **This section is pure sequence + pointers.** Every step names an **existing** task by `[CODE]` or an
operator action; the row holds the work, detail, and done-condition — this holds the order *over* them,
not a second copy.

**Already true — NOT a gate:** the app is scaffolded (Astro 7 + Cloudflare Workers adapter + Tailwind
v4), `npm verify` green, WCAG AA verified, Node 24 baseline (all Conv 006); the staging deploy pipeline
is proven (Conv 008); real copy for all pages + Work cases (with independent "The record" blocks) is
drafted and live on staging (Conv 009); the **visual + voice pass** is done (`[SITE-VISUAL]` warm-
editorial refresh + a whole-site voice/humility pass + a real headshot, Conv 010); and the **Phases
self-qualification page** + a **sticky header** are built and on staging (`[SITE-PHASES]`, Conv 011);
and **SEO infrastructure + footer-tier cross-links** are built and on staging (`[SITE-SEO]` /
`[SITE-CROSSLINK]`, Conv 015), with staging held `noindex` (`DEC-015-1`); and **AI/LLM discoverability**
is built and on staging (`[SITE-AI-SEO]`, Conv 016 — `/llms.txt`, the AI-crawler policy, and
`FAQPage`/`OfferCatalog` JSON-LD). What's missing is (a) a deliberate perf pass (`[SITE-PERF]`), (b) the
production deploy + the domain.

### Phase 1 — Staging reachable *(prove the deploy pipeline)* — ✅ DONE Conv 008
- **1.0 — operator: clear Cloudflare auth** — ✅ done Conv 008 (`wrangler login`, OAuth).
- **1.1 — `[SITE-DEPLOY-STAGING]`** — ✅ done Conv 008. Deploy env-selection corrected to build-time
  `CLOUDFLARE_ENV` + a fail-closed resolved-name guard (`DEC-008-1`, correcting `DEC-007-2`'s wiring).
  Scaffold live + correct at `fgw-staging.fgorrie.workers.dev` (HTTP 200). CI stays deferred (`DEC-003-2`).

### Phase 2 — Publishable content *(the site must say something true)*
- **2.1 — `[SITE-NARRATIVE]`** — real copy/messaging + de-identified `/work/<slug>` cases. Bulk landed +
  live on staging Conv 009; whole-site voice/humility pass done Conv 010. Content-complete; **client
  sign-off on the Work cases received Conv 029** (no changes). Residual sign-off gates: testimonial
  quotes + the two `/record` artifacts (`[CASE-RECORD-SIGNOFF]`).
- **2.2 — `[SITE-PHASES]`** — ✅ built + on staging Conv 011. A new self-qualification page: the three
  phases a client goes through building with AI (straw/tin/steel man), so a prospect can place themselves
  and see the fit. Generic content — no client material, so not gated on sign-off; rides `[SITE-GO-LIVE]`
  to production like the rest of the content.

### Phase 3 — Findable & fast *(in place before the domain points at production)*
- **3.1 — `[SITE-SEO]`** — ✅ built Conv 015, on staging: astro `site:`, `@astrojs/sitemap` (styleguide
  excluded), a `robots.txt` endpoint (prod allow-all / staging `Disallow: /` + `noindex`, `DEC-015-1`),
  per-page canonical + `og:url` + Twitter card, `schema.org` JSON-LD (Person + ProfessionalService).
  Deferred remainder: a 1200×630 `og:image` (`[SITE-OG-IMAGE]`) — until then `twitter:card` is `summary`.
- **3.2 — `[SITE-AI-SEO]`** — ✅ built Conv 016, on staging: `/llms.txt` (Work section auto-generated),
  the production AI-crawler policy in the robots endpoint (`DEC-016-1` — search bots allowed, training-only
  declined), and machine-readable facts (`FAQPage` on `/faq` + `OfferCatalog`/`knowsAbout` on the global
  JSON-LD, via a reusable `<head>` slot). Shared the JSON-LD + crawlability work with 3.1.
- **3.3 — `[SITE-PERF]`** — page-speed as a tracked discipline: a Lighthouse / Core Web Vitals pass +
  budget, image optimization when imagery lands. Largely satisfied already (static + edge + near-zero JS).
  🔴 Waits until all images are added (operator, Conv 016) before the image-optimization leg.

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

**Voice/humility pass — ✅ done Conv 010.** Re-read every page + the four Work cases + the footer against
`reference/VOICE.md`; added a **humility rule** (`DEC-010-2`) and reframed the boastful "I know…" /
"before you do" / "a cheaper wrapper can't" framing site-wide. The Home hero was also re-led with the
**business identity** headline + a **44-year differentiator** (`DEC-010-3`).

**Home hero reworked — Conv 017.** New positioning h1 ("Custom software, designed with you — kept on
course by me."), a supporting deck, and a two-paragraph narrative under a "Where I come in" h2
(`DEC-017-1`); "44 years" → "over 40 years" on home (`DEC-017-3`); an em-dash footnote (`DEC-017-2`) and a
home-only tighter section rhythm (`DEC-017-4`). Supersedes the home-hero h1 + "44" specifics of
`DEC-010-3` (its flow-stepper/headshot/meet-Fraser structure still stands). Other pages' prose not yet
reconciled to this voice — per-page as reached.

**Work-case structure — Conv 023.** Every `/work` case now opens with a **"Why it matters"** section
(motivation, before "The problem"; `DEC-023-2`); narration follows the **I/we convention** (`DEC-023-1`);
`translation-platform`'s "ten languages" was de-emphasised (`DEC-023-3`).

**SPT (`translation-platform`) fully reworked — Conv 024.** Operator-driven prose tune across all sections
(incl. an async/Cloudflare-Workers production-ready close; billing dropped from body + `outcome` as
not-completed); three cases' "Why it matters" tuned; a new **"My response"** record section (Fraser's reply
to the audit, in voice); the real technical **Built with** stack; benefit reworded to clear the `DEC-023-3`
"~10 languages" residue; and the case's diagram replaced by the new **`segmentTable`** render type
(`DEC-024-2`). Local dev only — not deployed.

**Home refined further — Conv 018.** Operator-driven page pass on home: the four-step flow chart reworded
(the load-bearing idea is that big builds span multiple AI sessions and that needs managing); the
"Judgment in practice" band re-led as a question ("Where does my judgment come in?") with three
"It happens in…" cards on a new `scales` icon (`DEC-018-1`); "What I do" given a lead-in h2; "Find your
phase" reworded so progression past phase one reads as **not guaranteed** (`DEC-018-2`); the meet-Fraser
line shortened to "I'm Fraser"; and a new **"Recent testimonials" band** surfacing the two AI testimonials
shared from `src/data/testimonials.json`, SAMPLE-badged (`DEC-018-3`). Live on staging (deploy Conv 018).
Other pages still pending reconciliation; consistency sweep tracked as `[SITE-CONSISTENCY]`.

**Remaining:**
- ✅ **Urantia cases — done Conv 013:** added as two named, public Work cases (`/work/discover-jesus`,
  `/work/discover-the-ub`) for The Center for Unity — live-URL proof, no "The record" block.
- ✅ **Client sign-off on the de-identified Work cases — received Conv 029** (both clients, no changes).
  This clears the Work-case leg of the production sign-off gate; de-identification/masking still governs
  (`DEC-023-3`). Still owed before production: testimonial quotes + the two `/record` artifacts
  (`[CASE-RECORD-SIGNOFF]`).

**Source material (Conv 008):** `discovery/NARRATIVE-SOURCE-GEMINI.md` (Gemini synthesis, historical);
the honesty frame + evidence came from `discovery/WORKING-METHOD.md` + `discovery/EVIDENCE-LEDGER.md`.

### [SITE-PERF] · critical-path Phase 3 · opened Conv 009

🔴 **Gated — waits until all images are added** (operator, Conv 016). The image-optimization leg is the
substantive part of this task, and it needs the full image set in hand first; the measurement/budget leg
can precede it but is largely satisfied by construction already. Do not start until the images land.

#### What it is
Page speed as a tracked discipline rather than a happy accident (audit Conv 009). **Already good by
construction:** static output on Cloudflare's edge, near-zero JS (one hydrated island, `ThemeToggle`),
immutable `Cache-Control` on `/_astro/*`, small Tailwind v4 CSS. **Not yet deliberate:** a Lighthouse /
Core Web Vitals pass + a budget, and image optimization — `public/fraser.jpg` is a real ~330 KB photo
served unoptimized on three spots (Home hero avatar + band, About), and the Cloudflare `IMAGES` binding
is enabled but unused. The lightest of the three — but gated on the full image set (above).
🔴 **Also unoptimized (Conv 022):** `src/mockups/*.png` product screenshots served via plain `<img>` (no
`astro:assets` pipeline) — `redline.png` is 1000×1796 / ~344 KB into an ~288 px slot; this pass should
resize + convert these to WebP/AVIF too ([CASE-MOCKUPS] deferred its optimization here).

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

#### 🔴 Pre-production content gates (not for dev/staging)
- ✅ **No longer a go-live blocker (Conv 029).** The two MOCK AI-era testimonials never arrived and may not
  (operator, Conv 029). Both the home **"Recent testimonials" band** and the `/testimonials` **"In the AI era"
  section** are now **suppressed** behind a `showAiTestimonials = false` flag (markup intact in `index.astro`
  + `testimonials.astro`); the `/testimonials` lede is flag-gated too (single-group wording while off). The
  site can go live without them. 🔴 **If a real, signed-off quote later arrives:** add it to
  `src/data/testimonials.json` and set `showAiTestimonials = true` in both files to restore the sections +
  the two-group lede — and the `[CASE-RECORD-SIGNOFF]` attribution-masking ruling applies before it renders.
- **Client sign-off** on all de-identified Work cases + testimonials — `[SITE-NARRATIVE]`. ✅ **Work cases
  signed off Conv 029** (both clients, no changes); **testimonial quotes still owed**.
- **Client sign-off** on the two client "The record" summaries + transcripts (Conv 014) — `[CASE-RECORD-SIGNOFF]`.
- Turnstile spam hardening on the contact form — `[SITE-CONTACT]`.
- **Legal review** of the `/privacy` policy + folded-in liability disclaimer copy (Conv 027) — CC-drafted,
  not lawyer-reviewed. Also revise its "no analytics/cookies" section when `[SITE-ANALYTICS]` wires a
  provider (the two must move together).
- **Production `EMAIL_TO` secret** — set it to `fraser@frasergorrie.com` via `wrangler secret put` once the
  production worker exists (Conv 027). `EMAIL_FROM`=fraser@ and staging `EMAIL_TO`=fraser@ are done +
  Resend-verified; only the prod inbox secret remains (can't be set until prod is deployed).

---

## 📋 Unordered

### [SITE-OG-IMAGE] · promoted Conv 015
A 1200×630 branded social-share card, the deferred remainder of `[SITE-SEO]` (Conv 015). Build the asset,
then wire it into `og:image` + `twitter:image` and bump `twitter:card` from `summary` to
`summary_large_image` in `src/layouts/Layout.astro`. 🔴 Needs a design asset / operator call on the card's
look before any wiring. Blocks nothing — SEO works without it; wanted before `[SITE-GO-LIVE]`. (hopper → Conv 015)

### [CASE-MOCKUPS] · promoted Conv 019
Real per-case product mockup images for the `/work` case-study sidebars, replacing the Conv 019
placeholder boxes. **Built (Conv 019):** the two-column case layout + a ~2:3 portrait placeholder box per
case (`.case-mockup`, labeled with the title), in a sticky sidebar. **Owed by the operator:** a real
portrait screenshot (~2:3) for each case — operator-produced (CC can't screenshot the apps). **Remainder:**
decide the wiring (per-slug asset, e.g. `src/mockups/<slug>`, + an optional `caseExtras` field vs a filename
convention) and wire each image in; and review the new `aside`'s mobile stacking order (prose-first vs
extras-first). Blocks nothing; wanted before `[SITE-GO-LIVE]` for visual polish. (hopper → Conv 019)
**Conv 020:** the `personal-productivity-app` (fps) case **opts out** of the mockup box via
`caseExtras.hideMockup` (`DEC-020-2`) — its diagram fills the sidebar slot — so the owed screenshot set
no longer includes fps.
**Conv 022:** wiring decided — a **filename convention** (`src/mockups/<slug>.{png,svg}`, plain `<img>`
cover-fit into the 2:3 box; `DEC-022-1`) + an optional `caseExtras.mockupCaption`; raster optimization
deferred to `[SITE-PERF]`. Wired: `redline` (operator screenshot) and `learning-marketplace` (an
illustrative system-map SVG, `DEC-022-2`). A **click-to-enlarge lightbox** was added for all case mockups
(`DEC-022-3`). Remaining owed: operator screenshots for the other cases (`translation-platform`; the two
Urantia live-link cases if wanted).
**Conv 024:** `translation-platform` opts out of the mockup (`hideMockup: true`) — its aside now shows the
`segmentTable` instead — so it leaves the owed-screenshot set. **Remaining owed:** the two Urantia
live-link cases, if wanted.
**Conv 026:** both Urantia cases (`discover-jesus`, `discover-the-ub`) opt out of the mockup box too — each
now shows a real pipeline diagram (`hideMockup: true` + `diagram`; `DEC-026-2`) — so the **owed-screenshot
set is empty** and no case renders the placeholder box. Residual only: the Conv-019 mobile stacking-order
review (prose-first vs extras-first) is still unconfirmed; that is all this row is now holding open.

### [CASE-RECORD-SIGNOFF] · promoted Conv 014
The two **client** "The record" artifacts built Conv 014 — the sharper audit-derived summaries **and**
the full token-redacted transcripts at `/work/translation-platform/record` and
`/work/learning-marketplace/record` — need **client sign-off before the production deploy** (`DEC-009-2`);
dev/staging is fine. 🔴 Mandatory redaction already applied + verified: the translation-platform client is
The Center for Unity and the source text is the Urantia Book — the *same* client named publicly in the two
Urantia cases — so the source-text identity, client org, and people (Gabriel/Carlos/CFU/UmbraLimi) must stay
masked or the confidential engagement links to the named one. Pairs with the existing client-sign-off gate on
`[SITE-GO-LIVE]` / `[SITE-NARRATIVE]`. (operator, Conv 014)

🔴 **Conv 018 — same masking governs the home testimonials.** The home "Recent testimonials" band now
surfaces the translation + marketplace quotes (kept masked for now). When the real signed-off quotes from
**Gabriel** (translation) + **Brian** (marketplace) land, the attribution decision is here: naming Gabriel
publicly links the confidential engagement to the named Urantia cases. Brian (marketplace) is not under
this constraint.

### [SITE-TOOLS] · promoted Conv 012
Operator idea-set item 7, unscoped: a "tools" surface — ambiguous between a tools/stack page, the tech
stack, or the tools FG uses to steer AI. Seeded already by the per-case **Built with** chips (`[SITE-CONTACT]`
conv's case extras). Clarify intent before building.

### [SITE-SOCIAL] · promoted Conv 012
Operator idea-set item 8, unscoped: "redo LinkedIn and X." Ambiguous — the footer links/icons (editable
here) vs the off-site profiles themselves (need the browser + operator accounts). Clarify which.

### [NODE-FLOOR] · promoted Conv 012
Recurring papercut (Conv 011–012): a fresh Bash shell comes up on Node 22.19.0 (below Astro's floor) despite
`DEC-011-3`'s nvm-default fix; `npm run typecheck` (astro check) isn't guarded by `check-node.mjs`, so it
fails until a manual `nvm use 24`. Candidate fix: a repo `.nvmrc` + guard `typecheck`, or diagnose why the
shell defaults to 22.

### [SITE-CONSISTENCY] · promoted Conv 018
After the page-by-page prose/UI pass is complete across the site, a two-part consistency review:
(1) **the whole site** — voice, messaging, and terminology aligned across all pages to the final home
messaging (Conv 017–018 reworked home hero, flow, judgment, "what I do", phases, testimonials); and
(2) **the secondary data structures** — SEO metadata, AI-SEO / JSON-LD (`FAQPage`/`OfferCatalog`/Person),
`/llms.txt`, the `robots.txt` endpoint, canonical + `og:` — reconciled to the final prose so they don't
drift from what the pages now say; and (3) **layout measure** — confirm running prose uses a consistent
max-width cap across pages (`max-w-2xl` vs `max-w-prose` etc.) so the readable line length doesn't vary
page to page (hopper → Conv 019); and (4) **vertical rhythm** — the non-home pages carry too much top and
bottom margin; normalise their top/bottom spacing so every page matches the home page (operator, Conv 019); and
(5) **section-heading hierarchy** — headings that lead a grouping were lifted (weight 700 + an accent
underline rule): FAQ groups (`.faq-group h2`) and the Testimonials time-period headings
(`.testimonial-period-h2`), both Conv 028, because they shared the body weight. Other pages' section headings
stay on plain `text-h3`. Decide whether that lifted treatment becomes the site-wide section-heading pattern
or stays scoped to these grouped pages (operator chose scoped-only for now, Conv 028); and
(6) **spelling variety** — standardise on UK English site-wide (page uses UK "favourite"); US forms slip in
(FAQ + Testimonials "judgment" → "judgement" done Conv 028). Sweep all pages for US spellings (-ize, color,
judgment, etc.) and reconcile (hopper → Conv 028); and (7) **"honest"/"honestly" framing** — stop
*asserting* honesty (protesting it can backfire); reword site-wide. FAQ item 5's "Honestly" dropped
Conv 028; the FAQ h1 "Fair questions, honest answers" + other instances remain (hopper → Conv 028).
✅ **Ungated (Conv 028) — the page-by-page prose pass is complete:** home (Conv 018), About / History /
Contact / Method (Conv 027), FAQ + Testimonials (Conv 028). This review is now runnable. Pairs with the
per-page reconciliations already owed (voice + "44 vs over 40" — still live: the FAQ "What have you been
doing for {YEARS} years?" interpolates 44 vs home's "over 40"; operator chose to leave FAQ at 44,
Conv 028). (hopper → Conv 018)

✅ **Reviewed + reconciled — Conv 029 (all 7 parts ruled; → ✅ Completed).** Dispositions:
- **Part 4 (vertical rhythm)** — reduced the shared `--section-rhythm` from `clamp(4rem, 8vw, 8rem)` to
  `clamp(3rem, 5vw, 4.5rem)`, applied uniformly to all section/band edges (operator chose option B =
  tighten with a little responsive air, applied uniformly incl. the below-header / above-footer edges).
  Home unchanged (keeps its 2.5rem `-tight` override). Closes the Conv 019 "non-home pages too tall" flag.
- **Part 6 (spelling → UK)** — swept `judgment`→`judgement`, `organiz*`→`organis*`, `modernization`→
  `modernisation`, `recognized`→`recognised`, `formalizing`→`formalising` across visible prose **and** the
  metadata layer (page title, meta description default, JSON-LD, `/llms.txt`). Operator ruled the sweep
  may touch the **client-approved Work cases** too (house-style copy-edit, meaning untouched). Exempt +
  left: the `/record` transcripts (`DEC-014-1`), two code comments, and the schema.org keywords
  `parentOrganization`/`Organization`.
- **Part 7 ("honest" framing)** — reworded the 4 assertion-type instances (FAQ h1 + its meta description
  → "straight answers"; dropped "Honestly," in the `this-site` case; `/llms.txt` `/faq` note → "Straight
  answers"). The descriptive "honest record/account" group left intact (it describes demonstrated candor,
  not a protested claim — the `DEC-000-6` evidentiary frame).
- **Part 2a (meta descriptions)** — added unique per-page `description`s to Home, About, Method, Contact,
  Phases (previously all inherited a stale generic default predating the Conv 017/018 home rework);
  History/FAQ/Testimonials already had their own. Operator-tuned: "Fraser" not "Fraser Gorrie"; Home + About
  reworded so "40 years" attaches to Fraser's career, not to AI.
- **Left as-is (ruled):** Part 1a career-length variation ("over 40" / "44" / "forty-odd" — intentional,
  two prior deliberate calls); Part 1c "North America" vs "Canada" (different referents); Part 3 layout
  measure (already consistent); Part 5 heading hierarchy (scoped-only, Conv 028); Parts 2f/2g minor
  metadata wording.
🔴 **Not yet verified in the running product** — the Part 4 rhythm change + copy edits need a build/deploy
eyeball before final. Changes uncommitted at time of writing.

### [SITE-ANALYTICS] · promoted Conv 018
Add web analytics and design what it should teach us — not just a default pageview install. Two parts:
(1) **choose + wire a provider** (GA4 vs a privacy-lighter option like Plausible/Cloudflare Web Analytics —
weigh against the near-zero-JS build and the site's EU reachability / consent obligations), and
(2) **event + funnel design** — define the clicks/paths worth tracking (hero CTAs → `/contact`, `/work`
and `/phases` navigation, testimonials "see all", the phases self-qualification funnel) so we learn how
prospects move through the site. 🔴 Privacy/consent is a real gate for a provider that sets cookies or
sends PII. Likely wanted around `[SITE-GO-LIVE]`. (hopper → Conv 018)

### [SITE-A11Y] · promoted Conv 027
Full WCAG AA review across the whole site, re-checking the Conv 006 scaffold baseline against everything
added since — home rework (Conv 017/018), `/phases` (incl. the new pricing section), the `/work` cases +
`/record` pages, testimonials, FAQ, the contact form, the new `/privacy` page, and the footer.

Checklist: heading order + a single `h1`/page; landmark roles/labels; link text (no bare "here"); color
contrast in **both** light and dark themes; visible focus + logical focus order; keyboard-only nav incl.
the `<details>` disclosures (nav, FAQ, footer em-note) and the mockup lightbox; contact-form labels +
error association; image alt text (`fraser.jpg`, case mockups, the pipeline/diagram SVGs — decorative vs
meaningful); `prefers-reduced-motion`; skip-to-content link.

✅ **Ungated (Conv 028)** — the prose pass on the pending pages (FAQ + Testimonials) is complete, so the
content-dependent a11y (heading order, link text, alt text, `aria-label`s) can now be checked against
settled copy. Pairs with `[SITE-CONSISTENCY]` + `[SITE-PERF]` as the pre-go-live quality sweep; wanted
before `[SITE-GO-LIVE]`.

## ⏸️ Parked

_None._ (`[SITE-TEST-SETUP]` completed Conv 006; its gate — the scaffold — is satisfied.)

## ✅ Completed this conv

### Conv 028 — FAQ + Testimonials prose review; accordion-legibility styling; UK spelling standard
- **FAQ prose review (operator-driven, item by item)** — reworded the "too old" opener ("experience is the
  asset here, not the liability"); the AI-cost Q + answer (dropped "Honestly"; "anyone good" → "anybody with
  significant AI dev experience"; question → "If AI does software development well…"); "work with existing
  code" ("Some people"; "assess the situation"); ongoing maintenance ("a few clients have kept…"; "20+ years
  with no maintenance agreement. Ping me when you need me…"); communication cadence (+ a Slack/messaging
  line); time zones (North America → **Canada**; "written updates" → "email and other messaging"). Appended a
  **Claude / Claude Code** line to the tech-stack answer (verified via the claude-api skill: Claude = the LLM,
  Claude Code = the harness).
- **Testimonials prose review** — reworded the lede and the AI-era section intro to a client-led framing.
- **FAQ "Common concerns" note moved** — the redundant "The questions people sometimes hesitate to ask
  directly." (duplicated the lede) was removed from FAQ and **repurposed** as a Testimonials→FAQ cross-link.
- **Accordion legibility (`DEC-028-1`)** — FAQ group headings lifted (weight 700 + accent underline rule,
  `.faq-group h2`) because size alone under-sold them (web research: sites lift the heading, don't indent the
  items); open answers bound with a **left accent bar** (`.faq-a`) so where an answer ends is unambiguous.
  Same grouping rule reused for the Testimonials time-period headings (`.testimonial-period-h2`); kept
  **scoped** to grouped pages, not generalised site-wide.
- **UK spelling standard (`DEC-028-2`)** — "judgment" → "judgement" on FAQ + Testimonials.
- **Hopper** — 2 items raised + ruled: a site-wide spelling-variety sweep and the "honest/honestly" reword,
  both **promoted** into `[SITE-CONSISTENCY]` (parts 6 + 7). Hopper clear at close.
- **Board** — the page-by-page prose pass marked **complete**; `[SITE-CONSISTENCY]` + `[SITE-A11Y]` ungated.
- **Deployed to staging** (version `4e10f27c`); production still never deployed.

