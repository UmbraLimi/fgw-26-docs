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

⚡ **Do-next — Conv 028:** Conv 027 was a page-by-page **prose review** with the operator. **Done:**
About, History, Contact, and Method reworked (client-facing voice, partnership framing, a de-abstracted
Method); `translation-platform`'s "judgment that mattered" + frontmatter reconciled to the AI-leapfrog /
hiatus story (`DEC-027-1`); a **pricing anchor** — a $10K–$150K qualifier on the Phases close + a FAQ
entry (`DEC-027-2`); a new **`/privacy`** page + footer link (`DEC-027-3`); the **contact form** got an
all-fields-required submit gate + the first backend-endpoint **test suite** (`DEC-027-4`); Method's
heading icons removed for prose-page consistency (`DEC-027-5`); and the contact email **unified to
fraser@frasergorrie.com** (Resend-verified on staging, `DEC-027-6`). All deployed to staging. **Remaining
prose-review pages: FAQ, Testimonials** (operator deferred to next conv). Critical path still gated:
[SITE-PERF] on the full image set (Conv 016); [SITE-NARRATIVE] on client sign-off; [SITE-GO-LIVE] on the
operator DNS + go-ahead (now also carrying the legal-review + prod-`EMAIL_TO` gates). Open polish rows:
[SITE-CONSISTENCY], **[SITE-A11Y]** (new), [SITE-OG-IMAGE], [CASE-RECORD-SIGNOFF], [SITE-ANALYTICS],
[SITE-TOOLS], [SITE-SOCIAL], [NODE-FLOOR], [CASE-MOCKUPS] (residual only — see row).

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
  live on staging Conv 009; whole-site voice/humility pass done Conv 010. Content-complete, gated on
  client sign-off.
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
- 🔴 **Client sign-off** required before the **production** deploy (`[SITE-GO-LIVE]`), **not** for
  dev/staging. De-identification guards dev/staging; sign-off guards production.

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
- Swap the two **MOCK AI-era testimonials** for real quotes (SAMPLE-badged until then) — `[SITE-TESTIMONIALS]`.
  🔴 As of Conv 018 these two also render on the **home page** (a "Recent testimonials" band, shared from
  `src/data/testimonials.json`), so the swap + SAMPLE removal must cover home *and* `/testimonials`.
- **Client sign-off** on all de-identified Work cases + testimonials — `[SITE-NARRATIVE]`.
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
(5) **section-heading hierarchy** — FAQ section headings were lifted (weight 700 + an accent underline rule,
`.faq-group h2`; Conv 028) because they shared the questions' weight; other pages' section headings stay on
plain `text-h3`. Decide whether that lifted treatment becomes the site-wide section-heading pattern or stays
FAQ-only (operator chose FAQ-only for now, Conv 028).
🔴 Gated: waits until the prose pass is done. **Progress: home (Conv 018), About / History / Contact /
Method (Conv 027) done; FAQ + Testimonials remain.** Pairs with the per-page reconciliations already owed
(voice + "44 vs over 40" — still live: About/History got the full degree treatment but the FAQ
"What have you been doing for {YEARS} years?" still interpolates 44 vs home's "over 40"). (hopper → Conv 018)

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

🔴 **Gated:** runs after the operator's own prose audit on the few pending pages — content-dependent a11y
(heading order, link text, alt text, `aria-label`s) shifts with copy. Pairs with `[SITE-CONSISTENCY]` +
`[SITE-PERF]` as the pre-go-live quality sweep; wanted before `[SITE-GO-LIVE]`.

## ⏸️ Parked

_None._ (`[SITE-TEST-SETUP]` completed Conv 006; its gate — the scaffold — is satisfied.)

## ✅ Completed this conv

### Conv 027 — Page-by-page prose review; pricing anchor; privacy page; contact gate + tests; email unified
- **Prose review (operator-driven, page by page)** — **About**: anchored the 1982 start to a named client
  (Fisheries and Oceans Canada), full university names + capitalised degrees, nowrap `Apple ][+`.
  **History**: depth-add (Fortran-on-punch-cards, published papers, MSc 1984), "A thousand miles from the
  sea…" heading, muskellunge gloss, "custom software development", a who→what fix, matching caps/nowrap.
  **Method**: all four sections reworked client-facing (concrete leash section; the last-20% as a
  client/domain-knowledge **partnership**; the git record of decisions/learnings/plans/tasks from day one;
  a two-way "we keep each other on course"), lede now shows poor choices **compound**. **Pages left for
  next conv: FAQ, Testimonials.**
- **translation-platform reconciled (`DEC-027-1`)** — "The judgment that mattered" reworked to the real
  arc (corrected DeepL, but general-purpose AI leapfrogged the pipeline; client called the hiatus first);
  `summary`/`outcome`/`proof` retold to match. Finding: `proof`/`outcome`/`problem` are **unrendered dead
  fields** — only `summary` ships (card + meta description).
- **Pricing anchor (`DEC-027-2`)** — a $10K–$150K project-scale band shown as a **qualifier** (not a rate
  card, no hourly) on the Phases close + a new FAQ entry; reverses the Conv-013 pricing-off-FAQ scoping.
- **Privacy page (`DEC-027-3`)** — new footer-tier `/privacy` describing the real data flow (contact form
  → Cloudflare edge → Resend, no DB, no analytics/cookies) with a folded-in liability disclaimer; **no
  standalone ToS**; footer "Privacy" link added. Legal review + analytics-section revision are go-live gates.
- **Contact form (`DEC-027-4`)** — "Problem or idea?" reframe + "All fields are required." text + a
  submit gate on native validity; first **backend-endpoint test suite** (`_contact.test.ts`, 12 tests,
  node vitest env, cloudflare:workers + fetch mocked, underscore-prefixed so Astro doesn't route it).
- **Method heading icons removed (`DEC-027-5`)** — the four decorative `<h2>` icons dropped for
  prose-page consistency; unused `Icon` import + dead `.method-h2`/`.method-icon` CSS cleaned.
- **Email unified (`DEC-027-6`)** — `EMAIL_FROM` + the no-JS fallback → `fraser@frasergorrie.com`
  (was `fgw@` / a `hello@` placeholder); **Resend-verified end-to-end on staging** (delivered, domain-signed,
  reply-to correct). Prod `EMAIL_TO` secret is a go-live gate.
- **Deployed to staging** (versions `37c555ad` → `e4fad37c`); production still never deployed.

