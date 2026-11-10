# Decisions — fgw

Every decision (design and process alike), numbered `DEC-NNN-N`, **newest-first**. Each: `Decision:` /
`Rationale:` (name the alternative that lost) / `Consequences:`. 🔴 IDs are never reused or renumbered;
a superseded decision is **tombstoned, never deleted** (`### DEC-NNN-N — ⛔ superseded by \`DEC-MMM-M\``
and nothing else), so every handle ever issued resolves. Scan `DECISIONS-DIGEST.md` for precedent, then
open the cited entry here. Full format: `reference/CONV-FORMAT.md`.

---

## Conv 039

### DEC-039-1 — Content home built dark; one `CONTENT_HOME_LIVE` flip switch
**Decision:** Build the `[SITE-CONTENT-HOME]` guides + writing surface in `fgw-26` but keep it **dark**
until the first cornerstone guide (and first article) are finalised and approved. One boolean
`CONTENT_HOME_LIVE` (consts.ts) drives `noindex`, sitemap exclusion, and (DEC-039-4) nav/footer
visibility; `[slug]` routes stay draft-filtered so a prod/staging build generates only approved pieces
(drafts still preview in `astro dev`). Per-piece JSON-LD (`CreativeWork`) is deferred to
`[SITE-STRUCTURED-DATA]`, with a clean `slot="head"` hook left on the detail pages.
**Rationale:** The guides are the GEO/credibility acquisition asset; a thin or "coming soon" cornerstone
indexed by Google or lifted by an AI assistant is worse than no page. Build the durable machinery now,
flip when there is real substance. Rejected: shipping the hub live with placeholder/seed content (undercuts
the purpose); folding JSON-LD in now (would half-do structured data twice, out of sync with the
Person/Organization `@graph` that `[SITE-STRUCTURED-DATA]` owns).
**Consequences:** dark scaffold built Conv 039; flip = set `CONTENT_HOME_LIVE = true` + deploy (a hopper
item, carried to next conv). Content authored separately (CC drafts → operator approves). Backstopped by
DEC-039-2.

