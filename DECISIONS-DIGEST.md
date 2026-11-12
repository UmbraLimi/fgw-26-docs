# Decisions digest — fgw

🔴 **Generated — do not edit.** A deterministic projection of `DECISIONS.md`: each entry's heading + its `Decision:` gist (tombstones = heading only). Regenerate with `.claude/scripts/gen-decisions-digest.sh`; `/r-end` refreshes it when `DECISIONS.md` changed. Load THIS file to scan for precedent, then open the cited `DEC-NNN-N` in `DECISIONS.md` for the full Decision/Rationale/Consequences.

_As of 2026-11-12._

---

### DEC-041-2 — Content-media policy: no byline, optional updated-date, optional on-page hero

How content pieces (guides + blog) handle attribution, dates, and images. (a) **No visible
byline** anywhere; authorship is carried in JSON-LD only (a `Person`/`author`, owned by
`[SITE-STRUCTURED-DATA]`) — no `author` field in either schema. (b) **Dates:** guides stay **undated**;
blog keeps `pubDate` and gains an **optional `updatedDate`** (renders "Updated <date>", feeds
`dateModified` in the deferred per-post JSON-LD). (c) **Images:** optional `image()` **hero on blog posts
only** (schema object: `src` + required `alt` + optional `caption`/`credit`), rendered as an **on-page
adornment** atop the article and **not** wired to `og:image` (shares keep the branded 1200×630 card in
`Layout.astro`); plus `.prose img` styling for inline markdown images. Guides stay text-only. Any
third-party image needs alt + a visible credit.

### DEC-041-1 — Inline prose links unified on a shared `--link` token (semibold, no underline)

All inline prose/content links across the site share one treatment: a new `--link` token
(`light-dark(#b23a0b, #f6b85e)`) + `font-weight: 600`, no underline. Both `.prose a` (markdown bodies) and
`.text-link` (hand-authored inline links) point at it; `.text-link` drops its former underline to match;
hover standardized to `--ink`. `.prose img` added alongside.

### DEC-040-4 — Voice-balance rules: conjunction cap (~2 each) + metaphor surface-and-rule

Two standing content voice guidelines, recorded in `VOICE.md`. (a) **Sentence-initial
conjunctions** ("And"/"But"/"So"): a guideline of **~2 of each per article** (not a hard cap, not 2
total); CC audits a piece, presents a per-type summary, and the operator rules which to keep vs. reword.
(b) **Metaphors / clichéd "pull-back" phrases**: **no hard cap** — CC audits and **highlights the
unexpected/distinctive ones** (vs. mild expected phrasings), the operator rules each; structural metaphors
(a whole analogy, the core hook) are the spine and kept. Both serve one aim: the **balance** of
transitions/contrasts/emphasis that keeps the reader feeling talked to directly — not mechanical counting,
never about provenance (a CC-written sentence can stay; an operator-written one can be the one reworded).

### DEC-040-3 — Guides carry an optional end-of-page glossary (frontmatter + template)

Guides may define an optional **`glossary`** array in frontmatter (`term` + `definition`),
rendered as a **small, muted block** (hairline top rule) at the very bottom of the guide by `[slug].astro`,
only when present. The Trust guide seeds four terms (Edge case, Happy path, Silent failure, Automated test).

### DEC-040-2 — Editing working-mode: improve in-voice, surface candidates, watch audience-drift

The cadence for CC editing pre-curated content. (a) When applying a `P#S#` edit, CC is **free
to normalize and improve the prose while keeping the voice** (consulting `VOICE.md`/`PERSONA.md`); the
operator says **"verbatim"** for a literal replacement. (b) CC **notices good turns of phrase / deliberate
voice departures**, surfaces them (inline, or a `VOICE-CANDIDATE` hopper line mid-flow); operator-approved
ones land in `VOICE.md`'s accretion section. (c) CC **watches for audience-drift** (teaching coders inside
buyer copy), **reframes to the buyer**, and **preserves the coder-angled material** in
`_cc/for-builders-tidbits.md` (a capture bin toward a rare, separate "for builders" article). The
buyer/coder line is blurred (these buyers have built with AI) — the real divider is **vernacular**, not
concept (recorded in `PERSONA.md`, refining `DEC-036-2`).

### DEC-040-1 — Content coordinate-view tool + `P#S#` edit-addressing convention

Build **`scripts/number-content.mjs`** (fgw-26): it prints a guide/article with a positional
address on every block (`P#`) and sentence (`S#`), computed on demand and **never stored in the content**.
The operator points CC at an exact edit site ("change P2S4 to read …"); CC edits the clean source and
reprints the view. An `npm run number` alias is added.

### DEC-039-1 — Content home built dark; one `CONTENT_HOME_LIVE` flip switch

Build the `[SITE-CONTENT-HOME]` guides + writing surface in `fgw-26` but keep it **dark**
until the first cornerstone guide (and first article) are finalised and approved. One boolean
`CONTENT_HOME_LIVE` (consts.ts) drives `noindex`, sitemap exclusion, and (DEC-039-4) nav/footer
visibility; `[slug]` routes stay draft-filtered so a prod/staging build generates only approved pieces
(drafts still preview in `astro dev`). Per-piece JSON-LD (`CreativeWork`) is deferred to
`[SITE-STRUCTURED-DATA]`, with a clean `slot="head"` hook left on the detail pages.

### DEC-039-2 — Production deploys banned until the content home is finalised (fail-closed)

No **production** deploy until the first article + all three guide pages are finalised.
Enforced technically: `scripts/assert-prod-deploy-allowed.mjs` runs first in the `deploy` script and exits
non-zero while `PROD_DEPLOY_BANNED` is true; `deploy:staging` does **not** call it (staging deploys as
usual).

### DEC-039-3 — Content-home IA: "Guides" + "Writing", single-purpose pages, `/blog/` → `/writing/`

The content home is two single-purpose sections bound by cross-links, not a mixed index:
**`/guides/`** (label "Guides") holds the undated cornerstones; **`/writing/`** (label "Writing") holds the
dated articles, renamed from `/blog/`. One nav entry, "Guides" → `/guides/` (which leads with the
cornerstones + a "Latest writing" teaser); "Writing" is reached from the guides hub, each guide's related
list, and a footer link. Each article up-links to its pillar guide; each guide lists related articles.

### DEC-039-4 — Content-home nav/footer links gated `CONTENT_HOME_LIVE || DEV`, committed

The nav + footer content-home links render only when `CONTENT_HOME_LIVE ||
import.meta.env.DEV` — shown in `astro dev` and once the flag flips, hidden in prod/staging builds while
dark — so they are **committed as ordinary code** rather than kept as uncommitted working-tree
"dev-preview" edits reverted each conv.

### DEC-039-5 — Nav trimmed: drop "Home", keep Phases (Phases also added to the footer)

Drop the "Home" item from the top nav — the brand logo/wordmark already links home — and keep
Phases. Nav = Work · Guides · Method · Phases · About · Contact. Phases is also added to the footer (it was
the one main-nav page missing there).

### DEC-038-1 — Posting-plan channel & funnel strategy (`reference/CHANNELS.md`)

Stand up the X + LinkedIn posting plan as a durable **channel/funnel reference**,
`reference/CHANNELS.md` — a third content axis beside `PERSONA.md` (who he is) and `VOICE.md` (how it
sounds). It sets: two funnel entries — **word of mouth** (traditional, unpredictable) + **inbound
discovery** via search/GEO (cultivated secondary, DEC-038-2); the social channels as a
**confirmation/qualification layer** (not cold acquisition), with the site's evergreen content the one
acquisition surface; channel roles — **LinkedIn** primary (positioning/credibility), **X** downstream echo
(personality), **Website** (qualify/convert + content home); cadence — **biweekly LinkedIn, opportunistic
X**; pillars — **Trust / Steering / Deciding** + a 40-years **Judgement** thread; sourcing — capture habit +
case-record mining + de-identified project drip; workflow — **CC drafts → operator approves → publish**,
write-once-then-distribute.

### DEC-038-2 — Secondary funnel entry: inbound discovery (search + GEO), not referral partnerships

Diversify the top of funnel with **inbound discovery** — buyer-education content found via
search and AI assistants — as the cultivated second entry point.

### DEC-038-3 — Content home: guides + blog, hub-and-spoke

Build the content home as undated cornerstone **guides** (one per pillar — the GEO/SEO
acquisition backbone) + a dated **blog** (the "alive" stream and the owned home for
write-once-then-distribute to LinkedIn/X), with posts linking *up* to the guides.

### DEC-038-4 — Editor model reaffirmed: CC is sole editor of every file; per-project, operator approves

CC makes **every file edit** in this project (process, governance, and — with operator approval
before publish — site/deliverable copy); the operator **directs or approves** and does **not** edit files.
Standing for this project, **adopted per-project on onboarding** — not a blanket all-projects rule, and does
not preclude the operator editing directly in a project that hasn't adopted it.

### DEC-038-5 — Em-dash policy: all-content sanity check (surface before publishing), not a ban

