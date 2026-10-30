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

1. ⚡ **[SITE-CONTACT]** — contact form built Conv 012 (Worker → Resend). Finish: operator sets per-env
   secret files + verifies Resend sender domain, then redeploy staging + live-test end-to-end; Turnstile
   spam hardening before launch. **Next conv.** (promoted Conv 012)
2. ⚡ **[SITE-TESTIMONIALS]** — testimonials + a de-identified client list (operator idea-set item 6).
   Honour NDA: generalities only, client removed, but surface the *kinds* of work + difficulties.
   **Next-conv start.** (promoted Conv 012)
3. **[SITE-NARRATIVE]** — real site copy + de-identified Work cases. Bulk live Conv 009; **whole-site
   voice/humility pass done Conv 010**. Remainder: optional urantia case + 🔴 client sign-off (production
   gate). Critical-path **Phase 2** — content-complete, gated on sign-off.
4. **[SITE-SEO]** — SEO infrastructure the scaffold lacks (site URL, sitemap, robots.txt, canonical,
   og:image, `schema.org` JSON-LD). Opened Conv 009. Critical-path **Phase 3**.
5. **[SITE-AI-SEO]** — AI/LLM discoverability (llms.txt, structured facts, AI-crawler policy). Opened
   Conv 009. Critical-path **Phase 3**; shares machinery with [SITE-SEO].
6. **[SITE-PERF]** — page-speed as a tracked discipline (Lighthouse/CWV + budget, image optimization —
   now live imagery exists, `public/fraser.jpg`). Opened Conv 009. Critical-path **Phase 3**.
7. **[SITE-GO-LIVE]** — production deploy + cut `frasergorrie.com` over to fgw-26 on Cloudflare. Opened
   Conv 007; lean until the pre-go-live work lands. Critical-path **Phase 4** — the destination.

(**[SITE-DEPLOY-STAGING]** — Phase 1 — ✅ Conv 008 · **[SITE-ASSESS]** — ✅ Conv 009 · **[SITE-VISUAL]** —
✅ Conv 010 · **[SITE-PHASES]** — ✅ Conv 011; all in ✅ Completed.)

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
self-qualification page** + a **sticky header** are built and on staging (`[SITE-PHASES]`, Conv 011).
What's missing is (a) findable/fast (SEO), (b) the production deploy + the domain.

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

### [SITE-CONTACT] · promoted Conv 012

#### Status — Conv 012
**Built this conv; needs operator config + a live test.** The Contact page is a real form posting to a
Worker route (`src/pages/api/contact.ts`) that emails via Resend (replaces the mailto-only surface of
`DEC-004-2`). Honeypot spam trap; progressive-enhancement fetch with a no-JS mailto fallback. Verified in
dev (validation / send-attempt / honeypot). Env uses the file-based secrets convention (`VARS_SECRETS.md`):
`EMAIL_FROM` is a committed var; `RESEND_API_KEY` + `EMAIL_TO` are secrets.

**Owed by the operator:** create gitignored `.dev.vars.staging` / `.dev.vars.production` (real
`RESEND_API_KEY` + `EMAIL_TO`), confirm/edit the committed `EMAIL_FROM`, and verify the Resend sender
domain. **Then:** redeploy staging (`npm run deploy:staging`, now ships secrets via `--secrets-file`) and
live-test the round-trip. **Deferred:** Cloudflare Turnstile spam hardening (needs its own site+secret
keys) before go-live.

### [SITE-TESTIMONIALS] · promoted Conv 012

#### What it is
Testimonials + a de-identified client list (operator idea-set item 6, Conv 012). 🔴 **NDA frame
(operator, Conv 012):** FG works under NDAs + verbal agreements; testimonials and any client reference are
modified to generalities with the client removed — but there is real reader value in the *kinds* of work,
the difficulties, and generic aspects. A *named* client list may be impossible; anonymised testimonials
("a translation-platform client") are the likely form. Shares the production **client sign-off** gate with
`[SITE-NARRATIVE]`.

**Built Conv 013:** a footer-linked `/testimonials` page — the current live testimonial set (6,
de-identified, from `fg/src/data/testimonials.ts`) under an "Over the years" section, plus a separate
AI-era section. 🔴 **Owed before `[SITE-GO-LIVE]`:** the two AI-era testimonials are MOCK placeholders
(rendered with a visible SAMPLE badge) — swap for the real quotes (operator sourcing) + client sign-off;
they must never ship to production as if real.

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

---

## 📋 Unordered

### [CASE-RECORD-OVERHAUL] · promoted Conv 013
The Work cases' **"The record — an independent read"** (AI-review) blocks read too generalised and
operator-massaged. Overhaul into a genuine independent audit: Claude reviews each project's repo + docs
and reports real findings — **# of convs, date range, concrete highlights**, in the format Claude actually
produces (can be lengthy). **Stamp each with a review date + Claude version** for legitimacy. Goal: a real
independent audit, not marketing. Note: the new Urantia cases deliberately carry no such block (public-URL
proof instead) — decide whether they need one. (operator, Conv 013)

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

### Conv 012 — visual/UX polish + a working contact form
Operator idea-set (`B`, Conv 012) walked one at a time (order 1,2,4,5,6,7,8); items 1/2/4 shipped, 5
built, 6/7/8 promoted. Plus a contact form and a secrets convention. All committed; `npm run verify`
green; each verified in the running product (light + dark).
- **[item 1] Case-page extras** — a JSON-driven system (`src/data/case-extras.json` + a `caseExtras`
  collection): per-case vertical line-art **diagram**, **tools** chips, **benefit** line, and an index-card
  **motif**. Mock content for all four cases; client-case diagrams are NDA-gated, shown with a "Sample"
  caption. (`DEC-012-1`)
- **[item 2] Section icons** — 7 feather glyphs: markers on the four Method claims + the three Home
  "What I do" cards, and a "Judgment in practice" eyebrow on the proof band (parity fix).
- **[item 4] Brand marks** — FG monogram **favicon/app-icon set** (svg + 32px png + apple-touch + a real
  .ico, replacing the Astro default) and the monogram **header lockup** beside the wordmark.
- **Theme fix** — the colour choice no longer drops on view-transition navigation (re-asserted on
  `astro:after-swap`; Astro was resetting `<html>` attributes on swap).
- **Header** given the elevated `--surface` tone — a subtle step from the body where the 1px line was
  near-invisible in dark. (`DEC-012-4`)
- **Contact form** (`[SITE-CONTACT]`, live Ordered row) — real form → Worker route → Resend, replacing
  the mailto. Built + dev-verified; owed: operator secrets + Resend domain + live test. (`DEC-012-2`)
- **Secrets/config convention** — `VARS_SECRETS.md` playbook (file-based, documented): `EMAIL_FROM` var +
  `RESEND_API_KEY`/`EMAIL_TO` secrets, deploy via `--secrets-file`. **Fixed** the `DEC-008-1` deploy guard
  (`assert-worker.mjs`) — it read the pre-v14 `dist/client/` path and had silently stopped guarding. (`DEC-012-3`)
Mechanism + screenshots in the conv record.

(`[SITE-PHASES]` ✅ Conv 011 · `[SITE-ASSESS]` ✅ Conv 009 · `[SITE-VISUAL]` ✅ Conv 010 — archived to their conv records.)
