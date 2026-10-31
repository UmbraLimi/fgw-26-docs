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
2. ⚡ **[SITE-AI-SEO]** — AI/LLM discoverability (llms.txt, structured facts, AI-crawler policy). Opened
   Conv 009. Critical-path **Phase 3**; shares machinery with [SITE-SEO] (now built Conv 015).
3. **[SITE-PERF]** — page-speed as a tracked discipline (Lighthouse/CWV + budget, image optimization —
   now live imagery exists, `public/fraser.jpg`). Opened Conv 009. Critical-path **Phase 3**.
4. **[SITE-GO-LIVE]** — production deploy + cut `frasergorrie.com` over to fgw-26 on Cloudflare. Opened
   Conv 007; lean until the pre-go-live work lands. Critical-path **Phase 4** — the destination.

(`⚡` on [SITE-AI-SEO] — it shares machinery with the now-built [SITE-SEO]. [SITE-NARRATIVE] is #1 by
critical-path order but gated on sign-off, so not the next *build*.)

(**[SITE-CONTACT]** ✅ Conv 013 · **[SITE-TESTIMONIALS]** / **[SITE-FAQ]** / **[SITE-HISTORY]** ✅ Conv 013 ·
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
`[SITE-CROSSLINK]`, Conv 015), with staging held `noindex` (`DEC-015-1`). What's missing is (a) the rest
of findable/fast — AI/LLM discoverability + a deliberate perf pass, (b) the production deploy + the domain.

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

**Voice/humility pass — ✅ done Conv 010.** Re-read every page + the four Work cases + the footer against
`reference/VOICE.md`; added a **humility rule** (`DEC-010-2`) and reframed the boastful "I know…" /
"before you do" / "a cheaper wrapper can't" framing site-wide. The Home hero was also re-led with the
**business identity** headline + a **44-year differentiator** (`DEC-010-3`).

**Remaining:**
- ✅ **Urantia cases — done Conv 013:** added as two named, public Work cases (`/work/discover-jesus`,
  `/work/discover-the-ub`) for The Center for Unity — live-URL proof, no "The record" block.
- 🔴 **Client sign-off** required before the **production** deploy (`[SITE-GO-LIVE]`), **not** for
  dev/staging. De-identification guards dev/staging; sign-off guards production.

**Source material (Conv 008):** `discovery/NARRATIVE-SOURCE-GEMINI.md` (Gemini synthesis, historical);
the honesty frame + evidence came from `discovery/WORKING-METHOD.md` + `discovery/EVIDENCE-LEDGER.md`.

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
Core Web Vitals pass + a budget, and image optimization — now actionable: `public/fraser.jpg` is a real
~330 KB photo served unoptimized on three spots (Home hero avatar + band, About), and the Cloudflare
`IMAGES` binding is enabled but unused. The lightest of the three.

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
- **Client sign-off** on all de-identified Work cases + testimonials — `[SITE-NARRATIVE]`.
- **Client sign-off** on the two client "The record" summaries + transcripts (Conv 014) — `[CASE-RECORD-SIGNOFF]`.
- Turnstile spam hardening on the contact form — `[SITE-CONTACT]`.

---

## 📋 Unordered

### [SITE-OG-IMAGE] · promoted Conv 015
A 1200×630 branded social-share card, the deferred remainder of `[SITE-SEO]` (Conv 015). Build the asset,
then wire it into `og:image` + `twitter:image` and bump `twitter:card` from `summary` to
`summary_large_image` in `src/layouts/Layout.astro`. 🔴 Needs a design asset / operator call on the card's
look before any wiring. Blocks nothing — SEO works without it; wanted before `[SITE-GO-LIVE]`. (hopper → Conv 015)

### [CASE-RECORD-SIGNOFF] · promoted Conv 014
The two **client** "The record" artifacts built Conv 014 — the sharper audit-derived summaries **and**
the full token-redacted transcripts at `/work/translation-platform/record` and
`/work/learning-marketplace/record` — need **client sign-off before the production deploy** (`DEC-009-2`);
dev/staging is fine. 🔴 Mandatory redaction already applied + verified: the translation-platform client is
The Center for Unity and the source text is the Urantia Book — the *same* client named publicly in the two
Urantia cases — so the source-text identity, client org, and people (Gabriel/Carlos/CFU/UmbraLimi) must stay
masked or the confidential engagement links to the named one. Pairs with the existing client-sign-off gate on
`[SITE-GO-LIVE]` / `[SITE-NARRATIVE]`. (operator, Conv 014)

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

## ⏸️ Parked

_None._ (`[SITE-TEST-SETUP]` completed Conv 006; its gate — the scaffold — is satisfied.)

## ✅ Completed this conv

### Conv 015 — SEO + cross-links built, staging-noindex added, whole batch deployed to staging
- **[SITE-CROSSLINK]** ✅ — six closing-"nudge" cross-links added (house style: muted paragraph +
  `text-link`), so the footer-tier pages reachable *only* via the footer now have body-content inbound:
  About→History/Work, Method→Work/FAQ, Work-index→Testimonials/FAQ, case template→Work/Testimonials (one
  edit serves all six cases), Testimonials→Work/Contact, FAQ→Phases/Work. Executes the `DEC-013-1`
  follow-on. `npm run verify` green; verified in the running product, light + dark. **On staging** (Conv 015
  redeploy). Files: `about/method/faq/testimonials.astro`, `work/index.astro`, `work/[slug].astro`.
- **[SITE-SEO]** ✅ — SEO infrastructure built: `site: https://frasergorrie.com` + `@astrojs/sitemap`
  (`/styleguide` filtered out), `robots.txt`, per-page canonical + `og:url` + Twitter card, and
  site-wide `schema.org` JSON-LD (Person + ProfessionalService: Meristics / The Technifar Corporation,
  US + Canada — facts from the History copy). `verify` green; sitemap (19 URLs), robots, head tags and
  valid JSON-LD confirmed in built output. **On staging** (Conv 015 redeploy). Promoted the deferred
  `og:image` remainder to the board (`[SITE-OG-IMAGE]`) — until it lands `twitter:card` stays `summary`;
  `sameAs` waits on [SITE-SOCIAL]. Files: `astro.config.mjs`, `src/layouts/Layout.astro`,
  `src/pages/robots.txt.ts`, `package.json` (+`@astrojs/sitemap`).
- **Staging-noindex** ✅ (`DEC-015-1`) — the SEO assets are env-agnostic (canonicals/sitemap → prod), so
  staging would be independently crawlable. Keyed on `import.meta.env.MODE === "staging"` (set by
  `astro build --mode staging`), the staging build now serves `robots.txt` `Disallow: /` and a
  `noindex, nofollow` meta site-wide; prod is unchanged (allow-all). `public/robots.txt` became a
  prerendered endpoint `src/pages/robots.txt.ts`. Verified in the running product on live staging
  (`robots.txt` + `noindex` both confirmed). Files: `src/pages/robots.txt.ts` (new), `src/layouts/Layout.astro`.