Before publishing *any* new content (site page, blog, guide, LinkedIn/X post), CC **surfaces
every em-dash** for the operator to rule; em-dashes are **not banned**. Existing vetted copy stands. Also:
prefer complete sentences over fragment pile-ups on social (one rhetorical question is fine).

### DEC-038-6 — OG share card names the subject + carries a headshot (supersedes `DEC-031-5`)

Rebuild the sitewide OG/Twitter card (`public/og-image.jpg`, 1200×630 JPEG,
`summary_large_image`) from a **durable HTML source** (`_cc/assets/og-image.html`, headless-Chrome render +
`sips`) that **names what is built** ("Custom Software"), adds **"MSc"** (eyebrow treatment) + **"Over 40
years"**, uses **"Built with AI for speed / Steered by me for quality"**, and includes a **circular
headshot**. `og:image:alt` updated to match.

### DEC-038-7 — No X Premium

Keep X free/lean; do not buy Premium.

### DEC-037-6 — `DEC-024-1` affirmed: CC surfaces site-copy edits for approval (the balk was right)

`DEC-024-1` stands. The operator is the **approver** of site/deliverable-copy changes; CC
presents the exact change for approval rather than editing site content silently. When the operator
explicitly directs it and the exact wording is already approved in chat, CC may apply the edit, but still
shows it. Process/working files (`_cc/*`, board, hopper, `DECISIONS.md`) are outside `DEC-024-1` — CC
maintains them directly, as always.

### DEC-037-5 — Deactivate the stranded Meristics LinkedIn Company Page

Deactivate the Meristics LinkedIn Company Page (operator executed), orphaned after the
Conv-036 makeover repositioned the profile to "Fraser Gorrie · Self-employed".

### DEC-037-4 — Trailing-slash URLs: keep the slash, align internal links

Keep the site's **trailing-slash** canonical form (`/about/`) and fix the internal links
(written as `/about`) to include the slash — rather than switching the whole site to no-trailing-slash
URLs.

### DEC-037-3 — `/about` AI framing: drop "unreliable", keep candor where it's paired with the human-skill answer

On `/about`, reframe "a powerful, **unreliable** tool" → "a powerful tool" (drop the
defect-label), aligning with the persona's "worthy companion to AI" positioning. Leave the "confidently
wrong" candor on `/method` and `/llms.txt` **unchanged**.

### DEC-037-2 — Site client-geography: "US, Canada and Europe"

Add Europe to the site's client-geography statements to match the Conv-036 LinkedIn copy —
in `history.astro`, `llms.txt.ts`, and the homepage JSON-LD `areaServed` (`Layout.astro`). Deployed live.

### DEC-037-1 — X.com profile makeover (educating front door, inherited direction)

Reworked the X.com profile **live** to the same "educating front door" direction + buyer
audience as LinkedIn (`DEC-036-1`/`-2`): display name **"Fraser Gorrie, MSc 🇨🇦"** (MSc science nod + 🇨🇦 for
the Canada signal); a **concise bio** — "Software developer, over 40 years. Helping you get software worth
trusting out of AI." — seasoning kept quiet, the education angle reserved for *content* not the bio; a new
warm-dark brand **header** ("SOFTWARE DEVELOPER · 1982 → AI") re-rendered at X's 1500×500, replacing the
old "2 Paths / Done For You / Done With You" sales banner; kept location/website/photo; kept the current
pinned post, deferring a deliberate buyer-facing pin to `[POSTING-PLAN]`.

### DEC-036-3 — `reference/PERSONA.md` as the standing persona/audience reference

Create `reference/PERSONA.md` — Fraser's outlook, approach, propensities, and audience — as
the standing reference consulted (alongside `reference/VOICE.md`) for **all** social-media and website
content work. Registered via a new `## References` pointer in `CLAUDE.md`.

### DEC-036-2 — Social/educating audience: buyers, not builders

The audience for the social presence + educating content is **buyers** — business
owners/operators who need apps and are commissioning/buying AI-built software — explicitly **including
those who have tried to build with AI themselves** (the site's straw-man → tin-man → steel-man
self-qualification arc). Not professional programmers serving their own clients.

### DEC-036-1 — Social/LinkedIn positioning: the "educating front door"

The social presence mirrors the **site's** voice + brand and acts as a top-of-funnel that
**educates/teaches** (demonstrating judgement), routing people to `frasergorrie.com` for depth + proof.
The LinkedIn profile dropped the prior sales framing ("2 Paths / Done For You / Done With You", bold-unicode)
for the site's understated, candid register.

### DEC-035-4 — Port the fps inline-trigger cadence mechanism into `/r-start`

Add a "Cadence checks" block to `/r-start`'s pre-computed context (arithmetic on
`CONV-COUNTER`) plus a Step 6 instruction to surface each line verbatim — `DUE` becomes the conv's
recommended action; the trigger only *surfaces*, never runs the work. Two triggers: `[GOOGLE-SERVICES]`
due when `n%3==2 && n≥38` (every 3 convs from 038), `[AGENT-DISCOVERY-WATCH]` due when `n%10==5 && n≥45`
(every 10 from 045).

### DEC-035-3 — Pursue agent-discoverability as a tracked initiative

Pursue being found and answerable by AI agents as a first-class initiative, home doc
`AGENT-DISCOVERABILITY.md` (repo root). Layered: L0 be-extracted-correctly → L1 JSON-LD `Person` +
`ai-agent.json` manifest → L2 a remote MCP server on the Cloudflare Worker (query tools incl.
`evaluate_fit`) → L3 Web Bot Auth + lead capture. Discovery via the official MCP registry + directories.
Public profile facts captured: Ontario/Canada → serves North America; native/fluent English; Eastern
Time.

### DEC-035-2 — Agent-answer data model: a `.private` schema + parameterized prose

Gated data in `src/data` lives under a per-record `.private` key; a single `toPublic()`
boundary strips it and feeds both the rendered site and any MCP tool (default-deny). Target **100%
structural masking** — relational guards (no testimonial→case bridge; target language never named) made
structural by keeping sensitive values only under `.private`, never as public fields. Load-bearing prose
facts (e.g. project cost range) are parameterized out of page text into `src/data`.

### DEC-035-1 — `.btn-secondary`: 3:1 border + translucent-ink hover

`.btn-secondary` reads as a button via a 3:1 resting border (`--line` → `--field-border`)
and a hover that is a translucent ink overlay — `background-color: color-mix(in oklab, var(--ink) 8%,
transparent)`.

### DEC-034-2 — `[SITE-HEADER-TITLE]`: reveal the page title in the sticky header on scroll

Implement `[SITE-HEADER-TITLE]` as an explicit per-page `headerTitle` prop (threaded
`SiteLayout` → `Nav`), revealed by an `IntersectionObserver` on the page H1 once it scrolls above the
sticky bar. It shows **inline beside the brand at ≥1024px** and as a **full-width second row inside the
sticky header below 1024px**, styled as an **eyebrow** (uppercase, ember `--accent-strong`),
**left-aligned**. Home omits the prop, so no reveal there.

### DEC-034-1 — Masking exception: the Gabriel Rymberg testimonial may name Gabriel + the Center for Unity

Gabriel Rymberg's live testimonial (home mask-safe pull-quote + full named quote on
`/testimonials`, `#gabriel-rymberg`) names **Gabriel + the Center for Unity** under a deliberate
**testimonial-only** exception to the standing masking guard (`DEC-023-3`). The exception is bounded: the
`translation-platform` case stays de-identified, no case-study link bridges the named testimonial to that
case, the target language is never named anywhere, and `discover-jesus`/`discover-the-ub` are unchanged.

### DEC-033-2 — robots.txt single-source: disable Cloudflare Bot Preference Sync