### DEC-039-2 — Production deploys banned until the content home is finalised (fail-closed)
**Decision:** No **production** deploy until the first article + all three guide pages are finalised.
Enforced technically: `scripts/assert-prod-deploy-allowed.mjs` runs first in the `deploy` script and exits
non-zero while `PROD_DEPLOY_BANNED` is true; `deploy:staging` does **not** call it (staging deploys as
usual).
**Rationale:** Content work spans several convs with the live site's copy in flux; a routine `npm run
deploy` would ship half-finalised guides to production. A fail-closed guard (matching the existing
`assert-worker.mjs` pattern) is more reliable than a prose promise. Rejected: a prose-only rule
(forgettable); banning staging too (needlessly blocks preview deploys).
**Consequences:** `[PROD-DEPLOY-BAN]` board row; general-site fixes made this conv (sticky footer, footer
copy) also wait for the flip. Lift = set `PROD_DEPLOY_BANNED = false`.

### DEC-039-3 — Content-home IA: "Guides" + "Writing", single-purpose pages, `/blog/` → `/writing/`
**Decision:** The content home is two single-purpose sections bound by cross-links, not a mixed index:
**`/guides/`** (label "Guides") holds the undated cornerstones; **`/writing/`** (label "Writing") holds the
dated articles, renamed from `/blog/`. One nav entry, "Guides" → `/guides/` (which leads with the
cornerstones + a "Latest writing" teaser); "Writing" is reached from the guides hub, each guide's related
list, and a footer link. Each article up-links to its pillar guide; each guide lists related articles.
**Rationale:** A page's URL and label should match its content; the earlier mixed `/guides/` hub
(cornerstones + stream) left no single honest label fitting it, which drove the naming churn. "Writing"
suits the quiet editorial voice and sidesteps the now-dated "Blog" label; "guides" in the URL honestly
types the cornerstones. Guides are the acquisition asset so they take the one nav slot; articles support
(per the funnel), so they are one click away, not top-level. Rejected: a single mixed hub (label mismatch);
two top-level nav entries (nav bloat); keeping `/blog/` (retires the "Blog" label — a pre-publish rename is
free).
**Consequences:** `/blog/` retired → old-site `/blog` disposition is `[BLOG-REDIRECT]`; the content
collection stays named `blog` internally (invisible). Refines the content-home shape from DEC-038-3.

### DEC-039-4 — Content-home nav/footer links gated `CONTENT_HOME_LIVE || DEV`, committed
**Decision:** The nav + footer content-home links render only when `CONTENT_HOME_LIVE ||
import.meta.env.DEV` — shown in `astro dev` and once the flag flips, hidden in prod/staging builds while
dark — so they are **committed as ordinary code** rather than kept as uncommitted working-tree
"dev-preview" edits reverted each conv.
**Rationale:** The working-tree-only approach leaned on remembering never to stage two files and reverting
them before `/r-end` (a footgun). A flag gate — the same switch the pages, sitemap, and `noindex` use —
lets the links be committed, stay dark in prod, preview in dev, and flip in one line. Rejected: the
uncommitted dev-preview juggling (fragile; the earlier approach).
**Consequences:** flip-live is now solely `CONTENT_HOME_LIVE = true`; the Nav/Footer "reverse before
/r-end" hopper item was retired. Backstopped by DEC-039-2.

### DEC-039-5 — Nav trimmed: drop "Home", keep Phases (Phases also added to the footer)
**Decision:** Drop the "Home" item from the top nav — the brand logo/wordmark already links home — and keep
Phases. Nav = Work · Guides · Method · Phases · About · Contact. Phases is also added to the footer (it was
the one main-nav page missing there).
**Rationale:** The new "Guides" entry made the seven-item nav crowd the wordmark at 768–1023px (it needed a
brand-text hide). "Home" is redundant with the logo on most sites, so dropping it is a free slot — chosen
over demoting Phases to footer-only, since Phases is a real qualification surface worth keeping up top. Six
items fit, so the brand-text hide was removed. Rejected: demote Phases to footer-only; keep the seven-item
nav + the brand-text hide.
**Consequences:** `Nav.astro` simplified (no brand-text crowding fix); footer gains Phases; refines
DEC-013-1 (which listed "Home" in the top nav).

## Conv 038

### DEC-038-1 — Posting-plan channel & funnel strategy (`reference/CHANNELS.md`)
**Decision:** Stand up the X + LinkedIn posting plan as a durable **channel/funnel reference**,
`reference/CHANNELS.md` — a third content axis beside `PERSONA.md` (who he is) and `VOICE.md` (how it
sounds). It sets: two funnel entries — **word of mouth** (traditional, unpredictable) + **inbound
discovery** via search/GEO (cultivated secondary, DEC-038-2); the social channels as a
**confirmation/qualification layer** (not cold acquisition), with the site's evergreen content the one
acquisition surface; channel roles — **LinkedIn** primary (positioning/credibility), **X** downstream echo
(personality), **Website** (qualify/convert + content home); cadence — **biweekly LinkedIn, opportunistic
X**; pillars — **Trust / Steering / Deciding** + a 40-years **Judgement** thread; sourcing — capture habit +
case-record mining + de-identified project drip; workflow — **CC drafts → operator approves → publish**,
write-once-then-distribute.
**Rationale:** WoM alone is a lottery; one lean, durable strategy file keeps all three media consistent yet
tailored. Rejected: a **second distinct X program** (doubles work, courts the builder crowd, against the
1–2-project capacity); folding channel strategy into `PERSONA.md` (mixes axes); three per-channel files
(duplication/drift).
**Consequences:** `CHANNELS.md` is consulted for all social + site content work (`CLAUDE.md` References
updated); sub-decisions DEC-038-2/-3; execution = the `[SITE-CONTENT-HOME]` build + running the cadence.

### DEC-038-2 — Secondary funnel entry: inbound discovery (search + GEO), not referral partnerships
**Decision:** Diversify the top of funnel with **inbound discovery** — buyer-education content found via
search and AI assistants — as the cultivated second entry point.
**Rationale:** WoM is a single, unpredictable mechanism (someone vouches). Inbound discovery is a *different*
mechanism (intent-driven pull) that reaches strangers, so it genuinely diversifies. **Referral partnerships**
(the rejected alternative) only firm up WoM — same vouching mechanism, not a new entry. Paid ads / speaking /
directories rejected (posture / bandwidth / commodity positioning).
**Consequences:** the site's evergreen content becomes the acquisition asset → makes the content-home
decision load-bearing (DEC-038-3).

### DEC-038-3 — Content home: guides + blog, hub-and-spoke
**Decision:** Build the content home as undated cornerstone **guides** (one per pillar — the GEO/SEO
acquisition backbone) + a dated **blog** (the "alive" stream and the owned home for
write-once-then-distribute to LinkedIn/X), with posts linking *up* to the guides.
**Rationale:** low volume + slow source cadence — undated guides avoid the staleness signal a thin blog
shows, while the blog gives social posts a durable, owned destination. Rejected: full blog only (staleness
risk), guides only (no stream / no owned post home), no content home (undercuts inbound discovery).
**Consequences:** `[SITE-CONTENT-HOME]` board row (build in `fgw-26`, dovetails with `[SITE-STRUCTURED-DATA]`).

### DEC-038-4 — Editor model reaffirmed: CC is sole editor of every file; per-project, operator approves
**Decision:** CC makes **every file edit** in this project (process, governance, and — with operator approval
before publish — site/deliverable copy); the operator **directs or approves** and does **not** edit files.
Standing for this project, **adopted per-project on onboarding** — not a blanket all-projects rule, and does
not preclude the operator editing directly in a project that hasn't adopted it.
**Rationale:** reaffirms `DEC-024-1` and `DEC-037-6`, which a mid-conv misreading had inverted (CC briefly
treated the operator as the file editor and proposed a "marketing-doc direct-edit carve-out"). The operator
retracted it — "edits are yours to make and yours alone" — and added the per-project nuance (keeps him free
to type directly in future projects). The carve-out was never enshrined.
**Consequences:** `CLAUDE.md` sole-editor rule rewritten; the carve-out reference scrubbed from `CHANNELS.md`.

### DEC-038-5 — Em-dash policy: all-content sanity check (surface before publishing), not a ban
**Decision:** Before publishing *any* new content (site page, blog, guide, LinkedIn/X post), CC **surfaces
every em-dash** for the operator to rule; em-dashes are **not banned**. Existing vetted copy stands. Also:
prefer complete sentences over fragment pile-ups on social (one rhetorical question is fine).
**Rationale:** an em-dash (and a fragment pile-up) can read as an AI-marketing tell, so a conscious
pre-publish check earns its keep — but a blanket ban over-reaches: the operator had already vetted the live
LinkedIn/X/site copy (which uses em-dashes naturally), so a retroactive sweep is false positives. Replaces
the "no em-dashes on LinkedIn/X" rule briefly set earlier the same conv.
**Consequences:** `CLAUDE.md` pre-publish rule + `CHANNELS.md` convention; the retroactive-sweep hopper item
retired.

### DEC-038-6 — OG share card names the subject + carries a headshot (supersedes `DEC-031-5`)
**Decision:** Rebuild the sitewide OG/Twitter card (`public/og-image.jpg`, 1200×630 JPEG,
`summary_large_image`) from a **durable HTML source** (`_cc/assets/og-image.html`, headless-Chrome render +
`sips`) that **names what is built** ("Custom Software"), adds **"MSc"** (eyebrow treatment) + **"Over 40
years"**, uses **"Built with AI for speed / Steered by me for quality"**, and includes a **circular
headshot**. `og:image:alt` updated to match.
**Rationale:** the Conv-031 wordmark-only card (`DEC-031-5`) named no subject ("built/corrected" with no
object) and had no regenerable source; a face reinforces the personal, work-directly-with-me positioning.
Along the way: text-only augmented card rejected (operator chose the photo); tight face crop rejected (zoomed
out to the original framing).
**Consequences:** prod-deployed; the X pinned-post image updated to match (delete + repost + re-pin, as X
can't swap media on a posted tweet). Supersedes `DEC-031-5`.

### DEC-038-7 — No X Premium
**Decision:** Keep X free/lean; do not buy Premium.
**Rationale:** X's role is a low-priority downstream personality/confirmation channel; Premium's main value
(reach boost + long posts) serves cold acquisition/volume, which X isn't doing here — reach would amplify to
the builder crowd not buyers, and long-form lives on the owned blog. Spend on the real engine (guides/blog,
proof assets) instead.
**Consequences:** the pinned post is the tight ≤280 form; a visual is added by attaching an image (X renders
no link-preview card for external links anyway).

## Conv 037

### DEC-037-6 — `DEC-024-1` affirmed: CC surfaces site-copy edits for approval (the balk was right)
**Decision:** `DEC-024-1` stands. The operator is the **approver** of site/deliverable-copy changes; CC
presents the exact change for approval rather than editing site content silently. When the operator
explicitly directs it and the exact wording is already approved in chat, CC may apply the edit, but still
shows it. Process/working files (`_cc/*`, board, hopper, `DECISIONS.md`) are outside `DEC-024-1` — CC
maintains them directly, as always.
**Rationale:** After CC declined to edit site copy and handed the changes to the operator, the operator
confirmed "you were right to balk. I do approve edits." The approval gate — the operator sees every
content change, nothing inferred from a diff — is the point of the rule and is kept. Rejected: widening
the rule so CC freely makes pre-approved site edits *without* presenting them.
**Consequences:** This conv's four site edits were made at explicit operator direction and shown for
approval before deploy. No `CLAUDE.md` rewording needed; the rule holds as written.

### DEC-037-5 — Deactivate the stranded Meristics LinkedIn Company Page
**Decision:** Deactivate the Meristics LinkedIn Company Page (operator executed), orphaned after the
Conv-036 makeover repositioned the profile to "Fraser Gorrie · Self-employed".
**Rationale:** Nothing links to it; off-brand (old purple identity vs. the new warm-dark brand); dormant
(4 followers, no posts); **zero collateral** — no other person lists Meristics as employer (verified); and
its only purpose (explaining the business name) is served on the site (`llms.txt` "trading as Meristics").
A separate company storefront also fights the "self-employed / doesn't need the work" posture. Rejected:
keeping the page.
**Consequences:** Deactivated (reversible within LinkedIn's window, then permanent). Recorded in
`_cc/linkedin-makeover.md` § Post-makeover cleanup.

### DEC-037-4 — Trailing-slash URLs: keep the slash, align internal links
**Decision:** Keep the site's **trailing-slash** canonical form (`/about/`) and fix the internal links
(written as `/about`) to include the slash — rather than switching the whole site to no-trailing-slash
URLs.
**Rationale:** The site is already built, canonicalised, sitemapped, and being GSC-indexed on the slash
form, so aligning links is by far the smaller ripple (no canonical / sitemap / GSC / redirect churn);
switching to no-slash is a site-wide re-canonicalisation for a cosmetic gain. Google treats the two as a
consistency/taste call, neither better. Rejected: switch to clean no-slash URLs (bigger blast radius,
though cheapest now, 1 day post-launch); leave links bouncing (the 307 on every direct nav is the irritant).
**Consequences:** Boarded as `[SITE-TRAILING-SLASH-LINKS]` (~42 links / 13 files + rebuild + redeploy +
crawl-verify), not done this conv — benefit is minor. Standing habit once done: every new internal link
must include the slash.

### DEC-037-3 — `/about` AI framing: drop "unreliable", keep candor where it's paired with the human-skill answer
**Decision:** On `/about`, reframe "a powerful, **unreliable** tool" → "a powerful tool" (drop the
defect-label), aligning with the persona's "worthy companion to AI" positioning. Leave the "confidently
wrong" candor on `/method` and `/llms.txt` **unchanged**.
**Rationale:** The persona reframes *away* from AI-as-defective (the gap is the human skill of directing
it, not AI's reliability); `/about`'s "unreliable tool" was the one spot framing AI as a defective thing.
But `/method` and `/llms.txt` name AI's failure mode *and pair it with the human-skill answer* ("I plan
the route and correct the course" / "steers the AI… corrects the course") — that *is* the persona's point,
and `VOICE.md`'s candor rule wants the honest failure-mode naming kept. Rejected: propagate the reframe to
all three spots (costs candor without buying alignment); leave `/about` as "unreliable" (contradicts the
persona).
**Consequences:** `/about` edited + deployed live. Candor about AI's failure mode retained where it serves
the positioning.

### DEC-037-2 — Site client-geography: "US, Canada and Europe"
**Decision:** Add Europe to the site's client-geography statements to match the Conv-036 LinkedIn copy —
in `history.astro`, `llms.txt.ts`, and the homepage JSON-LD `areaServed` (`Layout.astro`). Deployed live.
**Rationale:** The LinkedIn Experience (Conv 036) widened the geography to include Europe (recent clients);
the site said only US + Canada — a cross-property inconsistency. Chose to widen the site to match (the
Europe clients are real). For `history.astro` (the career-long sweep, whose named clients are all
Ontario/Canada), the operator chose to include Europe too, over keeping it present-tense-only. Rejected:
keep the site at US + Canada and let it differ from LinkedIn.
**Consequences:** Four loci reconciled (history, llms.txt, `areaServed`, + the LinkedIn source). Copy and
structured data consistent and **verified live**. `areaServed` uses "Europe" (continent) to match the
copy's wording. (Deploy required turning auto-mode off — the classifier blocks production deploys.)

### DEC-037-1 — X.com profile makeover (educating front door, inherited direction)
**Decision:** Reworked the X.com profile **live** to the same "educating front door" direction + buyer
audience as LinkedIn (`DEC-036-1`/`-2`): display name **"Fraser Gorrie, MSc 🇨🇦"** (MSc science nod + 🇨🇦 for
the Canada signal); a **concise bio** — "Software developer, over 40 years. Helping you get software worth
trusting out of AI." — seasoning kept quiet, the education angle reserved for *content* not the bio; a new
warm-dark brand **header** ("SOFTWARE DEVELOPER · 1982 → AI") re-rendered at X's 1500×500, replacing the
old "2 Paths / Done For You / Done With You" sales banner; kept location/website/photo; kept the current
pinned post, deferring a deliberate buyer-facing pin to `[POSTING-PLAN]`.
**Rationale:** Completes `[SOCIAL-MAKEOVER]` with one continuous voice across both properties and the site;
X was further from the new positioning than LinkedIn (overt sales framing). The bio's 160-char cap
(verified live) makes it a distilled identity+offer line, not a teaching surface. Rejected for the name:
plain / flag-only (operator wanted both the credential *and* the nationality signal). Rejected generally: a
distinct sales-forward X voice (`DEC-036-1` logic).
**Consequences:** `[SOCIAL-MAKEOVER]` complete (both halves); row retired to the ✅ tags. X profile live.
Working record `_cc/x-makeover.md`; banner source `_cc/assets/x-banner.html` (regenerable). Pinned-post +
posting cadence → `[POSTING-PLAN]`.

## Conv 036

### DEC-036-3 — `reference/PERSONA.md` as the standing persona/audience reference
**Decision:** Create `reference/PERSONA.md` — Fraser's outlook, approach, propensities, and audience — as
the standing reference consulted (alongside `reference/VOICE.md`) for **all** social-media and website
content work. Registered via a new `## References` pointer in `CLAUDE.md`.
**Rationale:** The persona/audience layer (who he is, who he's for) is distinct from `VOICE.md` (how the
copy *sounds*) and recurs across every content task, so a durable, discoverable home stops it being
re-derived each conv. Chose an always-loaded `CLAUDE.md` pointer over: relying on the decision-scan alone
(found only on a precedent search), or board-row citations alone (not always in view). A living doc with
an augmentation log.
**Consequences:** `CLAUDE.md` gains a `## References` section (which also finally gives `VOICE.md` an
always-loaded pointer). Future social/site work opens both before drafting. Augmented as work proceeds.

### DEC-036-2 — Social/educating audience: buyers, not builders
**Decision:** The audience for the social presence + educating content is **buyers** — business
owners/operators who need apps and are commissioning/buying AI-built software — explicitly **including
those who have tried to build with AI themselves** (the site's straw-man → tin-man → steel-man
self-qualification arc). Not professional programmers serving their own clients.
**Rationale:** The buyer *is* the client, so teaching them is the funnel, not a detour; it aligns
end-to-end (LinkedIn → site → clients), fits the persona (trusted, selective advisor), and is a
higher-value, less-crowded lane. Rejected the alternative (educate programmers): builds peer reputation,
not pipeline — and arguably trains competitors — and mismatches the funnel, since LinkedIn exists to pull
people to a site that sells to business owners.
**Consequences:** Captured in `reference/PERSONA.md` → Audience (incl. "how they see AI": wonder →
last-mile frustration → trust-you-can't-verify unease). Drives all social + site content targeting. The
**"worthy companion to AI"** reframe (AI isn't *unreliable* but *reliant* on the human's context/steering)
is the content through-line.

### DEC-036-1 — Social/LinkedIn positioning: the "educating front door"
**Decision:** The social presence mirrors the **site's** voice + brand and acts as a top-of-funnel that
**educates/teaches** (demonstrating judgement), routing people to `frasergorrie.com` for depth + proof.
The LinkedIn profile dropped the prior sales framing ("2 Paths / Done For You / Done With You", bold-unicode)
for the site's understated, candid register.
**Rationale:** Keeps one continuous voice across the LinkedIn→site click-through (a pitch-forward profile
landing on a quiet site reads as bait-and-switch, eroding the very trust the site sells); the educating
posture is the operator's authentic nature and is sustainable for a fortnightly cadence; it is the
less-crowded lane (most AI content targets builders, not calm teaching for buyers). Rejected B: a distinct,
sales-forward LinkedIn voice — against the operator's nature and funnel-incoherent.
**Consequences:** The whole LinkedIn profile was rebuilt to the site voice and **applied live** (Conv 036).
The educating posture carries into `[POSTING-PLAN]`. 🔴 Reach now depends on the content engine (posts),
not the quiet static profile — makes `[POSTING-PLAN]` load-bearing, not optional. "Selective / doesn't
need the work" must not curdle into "unreachable."

## Conv 035

### DEC-035-4 — Port the fps inline-trigger cadence mechanism into `/r-start`
**Decision:** Add a "Cadence checks" block to `/r-start`'s pre-computed context (arithmetic on
`CONV-COUNTER`) plus a Step 6 instruction to surface each line verbatim — `DUE` becomes the conv's
recommended action; the trigger only *surfaces*, never runs the work. Two triggers: `[GOOGLE-SERVICES]`
due when `n%3==2 && n≥38` (every 3 convs from 038), `[AGENT-DISCOVERY-WATCH]` due when `n%10==5 && n≥45`
(every 10 from 045).
**Rationale:** A second periodic task (`[GOOGLE-SERVICES]` every 3) appeared the same conv as the first
(`[AGENT-DISCOVERY-WATCH]` every 10), so a shared mechanism earns its place — two hand-maintained `⏰`
markers relying on the model noticing them is the exact fragile vigilance this replaces. Chose
fps-faithful inline triggers (proven/tested — fps `DEC-145-1`/`DEC-151-2`) over: (a) the brief same-conv
deferral + `⏰` board markers (**superseded** — the second task met the pre-set build trigger); (b) a
general `PERIODIC.md` registry (premature at two tasks; new untested parsing — kept as the refactor if
cadence tasks proliferate).
**Consequences:** `/r-start` grows one arithmetic block + one Step 6 instruction; each future cadence
task adds one line. First live fire is Conv 038's `/r-start`. Board `⏰` markers now point at the
mechanism. Supersedes the same-conv deferral noted in `AGENT-DISCOVERABILITY.md` §7/§8.

### DEC-035-3 — Pursue agent-discoverability as a tracked initiative
**Decision:** Pursue being found and answerable by AI agents as a first-class initiative, home doc
`AGENT-DISCOVERABILITY.md` (repo root). Layered: L0 be-extracted-correctly → L1 JSON-LD `Person` +
`ai-agent.json` manifest → L2 a remote MCP server on the Cloudflare Worker (query tools incl.
`evaluate_fit`) → L3 Web Bot Auth + lead capture. Discovery via the official MCP registry + directories.
Public profile facts captured: Ontario/Canada → serves North America; native/fluent English; Eastern
Time.
**Rationale:** The operator wants to *answer* agents tasked to "find someone like me" on his terms, not
be passively scraped. Chose a mainstream root doc over an `_cc/` topic note (operator: "this is now a
mainstream doc… I want to pursue this"). Honest caveat: L2/L3 bet on a thin-adoption frontier; L0–L1
carry near-term value.
**Consequences:** Six proposed board rows staged in §9 await ruling (`[DATA-PRIVATE-SCHEMA]` keystone,
`[SITE-PARAMETERIZE]`, `[AGENT-PROFILE]`, `[AGENT-MCP]`, `[AGENT-DIRECTORY-LISTINGS]`,
`[AGENT-DISCOVERY-WATCH]`). `[SITE-STRUCTURED-DATA]` (board) overlaps `[AGENT-PROFILE]`.

### DEC-035-2 — Agent-answer data model: a `.private` schema + parameterized prose
**Decision:** Gated data in `src/data` lives under a per-record `.private` key; a single `toPublic()`
boundary strips it and feeds both the rendered site and any MCP tool (default-deny). Target **100%
structural masking** — relational guards (no testimonial→case bridge; target language never named) made
structural by keeping sensitive values only under `.private`, never as public fields. Load-bearing prose
facts (e.g. project cost range) are parameterized out of page text into `src/data`.
**Rationale:** Makes the `[CASE-RECORD-SIGNOFF]` guard structural (schema shape) instead of
prose-enforced vigilance — better even without MCP, and the enforcement the MCP footgun required.
Parameterizing prose is single-source-of-truth, lets masking reach 100% (no gated value surviving as
inline text), and makes facts agent-queryable. Chose structural `.private`+`toPublic()` over prose-only
masking; chose 100%-structural (operator) over the initial ~80%/residual-policy split.
**Consequences:** Becomes the `[DATA-PRIVATE-SCHEMA]` + `[SITE-PARAMETERIZE]` board rows (not yet built).
The `[CASE-RECORD-SIGNOFF]` row becomes the human-readable policy; the schema is the mechanism.

### DEC-035-1 — `.btn-secondary`: 3:1 border + translucent-ink hover
**Decision:** `.btn-secondary` reads as a button via a 3:1 resting border (`--line` → `--field-border`)
and a hover that is a translucent ink overlay — `background-color: color-mix(in oklab, var(--ink) 8%,
transparent)`.
**Rationale:** The resting border was `--line` (~1.2:1, too faint to register); the hover was
`--tint-hover`, an opaque near-paper fill invisible on `--surface`/`--accent-tint` grounds. A translucent
overlay darkens any ground by a constant amount, so it reads everywhere in both themes. Chose the
translucent-fill hover (A) over an outline-emphasis hover (B — border/text go ember, no fill) after the
operator compared both live: A "works quite well," keeps the filled-hover language. Reused the proven
`--field-border` token (Conv 030) over a dedicated new border token (lean).
**Consequences:** One shared rule fixes every secondary button (home testimonial band, phase CTAs,
case-study transcript). Deployed Conv 035. The `var(--ink)` fallback lightningcss emits for
non-`color-mix` browsers is moot (those also lack `light-dark()`).

## Conv 034

### DEC-034-2 — `[SITE-HEADER-TITLE]`: reveal the page title in the sticky header on scroll
**Decision:** Implement `[SITE-HEADER-TITLE]` as an explicit per-page `headerTitle` prop (threaded
`SiteLayout` → `Nav`), revealed by an `IntersectionObserver` on the page H1 once it scrolls above the
sticky bar. It shows **inline beside the brand at ≥1024px** and as a **full-width second row inside the
sticky header below 1024px**, styled as an **eyebrow** (uppercase, ember `--accent-strong`),
**left-aligned**. Home omits the prop, so no reveal there.
**Rationale:** Four forks closed, each with a loser: (1) *explicit prop* over auto-reading the H1's
`textContent` — controllable wording, clean home opt-out, and it sidesteps home's H1 (an embedded
em-dash anchor + long headline). (2) *Full-width row below 1024 (option B)* over hiding the title in the
768–1023 band (A — rejected: the title staying visible is the whole point) and over raising the
nav→hamburger breakpoint to 1024 (C — rejected: trades the horizontal nav for a hamburger on common
laptop widths, a nav-behaviour change). The row is needed because the container caps at 768px until the
`lg` breakpoint, so the ~502px horizontal nav leaves no inline room there. (3) *Eyebrow typography* over
display-serif inked — the serif "looked clickable / like a nav item" (operator); the uppercase
letter-spaced ember label reads as a page marker and matches the site's section kickers. (4)
*Left-aligned* over centered — centering is the only non-gutter-aligned text in a left-aligned editorial
layout, and with `text-overflow: ellipsis` a long centered title falls back to left + right-ellipsis
anyway (no both-ends clip), so it just flips alignment by title length.
**Consequences:** `SiteLayout` gains an optional `headerTitle`; `Nav` renders the inline title + the
full-width row + an `is:inline` observer re-bound on `astro:page-load` (ClientRouter-safe); `global.css`
carries the two-variant eyebrow styling, forces the brand to `nowrap`, and bumps `scroll-padding-top` to
7.5rem below 1024 to clear the two-row header. `headerTitle` is set on 12 pages; home omits it. One
accepted tradeoff: below 1024 the header grows one row when the title reveals — a one-time content shift
as the H1 scrolls off; an overlay variant is available if that ever reads badly. Verified across widths,
both themes, deep-link clearance, and a ClientRouter swap.

### DEC-034-1 — Masking exception: the Gabriel Rymberg testimonial may name Gabriel + the Center for Unity
**Decision:** Gabriel Rymberg's live testimonial (home mask-safe pull-quote + full named quote on
`/testimonials`, `#gabriel-rymberg`) names **Gabriel + the Center for Unity** under a deliberate
**testimonial-only** exception to the standing masking guard (`DEC-023-3`). The exception is bounded: the
`translation-platform` case stays de-identified, no case-study link bridges the named testimonial to that
case, the target language is never named anywhere, and `discover-jesus`/`discover-the-ub` are unchanged.
**Rationale:** Gabriel gave a real, signed-off testimonial and explicitly cleared being named, so the
earlier blanket constraint (his quote must not name Gabriel/CFU — the Conv-029 premise, written when his
quote was hypothetical/suppressed) no longer fits the facts. Alternative that lost: keep him anonymous
despite his clearance — rejected because a named, real client endorsement is materially stronger, and the
mask's actual purpose (not linking the public Urantia work to the de-identified SPT/translation case) is
preserved by bounding the exception to the testimonial text and withholding the case link + target
language.
**Consequences:** The `[CASE-RECORD-SIGNOFF]` board guard is rewritten to current-state (it names the
live exception instead of the suppressed-state constraint + a ⚠️ amendment). Future testimonials follow
the restore mechanism in that row; the `translation-platform` de-identification remains load-bearing and
must not be relaxed by a case-study cross-link.

## Conv 033

### DEC-033-2 — robots.txt single-source: disable Cloudflare Bot Preference Sync
**Decision:** Resolve the live `robots.txt` inconsistency by disabling Cloudflare's **Bot Preference Sync**
(the managed-robots.txt prepend, in the zone's AI-Crawler-access-policies panel), making the repo's own
`robots.txt.ts` the single published source. Do **not** reproduce Cloudflare's broader training-UA block
list into the repo.
**Rationale:** Cloudflare was prepending a managed block that duplicated `User-agent: *` and set
`Google-Extended: Disallow` — contradicting `DEC-016-1`'s deliberate allow (kept so AI-Overviews grounding
isn't lost). The managed block is all-or-nothing (no per-line edit), so disabling the sync is the only
lever that removes the contradiction. The real training-bot blocking is enforced separately by the zone's
`Training = Disallow` access policy (edge enforcement, stronger than an advisory line) and stays on, so the
repo needs no copy of the list. Alternatives that lost: edit the managed block (not possible); copy CF's
~30-UA list into the repo (advisory-only, redundant with enforcement, a drifting roster — operator chose
"neither", and it also swept in `Baiduspider`/`Google-Extended` the repo deliberately allows); flip the
repo to disallow Google-Extended to match CF (reverses `DEC-016-1`, still leaves duplication).
**Consequences:** Live `robots.txt` = the repo file only; the `Google-Extended` allow is restored; no
`Content-Signal` lines. Training crawlers stay blocked at the CF edge. The robots policy is again fully in
version control. Operator action in the Cloudflare dashboard (done this conv; verified live).

### DEC-033-1 — Turnstile rendered "interaction-only" to hide the contact-form widget
**Decision:** The contact-form Turnstile widget renders with `appearance: "interaction-only"` so the box
stays hidden for a visitor who passes silently, surfacing a challenge only when Cloudflare judges one
needed. Server-side `siteverify` + the honeypot are unchanged.
**Rationale:** The visible Managed-mode box was pure UX friction with no security value — the real
protection is server-side verification + the honeypot. `interaction-only` removes the box in the common
case while keeping the token requirement. Chosen as a one-line code change (captured in the repo) over
flipping the widget's Cloudflare-dashboard mode to Invisible (config outside version control, can drift).
Alternatives that lost: leave the visible widget (friction); dashboard Invisible mode (durability — not in
repo).
**Consequences:** No Turnstile box for ordinary visitors; spam protection unchanged; the intended
appearance is recorded in a `consts.ts` comment by the sitekey. Deployed to production this conv.

## Conv 032

### DEC-032-7 — `/r-hopper` gains a Carry disposition
**Decision:** `/r-hopper`'s per-item ruling adds a 4th option, **Carry** (`D`): leave the item in the
hopper untouched to ride to the next conv. "Save/keep for next conv" means Carry, not Promote.
**Rationale:** promote/do-now/drop forced board-worthy-or-gone; an item can be worth keeping yet not
board-worthy, not for now, and not noise. Lost: forcing a Promote (clutters the board with
non-commitments) or a Drop (loses live captures). The operator's "save for next conv" had been misread as
Promote — this names the intent.
**Consequences:** `r-hopper/SKILL.md` updated (description, Step 3 options A–D, Step 4 "Resolve", Step 5
report, intro); `/r-end`'s hopper gate (carry-past-close, option B) already handles carried items, left
unchanged. Turnstile-hide + HSTS carried this way at this close.

### DEC-032-6 — Auto-mode denial → notify the operator and wait
**Decision:** On an auto-mode classifier denial, tell the operator it blocked the action and wait for
direction — no self-chosen workaround (`!<command>`, disabling auto-mode) and no retry.
**Rationale:** the operator wants the denial surfaced for their call, not routed around. Lost (and
superseded): the prior CLAUDE.md rule "offer the `!<command>` route first, don't disable auto-mode" —
which had been followed from stale text and is the reverse of the operator's intent.
**Consequences:** CLAUDE.md §Permissions line rewritten. The action denied this conv (the redirects prod
deploy) the operator ran after toggling auto-mode off.

### DEC-032-5 — Old-URL redirects: in-repo 301s, trailing-slash targets, fg-only
**Decision:** The URLs the fgw-26 rewrite changed/dropped from the previous live site (`fg`) get 301
redirects in `astro.config.mjs` → `_redirects`: `/how-i-work`→`/method/`, `/services|/web-dev|/ai-coaching`
→`/work/`, `/terms`→`/privacy/`, `/blog`→`/` (provisional). Targets carry trailing slashes (single hop).
The 2023 `frasergorrie` legacy URLs are **not** covered.
**Rationale:** external links/search hit the old paths; a 301 preserves them. Trailing-slash targets beat
bare targets (the site 307-normalises, else a double hop). fg-only beat covering 2023 too — `fg` itself
never redirected those, so they already 404'd; adding them now regresses nothing and isn't owed.
`/ai-coaching`→`/work` and `/blog`→`/` are operator calls (no coaching/blog offering now).
**Consequences:** 6 redirects live + verified single-hop on prod; `/blog`→`/` flagged provisional.

### DEC-032-4 — Routes are production-only; a deploy guard enforces it
**Decision:** Worker `routes` (apex custom domain + `www` route) live only in the top-level (production)
`wrangler.jsonc`; `env.staging` sets `routes: []` + `workers_dev: true`. `assert-worker.mjs` refuses to
deploy any non-prod build (`name !== "fgw"`) that carries routes.
**Rationale:** `@astrojs/cloudflare` flattens top-level + env config at build time and does **not** override
`routes` per named env, so a `deploy:staging` inherited the prod routes and **stole `frasergorrie.com`**
onto the staging worker (apex served staging ~minutes before recovery). Clearing routes in the env fixes
it; the guard catches a regression. Lost: trusting config alone (the near-miss proves it fails silently).
**Consequences:** recovered by reassigning the apex custom domain to `fgw` via API (override flags);
staging redeployed clean; guard tested (prod ✓, staging ✓, staging-with-routes refused ✓).

### DEC-032-3 — Image brown-band fix: absolute-fill the `<img>`
**Decision:** `.hero-portrait` / `.headshot` / `.case-mockup` images are `position:absolute; inset:0`
inside their positioned box (keeping `object-fit:cover`), instead of relying on `height:100%`.
**Rationale:** `height:100%` does not resolve through the `display:contents` `<picture>` wrapper
(`DEC-031-4`), so each `<img>` fell back to its intrinsic ratio, came up short, and exposed the brown
placeholder gradient as a ~30% top band. Lost: dropping `display:contents` (reintroduces the percentage-
height chain). Absolute-fill is the standard fixed-aspect-box pattern and sidesteps the chain.
**Consequences:** verified live (headshots + redline mockup fill, gapTop 0) on staging then prod.

### DEC-032-2 — Contact form: inline handler re-bound per navigation
**Decision:** The contact form's JS enhancement is `is:inline` and re-binds on every `astro:page-load`
(idempotency guard `form.dataset.enhanced`); the `<form>` gets `data-astro-reload`.
**Rationale:** the handler wasn't reliably attached on view-transition navigations, so Astro's ClientRouter
intercepted the POST as a view-transition nav — the email sent but the page landed on `?sent=1` with a
cleared form and no confirmation. Re-binding guarantees the `fetch`/`preventDefault` path wins;
`data-astro-reload` makes any native fallback a full reload where the `?sent/?error` handling runs. Lost:
leaving it a bundled module script (ran once — the bug) and `data-astro-reload` alone (loses the no-reload UX).
**Consequences:** verified live — in-site-nav submit stays on `/contact/`, shows the thank-you, email delivers.

### DEC-032-1 — DNS cutover: config-as-code, zone already on Cloudflare, email preserved
**Decision:** `frasergorrie.com` is cut to fgw-26 by binding the apex as a Worker **custom domain**
(`wrangler.jsonc` top-level `routes`, config-as-code) and `www` as a Workers **route** on its existing
proxied CNAME; the app redirects `www`→apex. The zone was **already active in this Cloudflare account**
(Namecheap NS already point to Cloudflare) → **no nameserver change**; MX + SPF/DKIM/DMARC TXT are a
different record type and left untouched.
**Rationale:** config-as-code keeps `wrangler.jsonc` the source of truth (durable) over a dashboard binding.
`www`-as-route beat a second custom domain (no conflict with the existing proxied CNAME, no DNS-write scope
needed). The legacy site ran on a Cloudflare **Pages** project holding the apex custom domain — detached
it; after the apex CNAME→pages.dev blocked the bind, the operator deleted that one record and the bind
completed. The deploy-mirror rule (`DEC-031-6`) **expired at cutover** as designed.
**Consequences:** site live — apex + `www` HTTPS, GA4 realtime confirmed, `og:image`/robots/sitemap
correct, `workers.dev` disabled (resolves the crawlable-workers.dev watch). `[SITE-GO-LIVE]` closed.

## Conv 031

### DEC-031-8 — Turnstile gates the cutover; explicit-render widget + fail-closed server verify
**Decision:** Cloudflare Turnstile on the contact form is a **cutover gate** (operator ruling at `/r-hopper`).
The widget renders *explicitly* and re-renders on every `astro:page-load` (survives view-transition nav);
`api/contact.ts` verifies the token via siteverify **fail-closed**, *after* field validation; the public
site key is in `consts.ts` (`TURNSTILE_SITEKEY`), the secret a Worker secret (`TURNSTILE_SECRET_KEY`, in
`wrangler.jsonc` `secrets.required` + `.dev.vars`).
**Rationale:** a public form attracts spam; honeypot-only is thin. Lost: defer to post-launch (exposure
window) and drop (ongoing spam + Resend cost). Implicit auto-render lost — api.js only auto-scans once and
misses SPA nav. Verifying before field-validation lost — would break the field-error UX and waste
siteverify calls on garbage.
**Consequences:** 403 on tokenless/invalid; 16 unit tests; deployed prod+staging, verified end-to-end
(widget → siteverify → email). 🔴 Go-live dependency: the widget's Hostname Management must list
`frasergorrie.com` + `www` or the live form 110200-errors (hit during testing). `[SITE-CONTACT]` closed.

### DEC-031-7 — A completed board row is deleted to the tags line, not archived inline
**Decision:** When a task completes, its `CURRENT-TASKS.md` row is **deleted** and the task drops to a
one-line `## ✅ Completed (tags)` entry; the detail lives in commit messages, `DECISIONS.md`, and
`docs/convs/`. The board shows only live work.
**Rationale:** keeping each done row with its full Status/build-log as an inline archive grew the board to
~390 lines, fighting the lean principle (`DEC-000-7`). Lost: keep the inline archive (its history already
lives in three drift-proof places). Refines the archive aspect of the fps-format (`DEC-007-1`), not the rest.
**Consequences:** board cut 392 → ~110 lines; preamble updated to state the rule. `[CASE-RECORD-SIGNOFF]`
is the one done row kept — solely for its standing masking guard.

### DEC-031-6 — Staging stays mirrored to production until the domain cutover
**Decision:** Until `frasergorrie.com` is cut over, every production deploy is mirrored to staging (and
vice versa) so the two serve identical builds — only the intentional env differences remain (staging
`noindex` + GA gated off). Operator instruction; expires at cutover.
**Rationale:** keeps pre-cutover checks on staging meaningful. Lost: deploy prod-only and let staging lag
(cheaper, but staging stops representing production).
**Consequences:** every Conv-031 deploy went to both; recorded on the board as a standing rule with a stated expiry.

### DEC-031-5 — ⛔ superseded by `DEC-038-6`

### DEC-031-4 — Image optimization via astro:assets `<Picture>`
**Decision:** The two heavy rasters (`fraser.jpg` 335 KB, `redline.png` 352 KB) go through astro:assets
`<Picture>` (AVIF/WebP + resized fallback), right-sized per placement; `fraser.jpg` moved `public/` →
`src/assets/`; SVG mockups pass through; the `<picture>` wrapper is unwrapped with `display:contents` so
existing `object-fit:cover` sizing holds; the JSON-LD `image` single-sources the imported asset's `.src`.
**Rationale:** astro:assets beat in-place pre-optimization (can't right-size per spot — the 80px avatar
still pulled a full photo). Per-spot `<Picture>` beat one fluid responsive `<img>` (the three fraser spots
are distinct fixed sizes, not one reflowing image).
**Consequences:** on-page AVIF transfer: avatars 335 KB → ~2 KB, portrait → ~27 KB, mockup 352 KB → ~32 KB;
lightbox full-size now a WebP too. Verified in the running product. Formal Lighthouse run left optional.

### DEC-031-3 — Go-live split into two steps; reversible prod worker early, DNS cutover last
**Decision:** `[SITE-GO-LIVE]` splits into **step 1** (deploy the production worker + prod `EMAIL_TO`,
verify on `*.workers.dev` — reversible, domain untouched) done now, and **step 2** (custom-domain binding +
DNS cutover — irreversible) done **last**, after `[SITE-PERF]` + `[SITE-OG-IMAGE]`. Critical path re-sequenced.
**Rationale:** cutting over before PERF/OG-IMAGE spends the launch's one first impression + Google's first
crawl on the unfinished site. Lost: cutover-first (the operator's initial framing — they were fine losing
the legacy fallback, but the real issue was launching on the finished site, not reversibility). Splitting
keeps the only irreversible action last at no cost (the worker deploy is reversible + testable alone).
**Consequences:** prod worker live at `fgw.fgorrie.workers.dev`, contact form verified end-to-end; the
domain stays on the legacy site until explicit go-ahead. Watch: the workers.dev URL is crawlable pre-cutover
(mitigated by canonicals → `frasergorrie.com`).

### DEC-031-2 — GA4 is production-only; page_view sent manually on astro:page-load
**Decision:** GA4 (`G-EH3RJTF0VE`, lean gtag, no banner — `DEC-030-3`) renders **only in production**
(`!isStaging`). Because the site uses `<ClientRouter>`, the automatic page_view is disabled
(`send_page_view:false`) and one is sent manually on every `astro:page-load`. `/privacy` was rewritten to
name GA + an opt-out, the lede softened, stale no-analytics/legal notes dropped.
**Rationale:** prod-only gating beat firing everywhere (staging is `noindex`; its hits are noise). Manual
page_view beat GA4 enhanced-measurement "history events" (can send a stale URL/title on Astro swaps) —
needed for an accurate case→`/record` funnel + per-page engagement.
**Consequences:** GA data starts at cutover; funnel + engagement measurable; verified in-browser (one
page_view per nav, no double-fire). `[SITE-ANALYTICS]` closed.

### DEC-031-1 — Social links: X as `x.com`; footer brand marks + JSON-LD `sameAs`
**Decision:** `[SITE-SOCIAL]` adds X (`x.com/frasergorrie`) + LinkedIn (`linkedin.com/in/frasergorrie`) to
the footer (inline fill-SVG brand marks, `sr-only` labels) + a `sameAs` array on the Person JSON-LD.
**Rationale:** `x.com` chosen over the live `fg` site's `twitter.com` form (operator pick; twitter.com
redirects anyway). Brand marks live inline (fill glyphs) rather than in the stroke-based `Icon.astro` set.
URLs verified against `fg`.
**Consequences:** `[SITE-SOCIAL]` closed; marks + `sameAs` deployed.

## Conv 030

### DEC-030-6 — `/work` case layout: hoist the visual + benefit above the prose on mobile
**Decision:** The `/work/<slug>` case page is a 3-part grid — `.case-lead` (mockup/diagram/segment-table +
the one-line benefit), `.case-main` (prose), `.case-extra` (Built-with tools). Mobile (flex-column, DOM
order) stacks **lead → prose → tools**; desktop uses `grid-template-areas` ("main lead" / "main extra") to
reassemble the prior sticky two-column sidebar unchanged. `CaseExtras.astro` gained a `part` prop
("lead" | "tools") to render the two groups into their slots.
**Rationale:** prose-first buried the product screenshot and the one-line benefit hook at the bottom on a
phone. Alternatives that lost: keep prose-first (option A — zero work, but visual/benefit stay buried);
extras-first (option B — hoists the whole aside incl. tools, burying the narrative and showing a
context-free diagram). C hoists only the visual + benefit; tools stay below.
**Consequences:** mobile case pages lead with image → benefit → narrative; desktop is visually unchanged
(verified via DOM order + a desktop screenshot). `.case-aside` retired for `.case-grid`/`.case-lead`/
`.case-extra`. Not yet deployed to staging.

### DEC-030-5 — NODE-FLOOR: guard `typecheck` with a pretypecheck node check
**Decision:** Added `pretypecheck: node scripts/check-node.mjs` to `fgw-26/package.json` so `npm run
typecheck` fails with the clear "run `nvm use`" message on Node below the engines floor, matching the
existing `predev`/`prebuild` guards. The repo `.nvmrc` (24.22.1) already existed.
**Rationale:** the recurring papercut was `typecheck` dying with a cryptic astro-check error on a fresh
Node-22 shell. Alternative that lost: diagnose/fix why the shell defaults to Node 22 — that is the
operator's global `nvm alias default`, a machine setting outside the repo, left to them. The guard is the
in-repo durable fix.
**Consequences:** all three build-ish scripts fail loud + actionable below the floor; verified live under
Node 22. `[NODE-FLOOR]` closed.

### DEC-030-4 — The Tooling statement ships on the home page only
**Decision:** Fraser's summative tools statement ("The tools I reach for" — Claude Code/Claude first;
comfortable with OpenAI + Codex; open-source LLMs on personal work; third-party in-app tools the client's
choice) ships as a Home section (eyebrow + h2), single-sourced. The `[SITE-TOOLS]` dedicated-page idea
stays parked.
**Rationale:** a prospect wants the "current + flexible on tools" signal early, before inner pages.
Alternatives that lost: `/method` only (operator: prospects won't reach it early); Home **and** `/method`
(duplicate copy across pages — the drift the Conv 029 consistency pass just cleaned up). Home-only gives
early visibility without duplication.
**Consequences:** home carries the statement; the `[SITE-TOOLS]` page is revisited only if a fuller tools
surface earns its place ("individual projects give a taste").

### DEC-030-3 — GA4 as the analytics provider, lean and banner-less
**Decision:** `[SITE-ANALYTICS]` will wire **Google Analytics 4** into the Layout `<head>` and rewrite the
`/privacy` "Analytics and cookies" section with it (the two move together), mirroring the current live
site's approach in `fg`: a basic `gtag` snippet, **no consent banner**, with a plain privacy disclosure.
Blocked on the real `G-XXXXXXX` Measurement ID (operator standing GA up "today"; `fg` carried only a
`GA_MEASUREMENT_ID` placeholder).
**Rationale:** the site is NA-focused (areaServed US + Canada), privacy-light, near-zero-JS; GA4 is what the
operator uses and matches the legacy site. Alternatives that lost: a privacy-lighter provider (Plausible /
Cloudflare Web Analytics — operator chose GA4); a cookie-consent banner / Consent Mode (deferred — EU reach
is incidental; the operator may add one later). EU-consent caveat noted.
**Consequences:** `[SITE-ANALYTICS]` is ordered; building waits on the Measurement ID. The `/privacy`
"no analytics/cookies" copy must change in the same commit that wires GA4.

### DEC-030-2 — Drop the `/privacy` legal-review go-live gate
**Decision:** The pre-production **legal review** of `/privacy` (CC-drafted, Conv 027) is removed as a
`[SITE-GO-LIVE]` gate — the operator deems the policy adequate and does not want a lawyer.
**Rationale:** the operator's call on their own risk tolerance for a solo-consultant site. Alternative that
lost: hold the gate pending a lawyer review (the Conv 027 default). Not CC's decision to make — recorded as
the operator's.
**Consequences:** one fewer go-live gate; remaining `[SITE-GO-LIVE]` gates are operator DNS + go-ahead +
prod `EMAIL_TO`. The analytics/consent `/privacy` rewrite (`DEC-030-3`) is separate and still pending.

### DEC-030-1 — WCAG AA remediation: three fixes, with a scoped form-border token
**Decision:** Three WCAG AA gaps found in the `[SITE-A11Y]` review were fixed: **F1** input/textarea
placeholder colour `--faint`→`--subtle` (2.9:1 → 5.2–5.4:1, WCAG 1.4.3); **F2** a new `--field-border`
token (`light-dark(#8f8169,#7a7161)`, 3.1–3.7:1, WCAG 1.4.11) scoped to `.input/.textarea/.select`; **F3**
contact-form per-field error association — `aria-describedby` → a `field-error` slot, with blur-time
`aria-invalid` + a plain-language message cleared on valid input (WCAG 3.3.1).
**Rationale:** the form's `--surface`-on-`--paper` fields rested on a ~1.2:1 `--line` border. Alternatives
that lost: darken `--line` globally (would thicken every hairline/card site-wide) — rejected for a token
scoped to form controls; for F3, a hard submit-gate alone (a silently-disabled button with no explanation)
— kept the gate but added blur errors so AT users learn *why* a field is unaccepted.
**Consequences:** the site passes AA contrast in both themes; form errors are announced. Deployed to staging
(`cb5f7d02`). `--line` hairlines/cards unchanged. The non-AA home heading-size note stays with
`[SITE-CONSISTENCY]` part 5.

## Conv 029

### DEC-029-5 — Suppress the unfulfilled AI-era testimonials behind a reversible flag
**Decision:** The two AI-era testimonials (the home "Recent testimonials" band and the `/testimonials`
"In the AI era" section) are suppressed behind a `showAiTestimonials = false` flag in `index.astro` +
`testimonials.astro` — markup left intact; the `/testimonials` lede is flag-gated to a single-group
wording. The quotes never arrived from the two clients and may not. Restore = add a real signed-off quote
to `testimonials.json` and set the flag `true`.
**Rationale:** showing SAMPLE-badged mock quotes on the two most prominent surfaces oversells with
placeholders that may never become real; an empty slot beats a fake one. Alternatives that lost: keep the
SAMPLE-badged mocks (the Conv 018 state — risks reading as real); delete the sections outright (loses the
cheap return path). A flag keeps the markup and makes return a one-word change.
**Consequences:** the "swap MOCK testimonials for real" item is no longer a `[SITE-GO-LIVE]` blocker — the
site can launch without AI testimonials. If a quote later lands, the `[CASE-RECORD-SIGNOFF]` masking vet
applies before it renders, and the two-group lede returns with the flag. On staging (`0dcb567e`).

### DEC-029-4 — Unique per-page meta descriptions for the pages that inherited the default
**Decision:** Home, About, Method, Contact, and Phases each get their own `description` (previously they
inherited a generic default predating the Conv 017/018 home rework). History/FAQ/Testimonials already had
their own; minor pages (Work, Privacy, etc.) keep the default.
**Rationale:** the default was a stale throwaway line surfacing as the search/social snippet for the
most-shared page (home). Alternatives that lost: refresh the single shared default for all (search engines
mildly favour unique descriptions, and home deserves its own); home-only (operator chose all five main
pages). Wording operator-tuned: "Fraser" not "Fraser Gorrie"; the home/About lines reworded so "40 years"
attaches to Fraser's career, not to AI.
**Consequences:** each key page carries a tailored snippet; new main pages should get their own rather than
lean on the default.

### DEC-029-3 — Stop asserting honesty in copy; keep describing a candid record
**Decision:** The four assertion-type "honest/honestly" instances were reworded — FAQ h1 + its meta
description → "straight answers"; "Honestly," dropped in the `this-site` case; `/llms.txt` `/faq` note →
"Straight answers". The descriptive uses ("an honest record", "the honest account", "name its limits
honestly") are kept.
**Rationale:** protesting one's own honesty can backfire; the site's credibility comes from the shown
record, not the claim. The descriptive uses are different in kind — they describe demonstrated candor (the
`DEC-000-6` evidentiary frame), not a self-virtue claim. Alternative that lost: reword the descriptive
group too (would weaken the frame that is the site's whole point). Extends Conv 028's drop of FAQ item 5's
"Honestly".
**Consequences:** new copy avoids asserting honesty as a virtue; describing the record's candor stays fine.

### DEC-029-2 — Execute the UK-spelling sweep site-wide, incl. metadata and the client-approved cases
**Decision:** The `DEC-028-2` UK standard was swept across all visible prose **and** the metadata layer
(page title, default meta description, JSON-LD, `/llms.txt`): judgment→judgement, organiz*→organis*,
modernization→modernisation, recognized→recognised, formalizing→formalising. The sweep **includes the four
client-approved Work cases** — a spelling standardisation is treated as a non-substantive copy-edit that
client content sign-off does not freeze. Left untouched: the `/record` transcripts (`DEC-014-1`, verbatim
auditor output), developer code comments, and the schema.org vocabulary keywords
`parentOrganization`/`Organization`.
**Rationale:** one site, one spelling variety; metadata saying "judgment" while pages say "judgement" is the
same drift part 2 of the row targets. Touching the approved cases is defensible because the edits alter no
claim, name, or fact — only house style — so "no changes" is not violated in substance; the alternative
(cases US while the rest is UK) keeps a visible split across the repeated "The judgement that mattered"
headings. Records stay US by `DEC-014-1`; schema keywords are fixed vocabulary, not spelling.
**Consequences:** UK spelling now holds across prose + metadata; the `/record` transcripts remain a
deliberate US-spelling island by `DEC-014-1`.

### DEC-029-1 — Reconcile non-home vertical rhythm by reducing the global section rhythm
**Decision:** `--section-rhythm` reduced from `clamp(4rem, 8vw, 8rem)` to `clamp(3rem, 5vw, 4.5rem)`,
applied uniformly to all `.section`/`.band` edges (below the header, between sections, above the footer).
Home keeps its 2.5rem `-tight` override.
**Rationale:** inner pages carried ~64–128px section padding vs home's 40px — the "non-home pages too tall"
the operator flagged Conv 019, most visible below the sticky header. Alternatives that lost: match home
exactly at 2.5rem flat (would flatten long reading pages to the hero's beat and drop responsive scaling);
leave as-is (keeps the inconsistency). The chosen value keeps a little responsive air for long-form reading
while closing most of the gap, applied uniformly (operator chose not to special-case the page edges).
**Consequences:** the CSS "until reconciled" note is resolved; home stays intentionally a touch tighter than
the inner pages. On staging (`0dcb567e`), flow confirmed by the operator.

## Conv 028

### DEC-028-2 — Site-wide spelling variety standard = UK English
**Decision:** The site standardises on **UK English** spelling. This conv fixed "judgment" → "judgement"
on the FAQ ("too old" answer) and Testimonials (pre-AI intro); a site-wide sweep for any remaining US
forms (-ize, color, etc.) is promoted into `[SITE-CONSISTENCY]` (part 6).
**Rationale:** the pages already used UK forms ("favourite", "favourites", "non-judgemental"), so UK was
the de-facto variety and "judgment" was an inconsistent US straggler. Alternative that lost: standardise
on US English — would have meant changing the more numerous, more deliberate UK forms.
**Consequences:** new copy uses UK spelling; the `[SITE-CONSISTENCY]` sweep owns reconciling any remaining
stragglers before go-live.

### DEC-028-1 — FAQ accordion legibility: lift the group headings and bar the open answers (scoped, not indented)
**Decision:** On the FAQ, group headings are lifted — weight 700 + a 2px accent underline rule
(`.faq-group h2`) — and open answers carry a 2px left accent bar (`.faq-a`). The same heading rule is
reused for the Testimonials time-period headings (`.testimonial-period-h2`). The treatment is kept
**scoped** to these grouped pages; other pages' section headings stay on plain `text-h3`.
**Rationale:** the group heading shared the questions' weight and colour, so only a 1.5× size step set it
apart — too weak. Web research found the convention is to **lift the heading** (weight / colour / rule),
not **indent the questions** (sites keep items flush-left) — hence the rule, not indentation. The left
answer-bar fixes a second problem the operator flagged: an open answer flowed into the next question with
an identical hairline between them, so where the answer ended was ambiguous; the bar runs the answer's
height and stops. Alternatives that lost: indenting the questions (against convention); for the answer,
tinting the whole open item (heavier) or turning every divider accent (busier, competed with the heading
rule). Keeping it scoped rather than a site-wide section-heading pattern was the operator's call for now
(the open question is recorded in `[SITE-CONSISTENCY]` part 5).
**Consequences:** `.testimonial-period-h2` mirrors `.faq-group h2`; if the treatment later goes site-wide
both collapse into a shared utility. `var(--accent-strong)` keeps both rules theme-aware (verified light
+ dark). On staging (`4e10f27c`).

## Conv 027

### DEC-027-6 — Contact email unified to `fraser@frasergorrie.com`
**Decision:** `EMAIL_FROM` (in `wrangler.jsonc`, both the default and staging envs) and the contact page's
no-JS mailto fallback are both set to `fraser@frasergorrie.com`, replacing `fgw@frasergorrie.com` and a
`hello@frasergorrie.com` placeholder respectively. Verified **end-to-end on staging** this conv: Resend
accepts the sender (the whole `frasergorrie.com` domain is verified — `signed-by frasergorrie.com`),
the mail is delivered to the inbox, and `reply-to` carries the submitter's own address.
**Rationale:** one address wherever the operator is reachable; the `hello@` placeholder was a go-live
footgun (the no-JS path mailed a non-inbox). Same verified domain, so the local-part change sends cleanly.
Alternative that lost: keeping the separate `fgw@` send-from address.
**Consequences:** `wrangler.jsonc` + `contact.astro` committed (`7b584db`). Local dev `.dev.vars`
`EMAIL_TO` stays `test@example.com` by design. The **production `EMAIL_TO` secret** must be set to
`fraser@frasergorrie.com` via `wrangler secret put` once the prod worker exists — a `[SITE-GO-LIVE]`
pre-production gate.

### DEC-027-5 — Method's per-section heading icons removed, for prose-page consistency
**Decision:** dropped the four decorative `<h2>` icons (lock / pie / document / alert) on `/method`; its
headings are now plain, like every other prose page (About, History, Phases, FAQ, Privacy). Removed the
now-unused `Icon` import and the dead `.method-h2` / `.method-icon` rules from `global.css`.
**Rationale:** the site's decorative-icon vocabulary lives on **cards** (the home judgment / "what I do"
bands) and as **affordances** (arrows, mail, menu) — Method was the only running-prose page decorating its
headings, which nudged it toward "feature-list brochure" against the calm editorial voice of the other
prose pages. Alternatives that lost: keep them (Method as the one more-designed page); rework them into a
card treatment.
**Consequences:** `method.astro` + `global.css` committed (`8070b65`); also moots the a11y question of
whether those heading icons were announced to screen readers.

### DEC-027-4 — The contact API gets the first backend-endpoint test suite; a convention for where such tests live
**Decision:** added `src/pages/api/_contact.test.ts` — 12 vitest tests over the `/api/contact` route
(required-field validation, email-shape rejection, honeypot fake-success, `503` when unconfigured, the
Resend POST payload + success, `502` on Resend failure, the no-JS `303` redirects, `GET` → `405`). It runs
in the **node** vitest environment (per-file docblock) with `cloudflare:workers` (`env`) and global
`fetch` mocked, and is **underscore-prefixed** so Astro's file-based routing does not turn it into a route
— an un-prefixed `*.test.ts` under `src/pages` prerenders as an endpoint and breaks the build (hit this
conv).
**Rationale:** the validation / honeypot / delivery logic was entirely untested ("green ≠ proven",
`DEC-000-7`). This extends `DEC-003-2`'s island-only test scope to a backend endpoint. Alternative that
lost: a `[CONTACT-TESTS]` board row (deferring) — the operator asked to write them now. The underscore
placement was forced by the build failure, not chosen freely.
**Consequences:** `npm run verify` green (lint + typecheck + test + build); committed (`e852b4e`). The
pattern — backend-endpoint tests as `_`-prefixed node-env files beside the route — is the convention for
future endpoint tests. `vitest.config.ts`'s "island-only" comment is now slightly narrow; left as-is.

### DEC-027-3 — A `/privacy` page now; no standalone ToS; a liability disclaimer folded in
**Decision:** shipped a footer-tier `/privacy` page describing the **actual** fgw-26 data flow (contact
form → Cloudflare edge → Resend email; no database; no analytics / cookies currently), with a short
**liability disclaimer** folded in ("provided as is… nothing is a professional commitment until it's set
out in a written agreement") and a footer "Privacy" link — and **no** standalone Terms of Service. The
"Analytics and cookies" section is a stub to revise when `[SITE-ANALYTICS]` wires a provider.
**Rationale:** the contact form collects PII (name / email / message) via third parties, with EU
reachability, so a privacy policy is the expected baseline; a full public ToS is contract material that
belongs in an engagement agreement, not a brochure site (the legacy `fg` ToS was tightly coupled to the
old hour-block / coaching model and named Meristics/Technifar + specific rates). A liability disclaimer is
the one defensible public piece. Alternatives that lost: defer all legal pages until `[SITE-ANALYTICS]` is
chosen (write once); a full ToS; a privacy page with no disclaimer. (The legacy `fg` privacy page named
Google Analytics + Calendly — neither in this site's stack.)
**Consequences:** `src/pages/privacy.astro` + the Footer link committed (`4702ae0`), on staging. 🔴
CC-drafted, **not lawyer-reviewed** — a `[SITE-GO-LIVE]` pre-production gate (legal review, and revise the
analytics section when a provider is wired).

### DEC-027-2 — Pricing shown as a qualifier: a project-scale band, not a rate card
**Decision:** a **$10K–$150K** project-scale band appears as a qualifying line on the Phases close (a new
"What to budget" section before the CTA) and as a new FAQ entry ("What does an engagement cost?"). Framed
as a range to self-qualify against, **not** a quote; **no hourly rate** shown. The FAQ entry **reverses**
the Conv-013 scoping that dropped pricing from the FAQ (and now feeds the `FAQPage` JSON-LD).
**Rationale:** a price floor is the most efficient qualifier (filters sub-band shoppers; signals senior
judgment, supporting the "why pay FG vs a cheap wrapper" reassurance half of the positioning thesis). An
hourly rate — as the legacy `fg` site showed ($150–$250/hr) — would reframe FG as an hourly contractor and
invite the race-to-the-bottom comparison the thesis argues against. Placed with the self-qualification
funnel (Phases), not a standalone `/pricing` page (which becomes a rate-shopping destination and strips the
number from its value context). Alternatives that lost: no pricing on the site; fuller `fg`-style
transparency incl. hourly; a dedicated `/pricing` page; an in-lede framing.
**Consequences:** `phases.astro` + `faq.json` committed (`4702ae0`), on staging. `$10K–$150K` is the
operator-set band; hourly mechanics (if any) belong in the contract / ToS, not marketing.

### DEC-027-1 — `translation-platform`'s "judgment that mattered" + frontmatter reconciled to the real arc
**Decision:** the case's "The judgment that mattered" section was reworked (the operator's own account)
from the old "threw a number away / matched a free baseline, wound down cleanly" framing to the real arc —
he built a DeepL-correction pipeline (calibrated twice against a human gold standard, automated for
production), but general-purpose AI **leapfrogged** the whole approach (translating near-perfectly without
it) and the client called the hiatus before he did. The frontmatter `summary` (option **B** — now signals
the overtaken / paused reality), `outcome`, and `proof` were retold to match; `problem` left as-is.
**Rationale:** body and frontmatter must tell one story. A finding reframed the scope — `proof` / `outcome`
/ `problem` are optional and **rendered by no component**; only `summary` ships (the `/work` card text + the
page meta `description`) `[checked: content.config.ts + grep for data.proof/outcome/problem]`. (This
corrects an in-conv hopper note that wrongly said proof/outcome feed SEO.) Masking (`DEC-023-3`) preserved:
no target language / source text / client org / people named; DeepL was already named in the body.
Alternatives that lost: leave the frontmatter stale (invisible to users, but a stale record); delete the
dead fields site-wide (the un-chosen option C).
**Consequences:** `translation-platform.md` committed (`4691bda`), deployed to staging (new summary / meta
verified live). The dead-field observation (`proof`/`outcome`/`problem` unrendered) stays on record for a
possible future cleanup.

## Conv 026

### DEC-026-3 — The other five cases' frontmatter/SEO left as-is after a consistency audit
**Decision:** A Conv-026 audit compared each non-Urantia Work case (`this-site`, `redline`,
`translation-platform`, `learning-marketplace`, `personal-productivity-app`) against its `summary` — which
is both the `/work` card text and the SEO `description`/`og`/`twitter` — and its dark
`problem`/`outcome`/`proof` fields. Finding: **no material inconsistency**; every field faithfully reflects
its body. The operator ruled the remaining observations — summary phrasing drifts (redline "day" vs
"afternoon"; a `learning-marketplace` stray comma), the summary-doubles-as-meta-description length overruns
(137–309 chars vs ~155–160 typical SERP truncation), and the personal-vs-client heading-convention split —
are prose / inclusion choices, not inconsistencies, and left unchanged.
**Rationale:** the fields are accurate distillations of the bodies, so there is nothing to reconcile;
churning phrasing or trimming summaries now earns nothing and costs process (lean-process, `DEC-000-7`).
Alternative that lost: editing the summaries for length/uniformity this conv. (Confirms per-case SEO is only
`title` + `summary`; JSON-LD is global, not per-case.)
**Consequences:** no case files changed by the audit. The meta-description-length observation stays on
record (this conv's record + `RESUME-STATE.md`) for a future SEO pass to revisit; deliberately **not**
promoted to a board row, per the operator's ruling.

### DEC-026-2 — Named-client / spiritual-theme cases use a pipeline diagram, not a product screenshot
**Decision:** The two public Center-for-Unity cases (`discover-jesus`, `discover-the-ub`) take a line-art
pipeline SVG in the aside (`hideMockup: true` + `diagram: "<slug>"`), not a screenshot of the live site.
**Rationale:** the case's point is Fraser's technical contribution — the machinery — not the client's
spiritual content; a screenshot would foreground the content that was *not* his work, and two
spiritual-themed screenshots would skew the portfolio's impression of what he does. The "it's real" proof a
screenshot would give is already carried by the "Visit the live site" button (`liveUrl`). Alternative that
lost: an operator-supplied live-site screenshot (the route `redline` uses). The operator raised the
portfolio-balance concern; the model agreed on the added ground that the diagram shows the machinery, not
the message.
**Consequences:** two new sanitised SVGs (`src/diagrams/discover-jesus.svg`, `discover-the-ub.svg`); both
cases leave the owed-screenshot set in `[CASE-MOCKUPS]`, and with them every Work case now fills its aside
slot (screenshot / system-map SVG / pipeline diagram) — no placeholder box remains anywhere.

### DEC-026-1 — A case study presents only Fraser's actual contribution; others' content is attributed to them
**Decision:** The `discover-jesus` and `discover-the-ub` cases were reframed so the writing, editing,
reading-levels, images, and (DTUB) the entire AI-written corpus are attributed to the client's team/editor,
and Fraser's case text claims only the technical pipeline + the site build. Prior framing that implied he
shared in the writing or used AI *on the content* was dropped; where AI genuinely contributed (the site
builds) it is located precisely — DJ ≈95% of the web-app rebuild, DTUB the entire Astro site.
**Rationale:** the site's honesty/humility frame (`DEC-000-6`, `DEC-010-2`) — a case must not imply
authorship of content Fraser did not produce, and for an AI-steering site, naming *where* AI was actually
used is more credible than a vague "AI-assisted" claim. Alternative that lost: the earlier gleaned framing
("extended with AI", "AI content generation", "157 automation scripts", React-as-authored), which was partly
inaccurate. Establishes the pattern for future client cases where Fraser's role is downstream / technical.
**Consequences:** both cases' bodies + frontmatter + aside rewritten and committed (`5228216`, `b47bee2`);
the technical-role framing is now the house default for a case built on content Fraser did not author.

## Conv 025

### DEC-025-2 — A record's audit is the AI's independent read, kept verbatim — the operator does not edit its findings
**Decision:** When a "The record" audit is refreshed, its findings — including unflattering ones (a
fabricated-transcript miss; a sibling case page that frames work ahead of its build) — are kept exactly as
the independent read produced them. The operator ruled **keep all three** of the sharpest debits on the
explicit ground that the audit is the AI's point of view, not his to adjust.
**Rationale:** The feature's whole credibility is that the read is independent and candid (`DEC-009-4`); an
operator who edits the findings to flatter himself destroys exactly that, and keeping the misses in print —
on the page that sells "check my work" — is the strongest trust signal available. Alternative that lost:
softening or cutting the sharpest debit (the fps framing-ahead-of-build admission), which was more
comfortable but would have made the "unedited independent audit" label untrue. Refines `DEC-009-4`.
**Consequences:** the refreshed `this-site` transcript and its on-page summary both carry the misses
verbatim. Live downstream: the audit now states publicly that the fps case overstates its build state
(`DEC-020-3`) — ruled acceptable this conv (hopper item dropped), so the admission stands unless the fps
prose is reconciled before go-live. Format-only normalization (stripping two internal `[checked:]`
provenance tags from the subagent output) is not a findings edit and is permitted.

### DEC-025-1 — `currentAsOf` record-currency field, distinct from `reviewed`
**Decision:** Add a required `currentAsOf` ISO-date field to the `record` collection schema, stamped on
every record. It records when a record was last **assessed current** — a date that advances even when the
audit body is unchanged — as opposed to `reviewed`, which dates when the audit was **authored**. On
refreshing `this-site` both equal 2026-11-04; the four records whose projects are complete or on hiatus
(SPT, Peerloop, fps, redline) are stamped 2026-11-04 as "assessed and held current" with no content change.
**Rationale:** a completed or paused project's audit still goes stale, because the **auditing model changes
over time** and its assessment may shift even when the project does not — so currency must be tracked
independently of both audit authorship and project activity (operator's own rationale). Alternatives that
lost: reusing `reviewed` (conflates authorship with currency); naming the field `refreshed` (reads oddly
when nothing was refreshed — `currentAsOf` reads true for the held-current case); leaving staleness
untracked (the Conv-014→025 drift on `this-site` went unnoticed for eleven convs).
**Consequences:** `src/content.config.ts` gains `currentAsOf: z.string()`; all five records carry it; it is
operator-facing (no page renders it — the record CTA still shows `reviewed`). A `currentAsOf` trailing well
behind today is the staleness signal, marking a record due for re-assessment. Narrowed `[CASE-RECORD-REFRESH]`
to `this-site` (done this conv); the four exempt records rely on `currentAsOf` for future reassessment.

## Conv 024

### DEC-024-2 — Optional `segmentTable` caseExtras render type (segment→sections HTML table)
**Decision:** A new optional `segmentTable` field on the `caseExtras` schema — an ordered array of
`{ segment, sections[] }` — rendered by `CaseExtras` as an HTML table in the case aside, in place of a
diagram. Presence of the field is the switch, handled uniformly for every case; a case gives it the aside
slot by omitting `diagram` and setting `hideMockup: true`. `translation-platform` (SPT) is the first
adopter: a generalized, de-identified segment→sections view of its pipeline (7 segments / 40 sections),
replacing its flow diagram.
**Rationale:** The operator wanted SPT's internal status table (a section × mode grid, from `spt-docs`)
on the case page, but *generalized* — the full mode/readiness grid over-exposed a confidential engagement's
internals and was too large for the aside. Reduced to segment + section names only (de-id safe: generic
engineering + public-metric terms, no language/source/client identity). Chosen as a **structured data field
rendered to HTML** (durable, matches the data-driven caseExtras pattern, no raw-HTML injection or de-id
leak) and as a **reusable optional render type** (uniform across cases). Alternatives that lost: an SVG
flow diagram (drawn as the real figure this conv, then removed — the table served the breakdown better);
raw HTML string in the JSON (less durable, de-id risk); a per-slug template conditional (not reusable).
**Consequences:** schema gains `segmentTable?`; `CaseExtras` renders `.case-segtable`; `work/[slug].astro`
passes it through; `global.css` adds the styles; `src/data/README.md` documents it. SPT drops `diagram`,
sets `hideMockup: true`, carries the table; `src/diagrams/translation-platform.svg` was deleted. Verified
rendering in-browser (light + dark). Any case can adopt the pattern the same way.

### DEC-024-1 — Claude Code is the sole editor of file content; the operator never edits files directly
**Decision:** Claude Code makes every change to file content. The operator never edits files directly;
instead the operator conveys changes in prose and Claude Code applies them. "Section by section" is a
collaborative cadence, not solo work: usually Claude presents a section and the operator corrects or
replaces it in words, but the operator may also hand Claude a section (e.g. a paste) to change without
Claude presenting it first. Either way, Claude makes the edit.
**Rationale:** If the operator edited files directly, Claude would have to infer what changed from a diff —
lossy and error-prone. A single editor keeps every change intentional and attributable and keeps Claude's
in-context view of each file authoritative between pulls. The word "manually" from the operator means this
collaborative cadence, **not** "the operator edits the file." Alternative that lost: operator edits directly
and Claude reconciles from diffs (the inference cost the operator is explicitly avoiding).
**Consequences:** Within a conv, Claude's edits are the sole source of file change; Claude re-reads from disk
only after external changes (e.g. a pull). Operator instructions that sound like self-editing ("I'll tune
this", "manually") are read as "I'll dictate the change for you to apply." Also stated as a rule in
CLAUDE.md under "Interaction model" (operator call, this conv).

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