Resolve the live `robots.txt` inconsistency by disabling Cloudflare's **Bot Preference Sync**
(the managed-robots.txt prepend, in the zone's AI-Crawler-access-policies panel), making the repo's own
`robots.txt.ts` the single published source. Do **not** reproduce Cloudflare's broader training-UA block
list into the repo.

### DEC-033-1 — Turnstile rendered "interaction-only" to hide the contact-form widget

The contact-form Turnstile widget renders with `appearance: "interaction-only"` so the box
stays hidden for a visitor who passes silently, surfacing a challenge only when Cloudflare judges one
needed. Server-side `siteverify` + the honeypot are unchanged.

### DEC-032-7 — `/r-hopper` gains a Carry disposition

`/r-hopper`'s per-item ruling adds a 4th option, **Carry** (`D`): leave the item in the
hopper untouched to ride to the next conv. "Save/keep for next conv" means Carry, not Promote.

### DEC-032-6 — Auto-mode denial → notify the operator and wait

On an auto-mode classifier denial, tell the operator it blocked the action and wait for
direction — no self-chosen workaround (`!<command>`, disabling auto-mode) and no retry.

### DEC-032-5 — Old-URL redirects: in-repo 301s, trailing-slash targets, fg-only

The URLs the fgw-26 rewrite changed/dropped from the previous live site (`fg`) get 301
redirects in `astro.config.mjs` → `_redirects`: `/how-i-work`→`/method/`, `/services|/web-dev|/ai-coaching`
→`/work/`, `/terms`→`/privacy/`, `/blog`→`/` (provisional). Targets carry trailing slashes (single hop).
The 2023 `frasergorrie` legacy URLs are **not** covered.

### DEC-032-4 — Routes are production-only; a deploy guard enforces it

Worker `routes` (apex custom domain + `www` route) live only in the top-level (production)
`wrangler.jsonc`; `env.staging` sets `routes: []` + `workers_dev: true`. `assert-worker.mjs` refuses to
deploy any non-prod build (`name !== "fgw"`) that carries routes.

### DEC-032-3 — Image brown-band fix: absolute-fill the `<img>`

`.hero-portrait` / `.headshot` / `.case-mockup` images are `position:absolute; inset:0`
inside their positioned box (keeping `object-fit:cover`), instead of relying on `height:100%`.

### DEC-032-2 — Contact form: inline handler re-bound per navigation

The contact form's JS enhancement is `is:inline` and re-binds on every `astro:page-load`
(idempotency guard `form.dataset.enhanced`); the `<form>` gets `data-astro-reload`.

### DEC-032-1 — DNS cutover: config-as-code, zone already on Cloudflare, email preserved

`frasergorrie.com` is cut to fgw-26 by binding the apex as a Worker **custom domain**
(`wrangler.jsonc` top-level `routes`, config-as-code) and `www` as a Workers **route** on its existing
proxied CNAME; the app redirects `www`→apex. The zone was **already active in this Cloudflare account**
(Namecheap NS already point to Cloudflare) → **no nameserver change**; MX + SPF/DKIM/DMARC TXT are a
different record type and left untouched.

### DEC-031-8 — Turnstile gates the cutover; explicit-render widget + fail-closed server verify

Cloudflare Turnstile on the contact form is a **cutover gate** (operator ruling at `/r-hopper`).
The widget renders *explicitly* and re-renders on every `astro:page-load` (survives view-transition nav);
`api/contact.ts` verifies the token via siteverify **fail-closed**, *after* field validation; the public
site key is in `consts.ts` (`TURNSTILE_SITEKEY`), the secret a Worker secret (`TURNSTILE_SECRET_KEY`, in
`wrangler.jsonc` `secrets.required` + `.dev.vars`).

### DEC-031-7 — A completed board row is deleted to the tags line, not archived inline

When a task completes, its `CURRENT-TASKS.md` row is **deleted** and the task drops to a
one-line `## ✅ Completed (tags)` entry; the detail lives in commit messages, `DECISIONS.md`, and
`docs/convs/`. The board shows only live work.

### DEC-031-6 — Staging stays mirrored to production until the domain cutover

Until `frasergorrie.com` is cut over, every production deploy is mirrored to staging (and
vice versa) so the two serve identical builds — only the intentional env differences remain (staging
`noindex` + GA gated off). Operator instruction; expires at cutover.

### DEC-031-5 — ⛔ superseded by `DEC-038-6`

### DEC-031-4 — Image optimization via astro:assets `<Picture>`

The two heavy rasters (`fraser.jpg` 335 KB, `redline.png` 352 KB) go through astro:assets
`<Picture>` (AVIF/WebP + resized fallback), right-sized per placement; `fraser.jpg` moved `public/` →
`src/assets/`; SVG mockups pass through; the `<picture>` wrapper is unwrapped with `display:contents` so
existing `object-fit:cover` sizing holds; the JSON-LD `image` single-sources the imported asset's `.src`.

### DEC-031-3 — Go-live split into two steps; reversible prod worker early, DNS cutover last

`[SITE-GO-LIVE]` splits into **step 1** (deploy the production worker + prod `EMAIL_TO`,
verify on `*.workers.dev` — reversible, domain untouched) done now, and **step 2** (custom-domain binding +
DNS cutover — irreversible) done **last**, after `[SITE-PERF]` + `[SITE-OG-IMAGE]`. Critical path re-sequenced.

### DEC-031-2 — GA4 is production-only; page_view sent manually on astro:page-load

GA4 (`G-EH3RJTF0VE`, lean gtag, no banner — `DEC-030-3`) renders **only in production**
(`!isStaging`). Because the site uses `<ClientRouter>`, the automatic page_view is disabled
(`send_page_view:false`) and one is sent manually on every `astro:page-load`. `/privacy` was rewritten to
name GA + an opt-out, the lede softened, stale no-analytics/legal notes dropped.

### DEC-031-1 — Social links: X as `x.com`; footer brand marks + JSON-LD `sameAs`

`[SITE-SOCIAL]` adds X (`x.com/frasergorrie`) + LinkedIn (`linkedin.com/in/frasergorrie`) to
the footer (inline fill-SVG brand marks, `sr-only` labels) + a `sameAs` array on the Person JSON-LD.

### DEC-030-6 — `/work` case layout: hoist the visual + benefit above the prose on mobile

The `/work/<slug>` case page is a 3-part grid — `.case-lead` (mockup/diagram/segment-table +
the one-line benefit), `.case-main` (prose), `.case-extra` (Built-with tools). Mobile (flex-column, DOM
order) stacks **lead → prose → tools**; desktop uses `grid-template-areas` ("main lead" / "main extra") to
reassemble the prior sticky two-column sidebar unchanged. `CaseExtras.astro` gained a `part` prop
("lead" | "tools") to render the two groups into their slots.

### DEC-030-5 — NODE-FLOOR: guard `typecheck` with a pretypecheck node check

Added `pretypecheck: node scripts/check-node.mjs` to `fgw-26/package.json` so `npm run
typecheck` fails with the clear "run `nvm use`" message on Node below the engines floor, matching the
existing `predev`/`prebuild` guards. The repo `.nvmrc` (24.22.1) already existed.

### DEC-030-4 — The Tooling statement ships on the home page only

Fraser's summative tools statement ("The tools I reach for" — Claude Code/Claude first;
comfortable with OpenAI + Codex; open-source LLMs on personal work; third-party in-app tools the client's
choice) ships as a Home section (eyebrow + h2), single-sourced. The `[SITE-TOOLS]` dedicated-page idea
stays parked.

### DEC-030-3 — GA4 as the analytics provider, lean and banner-less

`[SITE-ANALYTICS]` will wire **Google Analytics 4** into the Layout `<head>` and rewrite the
`/privacy` "Analytics and cookies" section with it (the two move together), mirroring the current live
site's approach in `fg`: a basic `gtag` snippet, **no consent banner**, with a plain privacy disclosure.
Blocked on the real `G-XXXXXXX` Measurement ID (operator standing GA up "today"; `fg` carried only a
`GA_MEASUREMENT_ID` placeholder).

### DEC-030-2 — Drop the `/privacy` legal-review go-live gate

The pre-production **legal review** of `/privacy` (CC-drafted, Conv 027) is removed as a
`[SITE-GO-LIVE]` gate — the operator deems the policy adequate and does not want a lawyer.

### DEC-030-1 — WCAG AA remediation: three fixes, with a scoped form-border token

Three WCAG AA gaps found in the `[SITE-A11Y]` review were fixed: **F1** input/textarea
placeholder colour `--faint`→`--subtle` (2.9:1 → 5.2–5.4:1, WCAG 1.4.3); **F2** a new `--field-border`
token (`light-dark(#8f8169,#7a7161)`, 3.1–3.7:1, WCAG 1.4.11) scoped to `.input/.textarea/.select`; **F3**
contact-form per-field error association — `aria-describedby` → a `field-error` slot, with blur-time
`aria-invalid` + a plain-language message cleared on valid input (WCAG 3.3.1).

### DEC-029-5 — Suppress the unfulfilled AI-era testimonials behind a reversible flag

The two AI-era testimonials (the home "Recent testimonials" band and the `/testimonials`
"In the AI era" section) are suppressed behind a `showAiTestimonials = false` flag in `index.astro` +
`testimonials.astro` — markup left intact; the `/testimonials` lede is flag-gated to a single-group
wording. The quotes never arrived from the two clients and may not. Restore = add a real signed-off quote
to `testimonials.json` and set the flag `true`.

### DEC-029-4 — Unique per-page meta descriptions for the pages that inherited the default

Home, About, Method, Contact, and Phases each get their own `description` (previously they
inherited a generic default predating the Conv 017/018 home rework). History/FAQ/Testimonials already had
their own; minor pages (Work, Privacy, etc.) keep the default.

### DEC-029-3 — Stop asserting honesty in copy; keep describing a candid record

The four assertion-type "honest/honestly" instances were reworded — FAQ h1 + its meta
description → "straight answers"; "Honestly," dropped in the `this-site` case; `/llms.txt` `/faq` note →
"Straight answers". The descriptive uses ("an honest record", "the honest account", "name its limits
honestly") are kept.

### DEC-029-2 — Execute the UK-spelling sweep site-wide, incl. metadata and the client-approved cases

The `DEC-028-2` UK standard was swept across all visible prose **and** the metadata layer
(page title, default meta description, JSON-LD, `/llms.txt`): judgment→judgement, organiz*→organis*,
modernization→modernisation, recognized→recognised, formalizing→formalising. The sweep **includes the four
client-approved Work cases** — a spelling standardisation is treated as a non-substantive copy-edit that
client content sign-off does not freeze. Left untouched: the `/record` transcripts (`DEC-014-1`, verbatim
auditor output), developer code comments, and the schema.org vocabulary keywords
`parentOrganization`/`Organization`.

### DEC-029-1 — Reconcile non-home vertical rhythm by reducing the global section rhythm

`--section-rhythm` reduced from `clamp(4rem, 8vw, 8rem)` to `clamp(3rem, 5vw, 4.5rem)`,
applied uniformly to all `.section`/`.band` edges (below the header, between sections, above the footer).
Home keeps its 2.5rem `-tight` override.

### DEC-028-2 — Site-wide spelling variety standard = UK English

The site standardises on **UK English** spelling. This conv fixed "judgment" → "judgement"
on the FAQ ("too old" answer) and Testimonials (pre-AI intro); a site-wide sweep for any remaining US
forms (-ize, color, etc.) is promoted into `[SITE-CONSISTENCY]` (part 6).

### DEC-028-1 — FAQ accordion legibility: lift the group headings and bar the open answers (scoped, not indented)

On the FAQ, group headings are lifted — weight 700 + a 2px accent underline rule
(`.faq-group h2`) — and open answers carry a 2px left accent bar (`.faq-a`). The same heading rule is
reused for the Testimonials time-period headings (`.testimonial-period-h2`). The treatment is kept
**scoped** to these grouped pages; other pages' section headings stay on plain `text-h3`.

### DEC-027-6 — Contact email unified to `fraser@frasergorrie.com`

`EMAIL_FROM` (in `wrangler.jsonc`, both the default and staging envs) and the contact page's
no-JS mailto fallback are both set to `fraser@frasergorrie.com`, replacing `fgw@frasergorrie.com` and a
`hello@frasergorrie.com` placeholder respectively. Verified **end-to-end on staging** this conv: Resend
accepts the sender (the whole `frasergorrie.com` domain is verified — `signed-by frasergorrie.com`),
the mail is delivered to the inbox, and `reply-to` carries the submitter's own address.

### DEC-027-5 — Method's per-section heading icons removed, for prose-page consistency

dropped the four decorative `<h2>` icons (lock / pie / document / alert) on `/method`; its
headings are now plain, like every other prose page (About, History, Phases, FAQ, Privacy). Removed the
now-unused `Icon` import and the dead `.method-h2` / `.method-icon` rules from `global.css`.

### DEC-027-4 — The contact API gets the first backend-endpoint test suite; a convention for where such tests live

added `src/pages/api/_contact.test.ts` — 12 vitest tests over the `/api/contact` route
(required-field validation, email-shape rejection, honeypot fake-success, `503` when unconfigured, the
Resend POST payload + success, `502` on Resend failure, the no-JS `303` redirects, `GET` → `405`). It runs
in the **node** vitest environment (per-file docblock) with `cloudflare:workers` (`env`) and global
`fetch` mocked, and is **underscore-prefixed** so Astro's file-based routing does not turn it into a route
— an un-prefixed `*.test.ts` under `src/pages` prerenders as an endpoint and breaks the build (hit this
conv).

### DEC-027-3 — A `/privacy` page now; no standalone ToS; a liability disclaimer folded in

shipped a footer-tier `/privacy` page describing the **actual** fgw-26 data flow (contact
form → Cloudflare edge → Resend email; no database; no analytics / cookies currently), with a short
**liability disclaimer** folded in ("provided as is… nothing is a professional commitment until it's set
out in a written agreement") and a footer "Privacy" link — and **no** standalone Terms of Service. The
"Analytics and cookies" section is a stub to revise when `[SITE-ANALYTICS]` wires a provider.

### DEC-027-2 — Pricing shown as a qualifier: a project-scale band, not a rate card

a **$10K–$150K** project-scale band appears as a qualifying line on the Phases close (a new
"What to budget" section before the CTA) and as a new FAQ entry ("What does an engagement cost?"). Framed
as a range to self-qualify against, **not** a quote; **no hourly rate** shown. The FAQ entry **reverses**
the Conv-013 scoping that dropped pricing from the FAQ (and now feeds the `FAQPage` JSON-LD).

### DEC-027-1 — `translation-platform`'s "judgment that mattered" + frontmatter reconciled to the real arc

the case's "The judgment that mattered" section was reworked (the operator's own account)
from the old "threw a number away / matched a free baseline, wound down cleanly" framing to the real arc —
he built a DeepL-correction pipeline (calibrated twice against a human gold standard, automated for
production), but general-purpose AI **leapfrogged** the whole approach (translating near-perfectly without
it) and the client called the hiatus before he did. The frontmatter `summary` (option **B** — now signals
the overtaken / paused reality), `outcome`, and `proof` were retold to match; `problem` left as-is.

### DEC-026-3 — The other five cases' frontmatter/SEO left as-is after a consistency audit

A Conv-026 audit compared each non-Urantia Work case (`this-site`, `redline`,
`translation-platform`, `learning-marketplace`, `personal-productivity-app`) against its `summary` — which
is both the `/work` card text and the SEO `description`/`og`/`twitter` — and its dark
`problem`/`outcome`/`proof` fields. Finding: **no material inconsistency**; every field faithfully reflects
its body. The operator ruled the remaining observations — summary phrasing drifts (redline "day" vs
"afternoon"; a `learning-marketplace` stray comma), the summary-doubles-as-meta-description length overruns
(137–309 chars vs ~155–160 typical SERP truncation), and the personal-vs-client heading-convention split —
are prose / inclusion choices, not inconsistencies, and left unchanged.

### DEC-026-2 — Named-client / spiritual-theme cases use a pipeline diagram, not a product screenshot

The two public Center-for-Unity cases (`discover-jesus`, `discover-the-ub`) take a line-art
pipeline SVG in the aside (`hideMockup: true` + `diagram: "<slug>"`), not a screenshot of the live site.

### DEC-026-1 — A case study presents only Fraser's actual contribution; others' content is attributed to them

The `discover-jesus` and `discover-the-ub` cases were reframed so the writing, editing,
reading-levels, images, and (DTUB) the entire AI-written corpus are attributed to the client's team/editor,
and Fraser's case text claims only the technical pipeline + the site build. Prior framing that implied he
shared in the writing or used AI *on the content* was dropped; where AI genuinely contributed (the site
builds) it is located precisely — DJ ≈95% of the web-app rebuild, DTUB the entire Astro site.

### DEC-025-2 — A record's audit is the AI's independent read, kept verbatim — the operator does not edit its findings

When a "The record" audit is refreshed, its findings — including unflattering ones (a
fabricated-transcript miss; a sibling case page that frames work ahead of its build) — are kept exactly as
the independent read produced them. The operator ruled **keep all three** of the sharpest debits on the
explicit ground that the audit is the AI's point of view, not his to adjust.

### DEC-025-1 — `currentAsOf` record-currency field, distinct from `reviewed`

Add a required `currentAsOf` ISO-date field to the `record` collection schema, stamped on
every record. It records when a record was last **assessed current** — a date that advances even when the
audit body is unchanged — as opposed to `reviewed`, which dates when the audit was **authored**. On
refreshing `this-site` both equal 2026-11-04; the four records whose projects are complete or on hiatus
(SPT, Peerloop, fps, redline) are stamped 2026-11-04 as "assessed and held current" with no content change.

### DEC-024-2 — Optional `segmentTable` caseExtras render type (segment→sections HTML table)

A new optional `segmentTable` field on the `caseExtras` schema — an ordered array of
`{ segment, sections[] }` — rendered by `CaseExtras` as an HTML table in the case aside, in place of a
diagram. Presence of the field is the switch, handled uniformly for every case; a case gives it the aside
slot by omitting `diagram` and setting `hideMockup: true`. `translation-platform` (SPT) is the first
adopter: a generalized, de-identified segment→sections view of its pipeline (7 segments / 40 sections),
replacing its flow diagram.

### DEC-024-1 — Claude Code is the sole editor of file content; the operator never edits files directly

Claude Code makes every change to file content. The operator never edits files directly;
instead the operator conveys changes in prose and Claude Code applies them. "Section by section" is a
collaborative cadence, not solo work: usually Claude presents a section and the operator corrects or
replaces it in words, but the operator may also hand Claude a section (e.g. a paste) to change without
Claude presenting it first. Either way, Claude makes the edit.

### DEC-023-3 — translation-platform: multi-language is intent only; the target language is not named

On the `translation-platform` case, the multi-language scope is presented as **design intent**,
not delivered scope — the "ten languages" claim is de-emphasised — and the single language it was actually
developed in is **not named** on the card.

### DEC-023-2 — Every Work case opens with a "Why it matters" section

Each `/work/<slug>` case study carries a dedicated **"Why it matters"** section as its first
`##` heading — 1–2 lines stating the project's motivation (the broader need it answers) — placed before "The
problem". "The problem" is correspondingly trimmed to the *difficulty* only, so motivation and difficulty no
longer share the opener.

### DEC-023-1 — Case narration: "I" for Fraser's own calls, "we" for client-shared decisions

In Work case-study narration, first-person **"I"** denotes Fraser's own decisions and actions;
first-person-plural **"we"** denotes decisions made jointly with the client. The operator works closely with
clients on strategy, so a mix of the two within one client case is intentional, not voice drift.

### DEC-022-5 — `::selection` uses the `--accent`/`--on-accent` pair, not `--accent-tint`

The global `::selection` rule sets `background-color: var(--accent)` + `color: var(--on-accent)`
instead of the old `background-color: var(--accent-tint)`.

### DEC-022-4 — Record section → "Fraser's Role — an AI's independent audit", written third-person

Every case's on-page record summary is retitled **"Fraser's Role — an AI's independent audit"**
(from "The record — an independent read") and rewritten in third person naming Fraser (past tense), matching
the already-third-person transcripts.

### DEC-022-3 — Click-to-enlarge lightbox for case mockups (native `<dialog>`)

Case mockups open to a full-size view via a native `<dialog>` lightbox, reusing RecordMethod's
delegated-inline-script pattern (bound once on `document`, dialog looked up at click time, ClientRouter-safe).

### DEC-022-2 — learning-marketplace mockup is an illustrative, de-identified system-map SVG

The learning-marketplace (Peerloop) case uses a generated, de-identified **system-map SVG** as
its sidebar mockup (sized 2:3 to fill the box), captioned "the moving pieces are real; the connections
between them are representative, not the client's exact architecture" (label also baked into the SVG). The
old mock `.case-figure` flow diagram was removed and its SVG deleted.

### DEC-022-1 — Mockup wiring by filename convention, not a caseExtras field

Case product mockups are wired by **filename convention** — a `src/mockups/<slug>.{png,svg}`
asset is globbed and rendered as a plain `<img>` cover-fit into the 2:3 `.case-mockup` box; a labelled
placeholder shows when no file exists. Caption text comes from an optional `caseExtras.mockupCaption`.

### DEC-021-4 — A/B labels required only for options-bearing asks; open-ended `👉👉👉` questions are fine

The A/B-options rule (`DEC-002-1`, extended `DEC-005-1`) is refined: labelled `A)`/`B)` options
are required only when a `👉👉👉` question **offers options** (a fork — in practice the word "or"); a purely
open-ended question carries the `👉👉👉` anchor alone and needs no labels. `check-ab-options.sh` now allows a
label-less block that contains no standalone "or", and blocks only an options-bearing block that lacks
labels. CLAUDE.md's `👉👉👉` bullet reworded to match.

### DEC-021-3 — `paused` added to the case-status enum; translation-platform relabelled + card reworded

The `caseExtras.status` enum (set in Conv 019) gains a fourth value, `paused`. The
`translation-platform` case moves from `experimental` to `paused`, its over-long two-sentence card summary
is cut to one sentence, and the summary now opens with "Exploratory." (renders as a lead on the Work card).

### DEC-021-2 — A shared "Why this is checkable" framing line + modal above every audited record

Every audited `/work` case renders, above its "The record" CTA, a shared one-line frame —
"An independent read like this is only possible because the project is built to be examined." — with a
"Why this is checkable" link that opens a modal explaining the method that makes the audit possible: a
separate docs repo, numbered decisions (the wrong ones kept, not erased), turn-by-turn capture the AI
learns from so a documented mistake isn't repeated, and full client access to every repo. Single-sourced
in a new `RecordMethod.astro`, rendered by `work/[slug].astro` only where a `record` exists (never on the
live-link-only Urantia cases). The modal is a native `<dialog>` driven by a view-transition-safe delegated
inline script — no hydrated island.

### DEC-021-1 — The four pre-existing "The record" transcripts accepted as genuine; no re-run

The four Conv-014 "The record" transcripts (`redline`, `this-site`, `translation-platform`,
`learning-marketplace`) are accepted as genuine independent-subagent captures and left as-is — no re-audit,
no re-label. Resolves the open question `DEC-020-4` carried to this `/r-start`.

### DEC-020-4 — "The record" transcripts must be genuine independent audits (redacted), not model-composed

A case's "The record" transcript must be the verbatim output of a genuine independent read — a
fresh AI agent, given no prior conclusions, pointed at the project's own documentation — not authoring-model
prose dressed in transcript framing. For fps the read is `fps-docs` only, never `fps-sensitive`. The output
is redacted per `DEC-014-2` (typed `{braces}` + in-body legend) and may be followed by a clearly-separated
author's-response section, with the audit above left unedited.

### DEC-020-3 — Public-site copy states the confidentiality hardening present-tense and vague, though planned-not-built

The fps case states name-obfuscation and secret-encryption as present capabilities, worded
vaguely ("identifying names obfuscated, secrets kept encrypted"), with no mechanism named. fps's committed
design is egress-only **isolation** (plaintext-at-rest; `fps-docs/07 §1`); obfuscation/encryption is
planned-not-built.

### DEC-020-2 — Per-case `hideMockup` opt-out for the case-study sidebar mockup box

`caseExtras` gains an optional `hideMockup` boolean; `/work/[slug]` renders the sidebar
mockup-placeholder box only when it is unset. The fps case sets `hideMockup:true` — its diagram fills the
sidebar slot.

### DEC-020-1 — [CASE-FPS] built: the fps case, whole-system scope, generically named, with a diagram + "The record"

The `personal-productivity-app` case is built real (replacing the Conv 019 mock): scope = the
whole FPS system (two-vault corpus + local-LLM confidentiality + CLI/MCP + desktop app), not the app alone;
kept generically named ("Secure personal productivity app", slug unchanged); type `desktop application` /
status `ongoing`; a new two-tier-egress diagram; real `tools`/`benefit`; `mock:false`; and a "The record"
independent-audit block.

### DEC-019-4 — Retire the per-case motif; cards + case pages share one type→icon map

The Conv 012 per-case "motif" icon is retired. `/work` cards **and** `/work/<slug>` case-page
headers both derive their glyph from the project `type` via one shared map (`src/lib/type-icon.ts`):
website→globe, web application→blocks, server application→box, browser extension→pin, desktop application→
monitor. The now-dead `caseExtras.icon` field is removed from the schema, every `case-extras.json` entry,
and the data README.

### DEC-019-3 — Case-study pages: two-column layout with a portrait mockup sidebar

`/work/<slug>` pages become a two-column grid at `lg`: a prose main column + a **sticky** right
sidebar (`top:5rem`, clears the header) holding, top-to-bottom, a **~2:3 portrait mockup** then the benefit /
diagram / tools (moved out of the flow above the prose). Each case gets a per-case mockup **placeholder** box
(labeled with the title) until real ~2:3 screenshots land; the Client badge is mirrored under the h1.

### DEC-019-2 — /work cards surface project type, status, and client

Each `/work` card header shows the project **type** (type-driven icon + uppercase eyebrow
label) on the left and **status** (uppercase eyebrow) right-aligned; client-owned cases also carry a tinted
**"Client" pill** (left cluster, mirrored under the case-page h1). `type` (website / web application /
server application / browser extension / desktop application) and `status` (ongoing / deployed /
experimental) are **required** `caseExtras` enums; the client marker is driven by the existing `work.client`
field and shows a **generic "Client"** — never the client's name (masking).

### DEC-019-1 — Project/testimonial data keeps the markdown-prose / JSON-structured split; no unified JSON

Per-case and testimonial data keeps its current **two-store** shape: long-form prose (the
`/work/<slug>` case bodies, and the reserved blog) stays in markdown content collections; structured
attributes (per-case `type`/`icon`/`tools`/`benefit`/`diagram`, and testimonials) stay in zod-schema'd
JSON (`src/data/case-extras.json`, `src/data/testimonials.json`). We do **not** build a unified per-case
JSON record, and do not migrate the card fields (`title`/`summary`) out of markdown. The two-file authoring
rule holds: **card text = `src/content/work/<slug>.md`; structured attributes = `src/data/case-extras.json`.**

### DEC-018-3 — Home surfaces the two AI testimonials in a "Recent testimonials" band, shared + masked

The home page gains a "Recent testimonials" band rendering the two AI-era testimonials, read
from `src/data/testimonials.json` (the same source the `/testimonials` page uses, not a copy), SAMPLE-badged
via the existing `mock` flag, with a secondary "See all testimonials" button → `/testimonials`. Attributions
stay the masked role descriptors for now.

### DEC-018-2 — "Find your phase" framing: everyone starts at phase one; progression is not guaranteed

The "Find your phase" band's prose is reworded from "Most people… pass through the same three
phases" to "Everyone starts at phase one. Getting beyond it is the hard part, and far from guaranteed."

### DEC-018-1 — "Judgment in practice" re-led as a question with conceptual "It happens in…" cards

The home "Judgment in practice" band is reframed: a question lead-in ("Where does my judgment
come in?") + intro sentence, and the three concrete anecdote cards (passing-tests fault / honest-when-not-
working / measured bake-off) are replaced with three conceptual cards — "It happens in choosing between AI's
options / judging whether the tests are enough / knowing when AI lacks the context to choose" — all using one
new `scales` balance icon. Card titles are `h3` under the new section `h2`.

### DEC-017-4 — Home-only tighter, uniform section rhythm via scoped modifiers

Home section spacing is unified with two modifier classes — `.section.section-tight` and
`.band.band-tight`, both `padding-block: 2.5rem` — applied to all five home blocks, replacing the prior
band→section `pt-0` pattern. Scoped to the home page only; every other page keeps the global
`--section-rhythm` (`clamp(4rem, 8vw, 8rem)`).

### DEC-017-3 — Home experience figure reads "over 40 years"; true 44 kept in `llms.txt`; other pages deferred

On the home page the "44 years" figure (hero sub-headline + "meet Fraser" teaser) is
replaced with the static phrase "over 40 years", and the now-unused `yearsExperience` import is dropped
from `index.astro`. The exact computed figure (`yearsExperience()`, =44) is deliberately **kept** in
`llms.txt.ts`; the remaining consumers (`about.astro` + its "1982" anchor, `faq.astro`) are left on the
computed 44 — the "44 vs over-40" call is deferred per-page.

### DEC-017-2 — Em-dash footnote owns the AI "tell"; marker is a pseudo-element anchor to an inner id

A site-wide footer `<details>` note ("On the em dashes…") reframes the em-dash "AI tell"
as the tool-vs-work thesis — collapsed to one teaser line + a `more…`/`less…` disclosure (no JS). The
home h1's first em dash carries a small circled "1" marker linking to it. The digit is a CSS `::before`
(presentational) so it stays **out of the h1's indexed/DOM text** (clean for SEO); the link's accessible
name is an `aria-label`. The anchor's `href` targets an id on an element **inside** the `<details>` (not
the `<details>` itself) so fragment navigation auto-opens the note (ancestor-reveal).

### DEC-017-1 — Home hero reworked: new positioning h1 + supporting deck + two-paragraph narrative

The home above-the-fold h1 becomes **"Custom software, designed with you — kept on course
by me."** (replacing `DEC-010-3`'s "Software development — built with AI, kept on course."). A supporting
deck follows (designed with you / AI builds for speed / I correct for quality — "Serious software, made
with you rather than handed over"), then a two-paragraph narrative (the shift + AI's capability; the
catch at scale) with a new **"Where I come in"** `<h2>` over the "my role" material. The "Let … years"
differentiator line stays beside the headshot (now "over 40 years", `DEC-017-3`).

### DEC-016-2 — Career length is computed at call time, not at module load (Workers Date-at-global-scope)

`src/consts.ts` exposes `yearsExperience()` (a function) instead of the former
`YEARS_EXPERIENCE` module const. Every consumer (`index`, `about`, `faq`, `llms.txt`) calls it at
render/request time. `CAREER_START_YEAR = 1982` stays a const.

### DEC-016-1 — AI-crawler policy: welcome answer/search crawlers, decline training-only crawlers

The production `robots.txt` endpoint (`[SITE-AI-SEO]`) adds explicit AI-crawler stanzas:
**allow** the generative-engine *answer/search* crawlers that drive discoverability — OAI-SearchBot,
ChatGPT-User, PerplexityBot, Perplexity-User, Claude-SearchBot, Claude-User, Google-Extended — and
**disallow** the *training-only* crawlers GPTBot, CCBot, ClaudeBot. Staging is unchanged (`Disallow: /`
for everyone, `DEC-015-1`). The roster lives in `src/pages/robots.txt.ts` and is easy to tune.

### DEC-015-1 — Staging builds are held out of search indexes, keyed on build MODE

Staging builds are blocked from indexing two ways: the `robots.txt` endpoint emits
`User-agent: * / Disallow: /`, and every page carries `<meta name="robots" content="noindex, nofollow">`.
Both are gated on `import.meta.env.MODE === "staging"` — the mode `astro build --mode staging` sets (the
`deploy:staging` script) — with production builds unchanged (allow-all robots, no robots meta). To make
the robots policy differ per build, the static `public/robots.txt` was converted to a prerendered endpoint
`src/pages/robots.txt.ts`.

### DEC-014-2 — Client "The record" transcripts: light typed-token redaction, not heavy rewriting

The two **client** "The record" transcripts (translation-platform, learning-marketplace) are
**light-token-redacted**: only true identifiers are replaced with typed `{braces}` placeholders carrying an
in-body legend — client/org, product, source-text identity, people, target languages — while counts, dates,
decision IDs, and the concrete steering moments and misses stay **verbatim**. Common third-party products
(DeepL, COMET, BigBlueButton, PlugNmeet, GetStream, Stripe, Cloudflare) and the owner's own harness (PLATO)
are named as themselves. The client summaries + transcripts are gated on **client sign-off before the
production deploy** (`DEC-009-2`); dev/staging is fine.

### DEC-014-1 — "The record" overhauled into genuine re-audits rendered as full, linkable transcripts

Each audited Work case (redline, this-site, translation-platform, learning-marketplace) is
re-audited by a **fresh independent subagent** reading that project's own repo (the `DEC-009-4` three-axis
method carried forward), the full question-plus-answer **transcript** is stored in a new `record` content
collection and rendered **read-only at `/work/<slug>/record`**, reached by a button below the case summary;
the public summary is re-derived from that real audit. The transcript is **viewable in-page, never
downloaded**. The two named/public Urantia cases — whose repos **predate Claude Code**, so there is no
decision-log to audit — take a **"Visit the live site"** button in the same slot instead.

### DEC-013-5 — Work cases: named + public (live-URL proof) alongside de-identified (record-block proof)

The two Urantia sites (DiscoverJesus.com, DiscoverTheUB.com, for The Center for Unity) are
published as **named, public** Work cases whose proof is the **live URL**, kept as **two** separate cases
(meaningfully different stacks), with **no "The record — an independent read" block**. They sit alongside the
de-identified client cases, whose proof is the NDA-safe "The record" audit.

### DEC-013-4 — Career length is computed from 1982, never hardcoded

"Years of experience" is computed site-wide as `currentYear − 1982` (`src/consts.ts` →
`YEARS_EXPERIENCE`), not a hardcoded number. 1982 (the software-business start) is the load-bearing anchor.

### DEC-013-3 — `fg` is the authoritative legacy reference; `frasergorrie` superseded

`~/projects/fg` (the current live frasergorrie.com source, Astro 5) is the authoritative legacy
reference; the `frasergorrie` repo (Next.js, frozen `2023-01-21`) is superseded, kept only for deep history.
Both are read-only (never committed/pushed). `fg` added as a working dir (`fgw` launch + guard roots + the
VS Code workspace).

### DEC-013-2 — The site is dev-only: no coaching, no pricing surfaces

fgw-26 presents **software development only** — no AI-coaching offering and no pricing /
hourly-block / "buy hours" surfaces (coaching may happen off-site; it is not promoted on the site).

### DEC-013-1 — Two-tier IA: top-nav = decide-to-look, footer links = explore-mode depth

Split navigation into two tiers by visitor intent. The **top nav** (Home, Work, Method, About,
Contact) is the "should I look further?" surface — lean, hook-and-differentiate, for a cold visitor deciding
whether FG is worth their time. **Footer links** are the "explore mode" surface — depth and reassurance for a
warmer, already-interested visitor: **Testimonials, FAQ, and a standalone History page** live here, not in the
top nav. Pages are also cross-linked as appropriate, so footer material is reachable by more paths than the
footer alone.

### DEC-012-4 — the site header uses the elevated `--surface` tone

Change `.site-header` background from `--paper` to `--surface` (the elevated tone the footer
already uses) so the sticky header reads as a subtle step above the body in both themes.

### DEC-012-3 — file-based secret-vs-config convention (`VARS_SECRETS.md`)

Adopt a documented, file-based convention: non-secret config as `vars` in `wrangler.jsonc`
(committed, commented); secret *names* declared in `secrets.required` (per env); secret *values* in
gitignored `.dev.vars[.<env>]` deployed via `wrangler deploy --secrets-file`. For the contact form,
`EMAIL_FROM` is a var; `RESEND_API_KEY` + `EMAIL_TO` are secrets. Captured as a portable playbook,
`VARS_SECRETS.md`.

### DEC-012-2 — contact form via a Worker → Resend route (supersedes `DEC-004-2`'s mailto-only surface)

Replace the Contact page's `mailto` with a real form posting to a Cloudflare Worker route
(`src/pages/api/contact.ts`) that emails via Resend; honeypot spam trap; progressive-enhancement fetch
with a no-JS mailto fallback.

### DEC-012-1 — `/work` case extras as a JSON data collection, separate from the prose

Enrich each `/work` case with a vertical line-art **diagram** (SVG), a **tools** list, a
**benefit** line, and an index-card **motif**, driven by a JSON data collection (`src/data/case-extras.json`
+ a zod-schema'd `caseExtras` collection) kept separate from the markdown prose.

### DEC-011-3 — nvm `default` alias set to 24.22.1 (global) over a project-scoped direnv

Fix the recurring "wrong Node" friction by setting the machine's nvm `default` alias to
**24.22.1** (`nvm alias default 24.22.1`). Root cause: the alias was `22.19.0`, below the project floor
(Astro ≥22.23.4, `.nvmrc` 24.22.1), so every new shell nvm-activated a below-floor Node and
`npm run verify` died in `astro check` until a manual `nvm use`.

### DEC-011-2 — the site header is sticky

Make `.site-header` sticky site-wide (`position: sticky; top: 0; z-index: 50`, opaque
`--paper` background, existing bottom border) so the nav stays reachable as a visitor scrolls any page.

### DEC-011-1 — a `/phases` self-qualification page (three phases), with on-ramps and a dual nature

Add a new **Phases** page (`/phases`) walking the three phases of building software with AI
— **straw man → tin man → steel man** — so a prospect can place themselves and judge the fit. Reached
via a **"Phases"** nav item (after Method) and a **Home banner** ("Where are you in building with AI?").
The phases are **dual-natured**: they describe FG's build discipline *and* map the reader's own journey
(stated in the lede, demonstrated in the close). Each phase carries a "Where I come in" help callout.

### DEC-010-3 — Home hero leads with the business identity + a 44-year differentiator

Restructure the Home above-the-fold so the top headline states the **business** —
"Software development — built with AI, kept on course." The method sentence ("I plan, then steer — AI
drives development, and I course-correct where it's needed") is demoted and then replaced by a **44-year
client-experience differentiator** line ("Let 44 years of building software for clients guide your own
project"), with a small headshot beside it; the method is carried visually by the hero **flow sequence**
(Plan → Steer → AI drives → Course-correct). A "meet Fraser" teaser band (headshot + About link) was
also added lower on Home.

### DEC-010-2 — Voice gains a humility rule: seasoned, not above the reader or the field

Add a **Humility** section to `reference/VOICE.md` (extends `DEC-009-5`): avoid the
"I know…" / "I catch what others miss" / "…before you do" / "what a cheaper X can't do" framing — write
from "I'm good at this, I'm seasoned, here's how I can help you." Reframe the existing copy site-wide to
match (main pages, the four Work cases, the footer).

### DEC-010-1 — Visual direction A (warm-editorial) shipped; ember-as-text uses `--accent-strong` for AA

From three mocked directions, implement **A — warm-editorial**: deepen the light palette
so the warmth reads to the eye (paper `#faf7f2`→`#f2e8d7`, surface/line/accent-tint likewise); bring the
ember in as a disciplined accent (eyebrows + lead-rule, card icon chips, Work arrows, back-link, icons).
**Ember used as text moves to `--accent-strong`; ember as fill stays `--accent`.**

### DEC-009-5 — One documented site voice: Fraser to a client in a first meeting, lightly-warmed and candid

Every page adheres to a single voice/tone, documented in `reference/VOICE.md`: first person
as if Fraser is speaking to a prospective client in a first meeting; the **lightly-warmed** register
(contractions, plain verbs, measured but human); **candid** to the point of naming what went wrong (the
`this-site` "The record" block is the exemplar). No marketing superlatives/hype/AI-default cadence; no
engineer-speak at a business-owner reader.

### DEC-009-4 — "The record": an independent, evidence-cited assessment of Fraser's steering on each Work project

Each Work case carries a **"The record"** block — an independent read of that project's own
docs repo answering, with citations a reader could check: how big the project was (**convs first**), where
Fraser steered or overruled the AI (**including where he did NOT steer well**), and how well he planned.
Produced by a **fresh subagent per repo** (independent; keeps the big read out of the main context). Full
candor — documented misses stay. Client-project assessments are de-identified like the cases.

### DEC-009-3 — Critical path gains Phase 3 (findable & fast); go-live becomes Phase 4

The critical path adds **Phase 3 — Findable & fast**: `[SITE-SEO]` (site URL, sitemap,
robots.txt, canonical, og:image, `schema.org` JSON-LD), `[SITE-AI-SEO]` (llms.txt, structured facts,
AI-crawler policy), `[SITE-PERF]` (Lighthouse/CWV + budget, image optimization) — plus `[SITE-VISUAL]` as
pre-go-live polish. `[SITE-GO-LIVE]` (production + domain) becomes **Phase 4**.

### DEC-009-2 — Client-case publishability: sign-off gates production only; de-identification guards dev/staging

The two de-identified client Work cases ship to **dev and staging freely**; **client
sign-off is required only before the production deploy** to frasergorrie.com (`[SITE-GO-LIVE]`).
De-identification (no client/org/product/source-text identity, verified by scan — including HTML comments
and the independent reads) is the guard that makes dev/staging safe; sign-off is the guard for production.

### DEC-009-1 — Site IA unchanged; the three "services" fold into a "What I do" block, no Services page

The built 5-page IA (Home, Work + `/work/<slug>`, Method, About, Contact) stands; the three
candidate services (prototype→production, architecture & refactoring, fractional mentorship) appear as a
light **"What I do"** block on Home rather than a dedicated Services page/route. Also settled: Home `h1`
kept ("I steer; AI drives…"); the 3 Home proof cards = catch-what-checks-miss / tell-you-when-it-isn't-
working / measure-not-guess.

### DEC-008-2 — A footgun/caveat noted in prose is a routing trigger: highlight + hopper

Any footgun, warning, caveat, or special condition CC notes in prose is treated not as a
remark but as a routing trigger: CC **(1)** highlights it in a dedicated line at the end of the turn and
**(2)** adds it to `HOPPER.md` as a `- [ ]` line. A caveat already mitigated within the same turn is
stated as resolved rather than hoppered; a live one is hoppered. Recorded as a rule line under CLAUDE.md
*Surfacing & guards*.

### DEC-008-1 — Select the Cloudflare deploy env at build time via `CLOUDFLARE_ENV`, guarded by a resolved-name assertion

The staging/production split is driven by **`CLOUDFLARE_ENV` at build time**, not by
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

### DEC-007-2 — Deploy to brand-stable `fgw` worker names, decoupled from the yearly repo

The Cloudflare Worker names are the stable brand `fgw`, independent of the per-year repo
name. Production worker = **`fgw`**; staging worker = **`fgw-staging`** (a `wrangler.jsonc` `env.staging`
block). The repo `fgw-26` — and future `fgw-27`, … — is a yearly rebuild that deploys *into* these same
two workers: a new year points a new repo at the existing names rather than minting `fgw-27`-named
infrastructure. The staging URL is therefore `fgw-staging.<account>.workers.dev` (`*.workers.dev` —
option A of the `[SITE-DEPLOY-STAGING]` staging-URL ruling).

### DEC-007-1 — Adopt the fps `CURRENT-TASKS.md` format; all sections stay in one file

Restructure fgw's `CURRENT-TASKS.md` to the `fps-docs` board format: a header stating it
is the durable state + the `[CODE]`-mnemonic rule; a `## 🔥 Ordered — index` (⚡ = do-next one-liners
pointing to the bodies below); a `## 🎯 Critical path` sequence-and-pointers section; the full
`## 🔥 Ordered` task bodies (a substantial row leads with a plain-language `#### Status — Conv NNN`
block, dense detail below it); then `## 📋 Unordered`, `## ⏸️ Parked`, `## ✅ Completed this conv`.
**Deviation from fps:** fps splits its backlog across three files (Unordered → `UNORDERED-TASKS.md`,
doc-debt → `DOC-TASKS.md`); fgw keeps **every** section — including `📋 Unordered` — in the single
`CURRENT-TASKS.md` (`DEC-000-4`).

### DEC-006-4 — Node 24 LTS as the project runtime, enforced by `engines.node >=24`

Baseline **Node 24 LTS** (`.nvmrc` = `24.22.1`), with `engines.node` raised to
`>=24.0.0` so the `predev`/`prebuild` guard (`scripts/check-node.mjs`) and `engine-strict` **refuse
anything older**. Supersedes an interim 22.23.4 pick made earlier this conv (the minimal bump to clear
Astro 7's floor; never recorded as a standing decision).

### DEC-006-3 — Resolve the `undici` dev-toolchain advisories with a scoped override, not `--force`

Add `overrides: { miniflare: { undici: "7.30.1" } }` to lift miniflare's transitive
`undici` (7.29.1, flagged) to the patched **7.30.1**, clearing all three advisories (their ranges are
`<7.30.1`).

### DEC-006-2 — Pin ESLint 9 / eslint-plugin-astro ^1 / TypeScript 6; latest elsewhere

Pin **ESLint 9** (`@eslint/js` 9 to match) and **`eslint-plugin-astro` `^1`**, and accept
**TypeScript 6.x** — all one major behind latest (ESLint 10, astro-plugin 3, TS 7). Every other package
is on latest.

### DEC-006-1 — fgw-26 scaffold architecture: static output, `light-dark()` theming, Fontsource fonts

Scaffold fgw-26 as Astro **`output: 'static'` + `@astrojs/cloudflare` adapter** (per-route
SSR available later via `export const prerender = false`). Light/dark via CSS **`light-dark()`** driven
by `color-scheme`, with `[data-theme]` on `<html>` overriding for the optional toggle (a no-flash inline
script persists the choice). The `DEC-004-7` component styles live as **semantic classes in one
`global.css` `@layer components`** (the single durable source). Fonts **self-hosted via Fontsource
variable** packages (Fraunces, Inter); **no mono webfont** (system mono stack for inline code).

### DEC-005-1 — The 👉👉👉 trigger covers every answer-expecting question, incl. the end-of-turn "what next?"

Extend the 👉👉👉 rule (`DEC-002-1`) in `CLAUDE.md` §Interaction model: the anchor is
required on *every question expecting an answer — ruling, pick, or aside alike, never a rhetorical one*,
not only on questions I classify as decisions. The A/B rule and the `check-ab-options.sh` Stop hook are
left unchanged.

### DEC-004-7 — `[STYLE-THEME]` component styles (buttons, inputs, cards, prose, nav/footer)

Component layer of the style guide, all driven by the `DEC-004-6` tokens + the new tokens
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

### DEC-004-6 — `[STYLE-THEME]` concrete token values (fonts, palette, scale)

Finalise the stand-ins from `DEC-004-5` into concrete tokens (all chosen from in-browser
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

### DEC-004-5 — Visual direction: "quiet authority / editorial craft"

fgw-26's visual personality is **direction A — quiet authority / editorial craft**:
- **Editorial serif headings** + **clean humanist sans body** (Fraunces / Inter shown as stand-ins).
- **Warm neutral palette** — off-white "paper" ground + near-black ink + **one disciplined accent**, an
  ember/ochre that **evolves the legacy amber** (`#ffae1a`) rather than discarding it (continuity +
  seniority).
- Generous type scale, roomy spacing, legibility-as-aesthetic (mirrors the honesty frame).
- **Light and dark both first-class**, via Tailwind v4 CSS-variable tokens (`DEC-004-3`).
- Exact font families, colour ramp, type scale and spacing are **not yet fixed** — the fonts/hexes in
  the Conv 004 mockup (`.scratch/style-directions.html`) are illustrative stand-ins; finalising them is
  the next `[STYLE-THEME]` step.

### DEC-004-4 — Claude runs `/r-commit` autonomously on its own judgment

Claude may run `/r-commit` **without asking**, on its own judgment, whenever meaningful
and relatively self-contained work has been completed. (`/r-commit` was already a standing right in
`CLAUDE.md`; this grants autonomous *timing* — no per-commit approval.) `/r-end` still needs explicit
approval and remains the only operation that pushes.

### DEC-004-3 — Do not adopt shadcn/ui; Tailwind v4 CSS-first theming instead

Resolve `DEC-000-1`'s open "shadcn under consideration" clause **against adoption**. The
token/theming layer is **Tailwind v4 CSS-first `@theme`** (CSS-variable tokens) directly. The few
interactive pieces (mobile nav; optional theme toggle, image lightbox, contact form) are built as
**CSS-only or tiny vanilla/React islands**. shadcn is deferred to a **per-component, island-scoped
trigger**: pull in a *single* shadcn component only if/when a genuinely complex interactive component
appears, and then only that one.

### DEC-004-2 — fgw-26 launch information architecture (page set + scope)

The launch site is these routes (multi-page, per `DEC-004-1` as amended below):
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

### DEC-004-1 — Site structure: multi-page primary + reserved `/spa` long-scroll view

fgw-26 is a **multi-page site** as its primary structure — real Astro routes
(`/`, plus topic pages), with View Transitions (`<ClientRouter>`) for SPA-smooth navigation where it
helps. Build each content block as a **single-sourced Astro section component**, so routes compose
subsets of a shared component library. **Reserve a `/spa` route** that assembles all sections into one
long-scroll page — a *secondary view of the same source*, not a separate build. `/spa` earns its keep
only if a real job emerges (read-it-all-on-one-page / print-friendly / single-link-to-share); if none
does it can be dropped with zero content loss, and if single-page later wins outright its content is
promoted to `/`.

### DEC-003-2 — fgw-26 testing strategy (all layers)

Adopt one testing strategy across layers, most infra standing up at `[SITE-SCAFFOLD]`:
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

### DEC-003-1 — Defer PLATO for fgw-26; document the adoption playbook

Do not build a PLATO-style journey runner for fgw-26 now. Start browser/UI testing with
Vitest + React Testing Library on jsdom for components, and the `/chrome` bridge used ad hoc for visual
checks. Capture the full "what PLATO is / when to adopt / how to adopt" playbook in `_cc/PLATO.md` so
the deferral is revisitable. Browser testing still models on Peerloop's quadrant division of labour
(unit/API → PLATO → bridge-scripted UI walk → sparse Playwright) — only the PLATO layer is deferred.

### DEC-002-1 — A/B Stop guard: read `last_assistant_message`, assess only the ask block

`check-ab-options.sh` no longer parses the transcript. It reads the turn text from the
`last_assistant_message` field CC passes to the Stop hook, isolates the **ask** — everything after the
*last* `👉👉👉` anchor (`${text##*"$anchor"}`) — and requires both an `A)` and a `B)` label within that
block. A durable 15-case test suite (`.claude/hooks/check-ab-options.test.sh`) covers the behaviour.
DEC-001-1's decision (enforce A/B via a Stop hook) still stands; only the mechanism changes — this is
not a supersession.

### DEC-001-2 — Capture the operator's turns verbatim via a UserPromptSubmit hook

A `UserPromptSubmit` hook (`.claude/hooks/capture-turn.sh`) appends each operator prompt
verbatim as one JSON line to the untracked `.conv-turns.jsonl`; `/r-end` renders those into a per-conv
dialogue companion (`docs/convs/.../Conv NNN — dialogue.md`, specced in `reference/CONV-FORMAT.md`) and
deletes the `.jsonl`. The hook gates on `.conv-current`, writes only to files (never stdout — a
UserPromptSubmit hook's stdout enters context), and fails open.

### DEC-001-1 — Enforce the A/B question format with a Stop hook, not willpower

A project Stop hook (`.claude/hooks/check-ab-options.sh`, registered in
`.claude/settings.json`) inspects the last assistant turn; if it ends with a `👉👉👉` question but
presents no labelled `A)`/`B)` options, it blocks the stop (exit 2) and feeds the lapse back to be
re-asked. The `👉👉👉` anchor (CLAUDE.md "Interaction model") is the detection handle. Permission asks
count — every `👉👉👉` question must offer labelled options. The hook fails open and has a
`stop_hook_active` loop guard (at most one forced correction).

### DEC-000-7 — Keep the process lean by policy

The conv/documentation methodology is kept deliberately lean. Prune `CLAUDE.md` past
~120 lines; treat the documentation apparatus as a cost; verify in the running product, not just in
tests; a green check is not proof.

### DEC-000-6 — Site thesis: judgment over commoditized code

The new frasergorrie.com positions Fraser as the "route planner and helmsman" whose
44 years of judgment steer AI-driven development — understanding client needs and knowing when a
solution will actually work. It retires the legacy site's "NoCode-First for everything" framing and
updates "40 years" to 44.

### DEC-000-5 — Full decisions + learnings + generated digest from day one

`DECISIONS.md` (numbered, tombstoned), per-conv learnings records (`docs/convs/`), and
the generated `DECISIONS-DIGEST.md` are all set up from the start — not deferred until the record is
large.

### DEC-000-4 — Single-file task board to start

The board is one file, `CURRENT-TASKS.md`, with sections 🔥 Ordered / 📋 Unordered /
⏸️ Parked / ✅ Completed this conv.

### DEC-000-3 — Conv lifecycle adapted from fps (most current)

The session methodology is adapted from **fps**, the most current of the sibling
lifecycles: skills `r-start` / `r-commit` / `r-end` / `r-hopper`, plus `conv-state.sh` and
`gen-decisions-digest.sh`. Skill names kept as-is.

### DEC-000-2 — Dual-repo control

`fgw-26-docs` is the project home and governs the website code repo `fgw-26`; the
lifecycle commits and pushes both. `frasergorrie` (the legacy site) is read-only reference and is
never committed or pushed by the lifecycle.

### DEC-000-1 — Tech stack: Astro + Cloudflare Workers + Tailwind v4 (latest)

The website is built on Astro (SSR, Cloudflare adapter) deployed to **Cloudflare
Workers**, with **Tailwind v4** (CSS-first, via `@tailwindcss/vite`), on latest package versions.
**shadcn/ui** is under consideration for styling consistency (React islands + Tailwind + CSS-variable
theming). TypeScript throughout; Vitest; ESLint + Prettier; wrangler exact-pinned.

