# CURRENT-TASKS — fgw

**This file is the durable board state — CURRENT work only.** Keyed by `[CODE]` mnemonic (the sole
stable id; readable, hyphenated). One file, all sections (`DEC-000-4`); format from `fps-docs`
(`DEC-007-1`).

🔴 **Done work is not archived here (`DEC-000-7`, lean).** When a task completes, its row is deleted and
it drops to the one-line **✅ Completed tags** list at the bottom — the full record lives in the commit
messages, `DECISIONS.md` (`DEC-NNN-N`), and the per-conv records in `docs/convs/`. The board shows what
is **live**, not what is finished.

> **The board vs. the hopper.** [`HOPPER.md`](HOPPER.md) is spin-off capture — subject to scrutiny, not a
> commitment. A row here is a commitment. Hopper items are ruled at `/r-hopper` / `/r-end`.

---

## 🔥 Ordered

> 🎉 **Launch milestone done** — `[SITE-GO-LIVE]` ✅ Conv 032; the Conv-007 critical path is complete.
> **Post-launch presence thread** (added Conv 035): `[SOCIAL-MAKEOVER]` is now **✅ done** (LinkedIn Conv 036,
> X.com Conv 037). The two rows below remain: the standing **GSC monitor**, and the **posting plan** (now
> unblocked by the makeovers). Order as the operator listed them. **Conv 057:** the **guides-only launch
> (Phase 2) SHIPPED** — the 3 cornerstone guides are **live on frasergorrie.com** (`CONTENT_HOME_LIVE`
> flipped, `[PROD-DEPLOY-BAN]` lifted, `/blog` → `/guides/`, `[SITE-CONTENT-HOME]` retired). The writing
> stream stays dark behind the new `WRITING_LIVE` flag → `[WRITING-BUILDOUT]` (Unordered). So the two rows
> below (GSC monitor + posting plan) are again what remains ordered — the posting plan is now unblocked by
> live guides to point at. **Conv 058:** the launch's **cross-pillar lead post is LIVE on LinkedIn**
> (`guides-launch`, 2026-11-23). Social-post machinery built (`POST-CREATE`/`POST-REVIEW`/`r-post`); the
> `/guides/` og:image + on-page pillar triangle deployed (fgw-26 `00ab7d50`); the post dossier graduated to
> `docs/content/posts/guides-launch.md`. Per-pillar follow-ons (Trust → Steering → Deciding) are seeds in
> `content-backlog.md`.

### [GOOGLE-SERVICES] · added Conv 035 · standing GSC monitor (initial alignment ✅ Conv 035)
✅ **Initial alignment done Conv 035** (via Chrome, operator's GSC session): submitted the correct
`sitemap-index.xml` (Success, 22 URLs); removed the broken legacy `sitemap.xml`; requested homepage
re-crawl; confirmed verified ownership / valid robots / HTTPS / **no manual actions** / AI "Include";
linked **GA4 ↔ Search Console**. Two owners (`EsoxAmericanusVermiculatus` + Fraser) + their two DNS
verification tokens confirmed legit by the operator — left untouched.
🔁 **Standing check — every 9 convs (changed Conv 050 from every-3; next Conv 59; Conv-50 check skipped — prior check effectively current):** review Search Console for (a) any new
concerns/errors raised, and (b) how far the crawl/indexing of the 22 URLs has progressed. Keep this row
open; CC drives via Chrome with the operator's GSC session. ⏰ Surfaced automatically at `/r-start` by the
cadence mechanism (`DEC-035-4`, built Conv 035).
🔴 **Method — operator-set Conv 044 (do this EVERY check, not just a health scan):** on the Pages report
switch the filter to **All submitted pages** (drops the self-healing old-path 301 ghosts — do **not**
re-report them each time), treat **Nov 9** as the crawl floor (sitemap submitted Nov 8, so only Nov-9+
crawls count as real), and report **exactly which real pages have been crawled and when**, **which have
issues**, and **what to do** about each. The operator reads bare GSC as "a confusing mess" — the job is
to filter it down to a current-pages answer, not to relay GSC's mixed all-known-pages view.
✅ **Conv 41 check (cadence):** no new concerns — manual actions none, security none, HTTPS clean, sitemap
Success (22 discovered, read Nov 10). Indexing early but healthy: of the 22 real pages only **3 indexed**
(`/`, `/work/`, `/privacy/`); the core pages (`/about/`, `/method/`, `/phases/`, `/contact/`, `/faq/`,
`/history/`, `/testimonials/`, work cases) are discovered-but-not-yet-crawled (expected lag, new
low-authority site). Old-site paths (`/services/`, `/ai-coaching/`, `/how-i-work/`, `/terms/`) linger as
stale "indexed" entries that now 301 (verified live) — self-heal on re-crawl. GSC "All known pages"
filter chevron is non-functional (GSC-side glitch). Next cadence ~Conv 44.
🔴 **Conv 44 check (cadence) — filtered to submitted pages (operator-directed; `DEC` at /r-end):** no new
concerns (manual actions none, security none, sitemap `sitemap-index.xml` Success, re-read Nov 13, 22
discovered). **Real-page indexing has NOT materially moved since Conv 41** — the all-known count rose 3→7
but all four new "indexed" entries are old-path 301 ghosts (`/services/ /ai-coaching/ /how-i-work/ /terms/`,
live-verified 301→`/work/ /work/ /method/ /privacy/`, serving no old content — harmless, self-healing).
**Filtered to the 22 submitted pages: 3 indexed, 19 not (2 reasons).**
- **Indexed (3):** `/` (Nov 9), `/work/` (Nov 9), `/privacy/` (Nov 8) — same 3 as Conv 41.
- **Crawled, not indexed (1):** `/testimonials/` — last crawled **Sep 28** (stale, *pre-submission*; Google
  declined, not re-fetched since). The one real "issue" page.
- **Discovered, never crawled (18, all Last-crawled N/A):** 6 core (`/about/ /contact/ /faq/ /history/
  /method/ /phases/`) + 12 work (`/work/` cases + `/record` for discover-jesus, discover-the-ub,
  learning-marketplace, personal-productivity-app, redline, this-site, translation-platform).
**What to do (operator's call):** the 18 have been *discovered via sitemap but never crawled* — normal
crawl-budget lag for a new low-authority site; the lever is **URL Inspection → Request indexing** on the
priority pages (`/about/ /method/ /phases/ /contact/` first) to push them into the crawl queue, + re-request
`/testimonials/` to force a fresh post-submission crawl. (Not done this check — pending operator direction.)
The "All submitted pages" filter works fine now (the Conv-41 chevron glitch didn't recur). Next cadence ~Conv 47.
🔁 **Request-indexing log (operator-directed Conv 044 — track each push + whether it took):** manual
URL-Inspection → Request indexing pushes a URL into a priority crawl queue (quota ~10/day; re-submitting
doesn't change queue position). **At every future check, verify whether the pages below actually got
crawled/indexed after their request — that's how we judge if the push worked.**
- **2026-11-16 (Conv 044):** requested `/about/`, `/method/`, `/phases/`, `/contact/` (core, never-crawled)
  + re-requested `/testimonials/` (was Crawled-not-indexed, Sep 28, Google declined). All 5 accepted into
  the priority queue. ⬜ *Next GSC check (now Conv 59, cadence → every-9 `DEC-050-1`): check which of these 5
  moved to Indexed / got a fresh crawl date — pending since the request (the Conv-47 and Conv-50 checks were skipped).*
- **2026-11-23 (Conv 057) — guides-only launch:** 4 new guide URLs went live + entered the sitemap
  (`/guides/` + the 3 cornerstone slugs). ⬜ *At the Conv-59 check, verify Google has discovered/crawled
  them; consider Request-indexing the 4 to speed the first crawl (quota permitting). `/writing/` stays
  `noindex` + off-sitemap by design (`WRITING_LIVE` dark) — do not expect or chase its indexing.*
⚠️ **Gotcha (Conv 044, resolved in-session):** Request-indexing runs a live fetch first; it can flake with
**"Page fetch — Failed: Server connection error" → request rejected** even when the page is perfectly
healthy (verified `/method/` served HTTP 200 / 20KB via curl at the same moment). **Fix:** re-run the live
test (↻) until it goes green, then Request indexing. Likely transient rate-limiting from rapid back-to-back
live probes — space them out. Don't mistake this for a real page problem.

### [POSTING-PLAN] · added Conv 035 · run the X + LinkedIn posting cadence (plan ✅ Conv 038)
✅ **Plan stood up Conv 038** — the full channel/funnel strategy lives in `reference/CHANNELS.md` (funnel,
channel roles, cadence, pillars, sourcing/workflow, content home, copy conventions). Buyer-facing **X pinned
post** done (Conv 038). 🔁 **Standing work:** run the **biweekly LinkedIn** cadence (opportunistic X echo),
drafting per the pillars — CC drafts → operator approves → publish (write-once-then-distribute). Posts point
to the **live guides** (`/guides/`, live Conv 057).
🚀 **Conv 058 — launch lead LIVE.** The cross-pillar launch lead (`guides-launch`) is **posted on LinkedIn**
(2026-11-23) via the new social-post machinery (`POST-CREATE`/`POST-REVIEW`/`r-post`; `DEC-058-1`) + the
one-link/website-only funnel (`DEC-058-2`). Remaining cadence: the **per-pillar follow-ons** (Trust →
Steering → Deciding) — seeds in `_cc/content-backlog.md`, run via `/r-post` when wanted; outcomes via
`[CONTENT-ANALYTICS]`.
📎 **GEO answer-structuring (folded in Conv 036):** as content gets built, structure it so generative
engines can lift clean answers — TL;DR / direct-answer blocks under key H2s, consistent entity naming
(a content-shaping guideline; vendor "30–40% citation gain" figures unverified).

---

## 📋 Unordered

### [CONTENT-ANALYTICS] · added Conv 058 · standing content-outcomes monitor (posts + articles/guides)
🔁 **Standing cadence — rides the 9-conv GSC sweep (`[GOOGLE-SERVICES]`; next Conv 59).** A content-outcomes
pass: update each recent post's / article's **Outcomes** section + the rollup (`_cc/content-analytics.md`).
**Method + capture set:** `_cc/content-analytics.md`. Qualitative-first (CHANNELS "Measurement"); **likes/
reactions tracked as an early-phase readership proxy** (operator Conv 058 — a weak "was it read" signal,
revisit later). Data: GA4 + GSC (site content, linked Conv 035); LinkedIn/X native post analytics via Chrome
(operator session).
📌 **Piggybacked on the GSC cadence** — not separately surfaced at `/r-start`. If independent surfacing is
wanted later, add a cadence entry to the r-start mechanism (`DEC-035-4`).

### [WRITING-BUILDOUT] · promoted Conv 057 · build out real articles + re-enable the writing stream
Deferred by the **guides-only launch** (`DEC-056-3`, shipped Conv 057): the site went live with the 3
cornerstone guides while the dated writing stream stays dark behind the new **`WRITING_LIVE`** flag
(`consts.ts`, default `false`). This row is the **separate, later** buildout. Covers:
- **Write the first real article(s)** — a whole content effort (per `reference/CHANNELS.md` pillars;
  CC drafts → operator approves).
- **Flip `WRITING_LIVE = true`** (`consts.ts`) — one switch re-enables everything writing: the
  "Latest writing" stream on `/guides/`, the `/writing/` hub + `/writing/<slug>/` pages (drops their
  `noindex`, adds them to the sitemap), and the footer "Writing" link.
- **Re-point `[BLOG-REDIRECT]` if desired** — `/blog` currently 301s to `/guides/` (Conv 057); consider
  re-pointing to `/writing/` once the writing stream is live, if that becomes the better home.
🔴 Gated behind `WRITING_LIVE` (`consts.ts`). Origin: Conv 056 hopper, promoted Conv 057.

### [CASE-RECORD-SIGNOFF] · promoted Conv 014 · sign-off ✅ Conv 030 (row stays for the standing masking guard)
✅ Sign-off complete (operator + clients checked both `/record` artifacts, no changes).
🔴 **Standing masking guard (why the row stays) — current as of Conv 034 (`DEC-034-1`):** the AI-era
testimonials are **live** (`showAiTestimonials = true`; `DEC-029-5`). **Gabriel's** testimonial runs under a
deliberate **testimonial-only naming exception**: it names **Gabriel + the Center for Unity** — he gave a
real, signed-off quote and cleared being named. The exception reaches no further than the testimonial text;
everything else the mask protects still holds:
- the `translation-platform` **case** stays de-identified (`DEC-023-3`) — no client, no source text, no target language on it;
- **no case-study link** sits on the testimonial — nothing may bridge the named quote to the de-identified case;
- the **target language is never named** anywhere;
- `discover-jesus` / `discover-the-ub` are unchanged.
**Brian** (marketplace) is unconstrained.
🔴 **Restore mechanism (if a real, signed-off testimonial later arrives):** add it to
`src/data/testimonials.json` and set `showAiTestimonials = true` in `index.astro` + `testimonials.astro`
to restore the suppressed sections + two-group lede (`DEC-029-5`); the masking guard above applies before
it renders. (Moved here Conv 032 from the retired `[SITE-GO-LIVE]` row.)
🔴 **Case → project mapping (lives here, never in the `fgw-26` site source):** `translation-platform` =
the translation-system/SPT engagement — client **The Center for Unity**, source text the **Urantia Book**
(the *same* client named publicly in the two Urantia cases, which is what the masking guard protects);
`learning-marketplace` = the **Peerloop** engagement.

### [SITE-TOOLS] · parked Conv 012
A dedicated tools page/surface — **parked.** The operator's summative tools statement already ships on
home (the "Tooling" section); a standalone page didn't earn its place ("not sure it will stand the test of
time; individual projects give a taste"). Seeded by the per-case **Built with** chips. Revisit only if a
fuller tools surface earns it.

### [SITE-TRAILING-SLASH-LINKS] · added Conv 037 · stop internal links bouncing through the trailing-slash 307
**Decision made Conv 037 (operator):** keep the **trailing-slash** URL form (the site is already built,
canonicalised, and GSC-indexed on it — the smaller ripple; `DEC` at /r-end) and fix the **internal links**,
which are written *without* slashes (`href="/about"`) while pages serve at `/about/`, so every direct nav
hits a 307 → `/about/`. Google says trailing-slash vs not is a consistency/taste call, neither better.
**Scope (enumerated Conv 037 — ~42 links / 13 files):**
- **33 static `href="/page"` literals** (+ `/`): `Footer.astro` ×8, `index.astro` ×5 (incl.
  `/testimonials#gabriel-rymberg` → `/testimonials/#…`), `history.astro` ×3, `testimonials.astro` ×3,
  `work/index.astro` ×3, `work/[slug].astro` ×3, `about.astro` ×2, `method.astro` ×2, `faq.astro` ×2,
  `phases.astro` ×1, `privacy.astro` ×1.
- **5 nav links** — `Nav.astro` `links` array (`/work` `/method` `/phases` `/about` `/contact`).
  ⚠️ **Re-count before doing (Conv 039):** the nav/footer changed — Nav dropped "Home" and added `/guides/`
  (already slashed); Footer added `/guides/` `/writing/` `/phases/` (already slashed) and the Guides/Writing
  links are flag-gated. The Conv-037 enumeration above predates this; re-derive the exact non-slashed-link
  list when this row is worked.
- **3 dynamic case links** — `/work/${id}`, `/work/${id}/record`, record→case back-link.
- **1 markdown cross-link** — `content/work/discover-the-ub.md` (`/work/discover-jesus`).
- **Leave alone:** assets (favicons, og-image), `mailto:`, external live URLs, auto-gen canonical, root `/`,
  `/llms.txt` (Conv 033 already slash-correct). `Nav.astro` `isCurrent` uses `startsWith` → stays correct.
- **After edits:** rebuild + prod redeploy + **verify by crawling internal links for any remaining 307s**.
- ⚠️ **Standing habit once done:** every *new* internal link must include the trailing slash (consider a
  lint rule / a link helper so it doesn't regress).
**Benefit is minor** (removes one ~tens-of-ms redirect hop on direct loads; ClientRouter already does many
navs client-side) — hence boarded, not rushed.

### [SITE-HSTS] · promoted Conv 033 · security hardening, low priority
The live apex sends no `Strict-Transport-Security` header. HSTS would close the window where an on-path
attacker (same network as the visitor) intercepts the *first* plain-HTTP request and SSL-strips it before
the HTTP→HTTPS redirect. (Promoted Conv 033 from the hopper.)
**Likelihood: low for this site.** Static marketing site — no login, no sessions, no accounts; the only
user data in motion is a contact-form name/email/message, already sent over HTTPS. The attack needs an
attacker already positioned as MITM on the visitor's network and only touches the unprotected first
request; browsers increasingly default to HTTPS-first. The gain is marginal hardening — HSTS's real value
is for authenticated / sensitive-transaction sites, which this is not.
🔴 **If enabled, do it deliberately (hard to reverse):** start with a short `max-age` (~1 day), **no**
`includeSubDomains` / `preload` initially, ramp up only once confident — a browser that has cached a long
`max-age` stays pinned to HTTPS for that whole window even if HTTPS later breaks, with no HTTP fallback.
Routes: Cloudflare dashboard → SSL/TLS → Edge Certificates → HSTS (operator action), or a worker response
header (code).

### [SITE-CSP] · promoted Conv 035 · Content-Security-Policy (security hardening)
Add a **hash-based** CSP (static site → hashes, not nonces) + `frame-ancestors` (keep `X-Frame-Options`
for old browsers). Roll out **report-only first**, then enforce. Closes most XSS + clickjacking. Set via
the Cloudflare Worker response headers — same home as `[SITE-HSTS]`, so likely do them together.
(Promoted Conv 035 from the web-2026 research hopper.)

### [SITE-STRUCTURED-DATA] · promoted Conv 035 · JSON-LD structured data (SEO + GEO)
Add/expand JSON-LD: `Person` / `Organization` / `WebSite` + per-project `CreativeWork` + breadcrumbs, via
`@graph` with cross-ref `@id`s; validate with Rich Results Test. 🔗 **Overlaps `[AGENT-PROFILE]`**
(`AGENT-DISCOVERABILITY.md` §9 — the public `Person` profile with geo/lang/tz) — likely merge or sequence
together. (Promoted Conv 035.)
📎 **Geography reconcile — ✅ done Conv 037:** `areaServed` updated to `["United States","Canada","Europe"]`
(`Layout.astro`), matching the Conv-037 "US, Canada and Europe" copy edits. (The broader JSON-LD expansion
above is still the open work.)
📎 **Content authorship carrier (Conv 041 policy, `DEC-041-2`):** content pieces are **byline-less
on-page** by decision, so the author signal is carried **here** — add `author` (`Person`, → `/about/`) to the
per-post `Article`/`CreativeWork` JSON-LD, plus `datePublished`/`dateModified` from the blog `pubDate`/
`updatedDate` fields (added Conv 041). This is the agreed home for attribution; don't add a visible byline.
✅ **Per-piece JSON-LD built Conv 043 (`DEC-043-3`):** `Article` (guides, undated) + `BlogPosting` (blog,
dated) + `BreadcrumbList` + `FAQPage` (Q&A **auto-extracted** from each page's `?`-ending H2s; a lead-in
answer that opens on a colon reads on to the next H2 so the lift is complete, with no reshaping of the
prose). Built as a reusable `components/ArticleJsonLd.astro` + `lib/articleJsonLd.ts`, emitted in the
detail-page `slot="head"`. `author`/`publisher` reuse the site `#fraser`/`#meristics` nodes by `@id`
(satisfies the carrier above). **Remaining:** the broader site-wide expansion (`WebSite`, per-project
`CreativeWork`); point the author `@id`'s `url` at `/about/` (currently home — minor); external Rich-Results
validation — **now actionable (Conv 057):** the 3 guides are live + crawlable on `frasergorrie.com`, so
run the per-piece `Article`/`FAQPage`/`BreadcrumbList` through the Rich Results Test.

### [GUIDE-PLANNING] · promoted Conv 046 · write the PLANNING guide (folds in the need/discovery gap)
A new cornerstone-style guide (promoted from the hopper Conv 046; origin: Conv 044 need/mean split
`DEC-044-1` + Conv 045 planning fold-in `DEC-045-3`). **Thesis:** you can't fully pre-specify complex
custom software up front — the AI fills the gaps on its own, so plan *good-enough* (outcomes + solid
starting points, not a perfect PRD), then steer. **Discovery-gap strand:** you can't pre-specify what
you'll actually use; it stays partly unvoiced even to you and surfaces as you build and react ("no, not
that") — the skill is **recognition, not articulation**. **Seeds** already in the Steering draft (the
notebook, "sits wrong with you") belong here. Steering **foreshadows** it (the "Don't I just need a
better plan?" section, `DEC-045-3`). 🔗 **On ship:** wire the forward-link from Steering's planning
paragraph to this guide. Part of the `[SITE-CONTENT-HOME]` content set — same dark/draft → flip gating +
`[PROD-DEPLOY-BAN]`.

### [PILLAR-ROADMAP] · promoted Conv 047 · the evergreen guide-pillar pipeline (guide = pillar, `DEC-047-6`)
The pipeline of cornerstone **guide-pillars** beyond the first three (Trusting ✅ dossier, Steering ✅
dossier (graduated Conv 048), Deciding ⬜). Each new guide **IS a pillar**: extend `pillars.ts` (`Pillar` enum +
`PILLAR_META` label / blurb / order / **colour**) + a `/guides/` hub slot, then run create→image→finalize
(`/r-content` scaffolds the dossier).
🔤 **Pillar labels are gerunds** (operator, Conv 047 — matches Trusting / Steering / Deciding; the label is
the user-facing gerund, the internal `pillars.ts` key stays a short slug).
**Pipeline (Conv 047):**
- **Planning** — already a row, `[GUIDE-PLANNING]` (need / discovery + planning gap).
- **Documenting** — keeping track of what you did, why you did it, what you learned; tasks and processing.
- **Creating Skills** — writing them, using them, extending them.
- **Creating Subagents** — when to use them.
- **Testing** — scope TBD.
- **Reviewing** — when a project gets big enough that you can't remember how it all works.
- **Rewriting** — knowing when to rewrite what you've already built.
Each gets a **colour** (feeds `[PILLAR-DIAGRAM]`). Promote a topic to its own active row (via `/r-content`)
as it's started. All dark/draft → flip gating + `[PROD-DEPLOY-BAN]`.
🎨 **Pillar-colour system built Conv 051 (`DEC-051-2`):** muted full-spectrum categorical colours, each a
`--pillar-<key>` fill token + `--pillar-<key>-strong` text-safe variant (light-dark pairs) exposed via
`PILLAR_META.color`/`.colorStrong`; validated for colourblind-separation (dataviz). **First 3 live**
(trust terracotta / steering teal / deciding plum). Each new pillar adds its own validated pair as it ships.

### [PILLAR-DIAGRAM] · promoted Conv 047 · interactive pillar map (coloured circles + hoverable connections)
An interactive diagram of the pillar set that shows a user how the pillars relate: coloured **circles =
pillars**, clickable → the pillar's guide; **lines = interrelations**, hoverable to reveal how the two
pillars connect. **Needs:** (1) ✅ **a colour per pillar — done for the 3 live pillars Conv 051**
(`DEC-051-2`; the diagram reuses `PILLAR_META.color` → `--pillar-<key>`, already validated both themes);
later pillars add theirs as they ship; (2) the **pairwise "how they relate"
content** — a one-line connection per linked pair (a content task); (3) the **interactive build** — inline
SVG + JS (clickable circles, hoverable lines), on the `/guides/` hub or a dedicated page, legible in both
themes. Operator-planned; benefits from the pillar colours being set first.
✅ **v1 static figure shipped Conv 058** — the `/guides/` hub hero carries a static, theme-aware inline-SVG
triangle (three pillar-coloured circles + connectors, inside knockout labels, AA both themes). The
**interactive** build (clickable circles → guides, hoverable relation lines) is the remaining work.

### [CONTENT-ART] · promoted Conv 042 · guide/article illustration programme
🎨 **Approach settled Conv 042** (full reasoning + recipes: `_cc/content-art-and-copyright.md`): per-guide/
article imagery from **public-domain natural-history line engravings** (not photos, not AI — a naturalist's
plate already does the diagnostic interpretation that tracing a photo can't), cleaned as a raster engraving,
a **square detail tile** in-page + a **full-plate colophon** at the foot (species name + PD credit). No
light/dark theming (fixed background). O'Reilly is loose inspiration only — a trade-dress watch-item
(software + woodcut animals is their niche); copyright is clean (same PD well, the original plate not their
redraw).
🏗️ **Built Conv 042:** the `images` content collection + central Zod schema (co-located `provenance.json`
per `src/content/images/<id>/`, one source → many kept treatments, folder = id); first image
**`conus-marmoreus-lister`** (Lister *Conus marmoreus*, PD) with `square` + `colophon` treatments + source;
`guides` schema `image` ref; **Trust guide wired + rendering** (verified in dev). Storage = single-repo
co-located (`DEC-042-2`; rejected the docs/site split — cross-repo duplication outweighs a leaner build).
🔜 **Remaining:** image for the **Deciding** guide (Steering ✅ `stella-marina-linck` Conv 047 — its square
tile now also marks the Steering `/guides/` hub card, Conv 048); articles as they land; more
treatments/alternates as chosen; operator selects further subjects (own PD photos possible later). Part of
what the `[SITE-CONTENT-HOME]` flip counts as "finalized".

### [IMAGE-PROVENANCE] · promoted Conv 042 · provenance + treatment + usage for ALL site images
🏗️ **Foundation built Conv 042** — the `images` content collection + central Zod schema (co-located
`provenance.json` per `src/content/images/<id>/`; see `[CONTENT-ART]` + `_cc/content-art-and-copyright.md`).
This row extends it site-wide.
🎯 **Goal:** *every* image on the site carries provenance + treatment history — not only the new guide/
article art but existing assets (work-case mockups/screenshots, diagrams, og-image, headshot, etc.).
🔧 **Three needs:**
- **A trigger / guard** so the ledger can't silently fall behind. Today it's manual discipline; the schema
  validates *structure* but nothing fails the build when an image asset has **no** provenance entry. Want a
  check (build step / pre-commit / `/r-end`) that flags any image not accounted for in a provenance record.
- **Backfill** existing site images into the model (one-time audit + entries).
- **Usage cross-reference** — a reliable way to know *where each image is used* (which pages). The per-
  treatment `usedOn` field is a manual start (drifts); better to derive/validate usage from content at
  build. Decide: hand-maintained `usedOn` vs a generated image→page map.
🔭 Design-heavy; sequence after the `[CONTENT-ART]` images are flowing.

### [SITE-CONSENT] · promoted Conv 035 · GA4 analytics consent decision (privacy/legal)
GA4 sets cookies → EU visitors likely need consent (cookieless ≠ consent-free; fingerprinting is the weak
point). Decide: a consent gate vs. switching to a genuinely cookieless analytics. A load-bearing
privacy/legal call, not a quick fix. (Promoted Conv 035.)

### [SITE-WCAG22] · promoted Conv 035 · WCAG 2.2 delta re-audit
Re-audit against the WCAG 2.2 deltas on top of the Conv-030 AA pass: focus-not-obscured (2.4.11),
target-size 24px (2.5.8), dragging alternatives (2.5.7). (Promoted Conv 035.)

### [EMAIL-AUTH] · promoted Conv 036 · DMARC/SPF hardening (deliverability + anti-spoof)
Email auth is partially set up: DKIM `resend._domainkey` verified ✓ (Conv 035), but **DMARC is `p=none`**
(monitor-only — spoofed mail is neither quarantined nor rejected) and there is **no apex SPF** TXT record.
Raise DMARC to at least `p=quarantine` and add/confirm SPF. 🔴 **Deliverability-sensitive, do it
deliberately (hard to reverse cleanly):** verify Resend's SPF/DKIM alignment *first* — tightening DMARC
before SPF+DKIM align on the From domain can start bouncing legitimate mail. A Cloudflare DNS change.
(Promoted Conv 036 from the hopper; verified Conv 035.)

### [SECURITY-TXT-RENEW] · promoted Conv 036 · renew security.txt Expires before 2027-11-08
`public/.well-known/security.txt` in fgw-26 (RFC 9116) carries `Expires: 2027-11-08`. **Not actionable
now** — the file stays valid until that date, at which point it flips to invalid (compliant scanners then
ignore the disclosure contact). No decay in between; it's a dated reminder, not live work. **Do before the
date:** bump `Expires` further out (and re-confirm the contact). (Promoted Conv 036 from the hopper.)

### [AGENT-INITIATIVE] · added Conv 045 · standing agent-discoverability action plan — re-weighed each `[AGENT-DISCOVERY-WATCH]`; act-point ~Conv 75–85
🧭 **Standing row (`[operator, Conv 055]`):** the living action plan for the agent-discoverability
initiative, **refreshed every `[AGENT-DISCOVERY-WATCH]`** (not a one-shot deferral). Each watch reconciles
its findings into this row; the full per-watch assessment ledger lives in `AGENT-DISCOVERABILITY.md` §10.
**Act-point ~20–30 convs out (~Conv 75–85, operator Conv 055)** — until then we hold and keep the read current.
🔁 **Conv 055 re-weigh (held — not acting yet):** gates unchanged (`[PROD-DEPLOY-BAN]` binds; Deciding → flip
stays the priority). When acting begins, the live candidates are the **Tier 1 keystone
`[DATA-PRIVATE-SCHEMA]`** (internal `src/data` refactor, ban-independent, prerequisite for everything
agent-facing) and the **Tier 3 manifest re-pin** (below). Build-now-ship-later vs blocked split: §10
Conv-055 assessment.
🔴 **Open caveat — the manifest bet is now the losing horse:** the Conv-055 watch confirms A2A **AgentCard**
(`/.well-known/agent-card.json`, signed cards v1.0) pulled ahead while **`ai-agent.json` faded**. Our L1
commitment to `ai-agent.json` (`AGENT-DISCOVERABILITY.md` §2/§5/§9) stays on-record as our stated bet
**until re-pinned** — it must not be inherited silently into any `[AGENT-PROFILE]` work. Re-pinning is a
ban-free docs edit, held per the act-horizon above.
✅ **Conv 045 (origin):** first watch + assessment (`DEC-045-1`); operator decided **start nothing now**;
candidate rows in §9, dispositions in §10. Next re-weigh: the **Conv 65** watch.

## ⏸️ Parked

_None._

---

## ✅ Completed (tags — full records in commits / `DECISIONS.md` / `docs/convs/`)

- **Conv 058:** **🚀 Launch lead post LIVE on LinkedIn** (`guides-launch`, cross-pillar; 2026-11-23; share
  card = the pillar triangle) + the social-post **rigor machinery** (`POST-CREATE`/`POST-REVIEW`/`r-post` +
  `content-backlog`), the **content-analytics** process (`[CONTENT-ANALYTICS]`, likes-as-early-proxy), the
  `/guides/` **pillar triangle** (og:image + on-page `[PILLAR-DIAGRAM]` v1, deployed `00ab7d50`), and the
  **funnel→website-only + one-link + no-video** conventions. CC drove the post via the Chrome bridge
  (standing authorization). Post dossier: `docs/content/posts/guides-launch.md`. (Full record: commits + DECs at /r-end.)

- **Conv 057:** **🚀 Guides-only content home LIVE on frasergorrie.com** (Version `b8abe635`;
  `[SITE-CONTENT-HOME]` retired, `[BLOG-REDIRECT]` + `[PROD-DEPLOY-BAN]` resolved). Split
  `CONTENT_HOME_LIVE` into two switches — flipped `CONTENT_HOME_LIVE = true` (the 3 cornerstone guides go
  live) and added `WRITING_LIVE = false` so the dated writing stream stays dark (hub stream suppressed,
  `/writing/` + slugs `noindex`/off-sitemap/off-footer); flipped the 3 guides to `draft:false` so prod
  generates them (hub + 3 slug pages, indexable, in sitemap). `/blog` → `/guides/` 301 (`DEC-056-3` lean).
  Added the FAQ `/guides/` on-ramp. Amended + lifted `[PROD-DEPLOY-BAN]` (dropped the "first blog page"
  clause for guides-only; `PROD_DEPLOY_BANNED=false`). `npm run verify` passed; every output + live check
  confirmed. `[WRITING-BUILDOUT]` promoted (real articles + `WRITING_LIVE` flip). 2 hopper items done
  (ban reconcile, FAQ on-ramp), 1 dropped (GUIDE-PLANNING fwd-link), 1 promoted (WRITING-BUILDOUT).
- **Conv 056:** **`[GUIDE-DECIDING]` graduated (3rd cornerstone) + `[DOSSIER-FORMAT]` codified.** Deciding
  finalize: step 11 (rendered read — operator declared guide + glossary perfect; §5 markers kept), step 13
  (**Bloch *Esox lucius* pike** colophon — sourced + viewed + duotone-treated + wired, the first
  hand-coloured plate in the set), step 15 (**3-cornerstone cross-link mesh** + Trust/Steering retrofit),
  step 16 (masking, clean), step 17 (**declared final**, matrix wording + card opener finalized, all
  `✎` markers stripped, **graduated** → `docs/content/build-it-yourself-or-bring-someone-in.md`, row
  retired). `[DOSSIER-FORMAT]`: 8-section graduated-dossier template codified into `GUIDE-REVIEW` step 17
  + `r-content`; pipeline learnings folded into `COLOPHON.md` + step 15. Also: 2 hopper-ruling fixes
  (`check-ab-options` quoting, `r-start` Step 6 two-A/B) + a CLAUDE.md `check-promises` parallel mention.
  Deciding held dark pending the guides-only flip (`CONTENT_HOME_LIVE` + `[PROD-DEPLOY-BAN]`).
- **Conv 055:** **Deciding finalize steps 4–14 (minus 11/13) + agent-discovery watch + a no-op-promise
  Stop hook** (content + process; `[GUIDE-DECIDING]` stays open). Deciding: glossary confirmed (4);
  headings (5) — **§6 reseated via a whole-section rewrite** (reframed off keep/rebuild/hand-off, which
  fought straw→tin→steel, to *push on / start over / get help* on a stalled risky part; heading "When my
  build stalls, do I push on, start over, or get help?"), #5 → "…learn the hard part myself…", #1/#3/#6
  left (context/bookend); entity over-seeding trim **5→3** (6); conjunction leave (7); metaphor audit +
  "Grinding"→"Pushing harder" (8); pull quote at the §6→§7 seam — "Bringing someone in doesn't replace
  your learning; it accelerates it" (10); **em-dashes recast to zero** (12); card opener reworked +
  snippet "leans on"→"relies on" (14). Still `draft:true`/dark. **[AGENT-DISCOVERY-WATCH]** ran (Conv-055
  landscape snapshot; three-part output codified; **[AGENT-INITIATIVE]** reframed into the standing
  re-weighed-each-watch action plan, **held**; act-point ~Conv 75–85). **check-promises.sh** no-op-promise
  Stop hook built, tested (14 cases), registered (`DEC-055-1`, `DEC-055-2`). 4 commits + this close; hopper
  2 carried.
- **Conv 054:** **Deciding redline finished (step 1) + new §7 + review-process additions** (content +
  process; `[GUIDE-DECIDING]` stays open). Block-by-block redline completed **P1→P32**: added **§7 "Can I
  really learn enough on my own when I reach my limit?"** (the self-path arm, loose-bound to `/phases/`; P16
  trimmed to hand off), reworked §5 (P17 → "Which phase of building with AI am I in?", P18 phases +
  unembraced-straw-man, P19 merged, P22 straw/tin/steel bridge + places→phases), bound **"the test"** to §4
  (P9), rewrote the §8 close ("then I'm happy", solid software). Finalize **step 2 (it-pass, clean bar P15)**
  + **step 3 (anecdote — dropped: self-serving at the CTA)** done. **Process:** two new `GUIDE-REVIEW` steps —
  **9 signature-phrase / AI-tell audit** (`DEC-054-2`, + the `VOICE.md` alternatives mechanism; applied:
  leans on→relies on, stand behind 4→1) and **15 cross-linking** (`DEC-054-3`, folds the 3-cornerstone
  interlink + the one-time Trust/Steering retrofit); the **markup-stripping rule** → step 1 (`DEC-054-1`).
  Hopper cleared (6 ruled). Two commits + this close.
- **Conv 053:** **Deciding §1–§4 redline + the §4 decision-matrix figure** (content; `[GUIDE-DECIDING]`
  stays open). Block-by-block redline of the second draft: Short answer ("as much of it yourself as you can
  stand behind"), home-repair para, the empowerment beat, **§3 reworked off the floor/ceiling metaphor** into
  plain entry-barrier framing + a **new "your reach keeps growing" paragraph** (growth throughline, §3 node),
  **§4 retitled** doubt-framed + entity-seated ("How do I find the parts of my AI-built software I'm unsure
  of?"), §4 lead-in recast with Understanding/Risk bullets. **Matrix** (`DEC-053-2`): the §4 2×2 rebuilt from
  a markdown table into a standalone styled-HTML **business figure** — `--font-sans`, green/red stop-go cells
  with coloured verdicts, named axes (Understanding × Risk), two-line scenario+question title, equal rows,
  theme-adaptive; built + screenshotted both themes (`.scratch/deciding-matrix-v6-light.jpg`). **Process:**
  heading FAQ/GEO-liftability scrutiny folded into `GUIDE-REVIEW` step 5 (`DEC-053-1`). Hopper: 1 carried
  (interlink).
- **Conv 052:** **Deciding guide — points round-trip + second draft** (content; `[GUIDE-DECIDING]` stays
  open). Operator's augmentation pass through `deciding-points.txt` (P2 capacity drop, P3 naive framing, P5
  pure-gold + candor relocation, P8 lead-in, P18 sharpening, P22 heading → "What do I keep, rebuild, or hand
  off?", P23 third option, P24 rewrite) + CC's four arc reinforcements; **second draft written** (whole-draft
  pass, build-clean, dark; GUIDE-CREATE step 6c) → awaiting operator whole-piece read. Title + SEO/GEO snippet
  reworked (title read as a before-you-start fork; snippet presupposed help). **Site/design:** sticky-together
  guide aside — image + glossary pin as one unit, `display:contents` on mobile (`DEC-052-2`); **colophon year**
  added to the image `source` schema + caption (`DEC-052-3`). **Process:** lint-hopper rule (`DEC-052-1`) + the
  one pre-existing eslint error fixed; the points round-trip is a breadcrumb/intent layer, not prose
  (`DEC-052-4`). Hopper: 1 done (lint), 1 carried (interlink).
- **Conv 051:** **Pillar identity colours + cornerstone card/guide-page colour UI** (no content-guide row
  shipped; design + process). **Colour system** (`DEC-051-2`): muted full-spectrum categorical colours
  (trust terracotta / steering teal / deciding plum), `--pillar-*` fill + `--pillar-*-strong` text tokens
  (light-dark pairs), `PILLAR_META.color`/`.colorStrong`, validated via dataviz both themes — closes the
  `[GUIDE-DECIDING]` Slot/colour item + advances `[PILLAR-ROADMAP]`/`[PILLAR-DIAGRAM]`. **Hub card**
  (`DEC-051-3`): 12px pillar left stripe (inset), stack breakpoint `sm`→`lg` (3-up ≥1024), art tile 2×
  (128px) below 1024 with the description wrapping in a left gutter, tile dropped to `bottom-4`. **Guide
  page** (`DEC-051-4`): 12px pillar bar beside the lede (the bold colour hit) + pillar-coloured eyebrow
  label; the subtle eyebrow-rule approach rejected. **Process:** retired `raised`/`flagged` from the
  go-list (`DEC-051-1`; `check-routing.sh` + CLAUDE.md, now 5 forms); reworked
  `/r-start` so carried findings are ruled one at a time, de-bundled from Step 6 (`DEC-051-5`). All site
  work dark behind the content-home flip + `[PROD-DEPLOY-BAN]`. Hopper: 1 done (r-start fix), 1 carried.
- **Conv 050:** **`/rfe` force-end verified + content-process method extended** (no board row shipped; recovery
  + process). Confirmed the Conv-049 `/rfe` force-end worked **end-to-end** (clean `/r-start`, no HALT, no
  work lost, conv history saved + jsonl drained clean, pushed clean); paid its deferred debt — distilled the
  Conv-049 decisions (`DEC-049-1..4`) + regenerated the digest; corrected the handoff's false "Deciding
  untouched" (the arc-A whole-draft rewrite `31ae6a9` was committed Conv 049). **GSC cadence** every-3 →
  **every-9** (`DEC-050-1`; Conv-50 check skipped, next Conv 59). **Content creation** gained **step 5
  coordinate view** + **step 6 point-form augmentation round-trip** (`DEC-050-2`): CC distills each paragraph
  faithfully → operator augments the bits (unbracketed; CC's own go in `[brackets]`) → CC writes the second
  draft; `*-view.txt` / `*-points.txt` conventions. Deciding is first through it — `deciding-view.txt` +
  faithful `deciding-points.txt` done, awaiting operator augmentation → second draft. Hopper: 1 done, 1 carried.
- **Conv 048:** **Steering guide finalized + graduated** — `[GUIDE-STEERING]` row retired. Ran the full
  `GUIDE-REVIEW` finalize pass (steps 2–15): default "it" = the AI (P20/P24 edits); P8 forty-years aside
  added; glossary/headings/entity/conjunctions clean; metaphor audit kept all (P29-S3 sense-vs-choose pair);
  pull-quote confirmed at P17; rendered-read fixes (P24 confident-nonsense inversion, P25 corner/rewrite);
  zero em-dashes; snippet reworked to seat "AI-built software"; **P31 masking-generalized** (dropped the
  video/screen-sharing + session recording/replay that sat adjacent to the learning-marketplace/Peerloop
  case); `✎` markers stripped; **declared final**. **Graduated** to
  `docs/content/steer-ai-to-build-what-you-mean.md` under a **richer dossier format** (per-step finalize
  record + piece-decision home; `DEC` at /r-end). Still dark behind the content-home flip +
  `[PROD-DEPLOY-BAN]`.
- **Conv 047:** **Content-piece lifecycle built + Steering closing redline & image** (plus routing-guard
  rework + drain fix). **Tooling:** `/r-end` dialogue-drain scoped so one conv's turns can't bleed into the
  next (`DEC-047-1`); **routing guard reworked** to a go-list review-signal + lapse-catcher hook (`DEC-047-2`
  — 9 `-ing`/`-ed` trigger words, the `🔎 Review` line, no git gate). **Content lifecycle:** new
  `reference/GUIDE-CREATE.md` (drafting pass) + `GUIDE-REVIEW.md` expanded to 15 steps (anecdote, pull-quote,
  colophon, metadata, masking, final review; on-arc check) + `COLOPHON.md` learnings; the **`r-content`
  skill** composes a per-piece **dossier**/checklist from the three docs live (`DEC-047-3`/`-5`/`-7`);
  **guide = pillar** (`DEC-047-6` — gerund labels, 10-pillar roadmap); the dossier **graduates** to
  `docs/content/<slug>.md` at sign-off (`DEC-047-8`). Retrofitted **Trusting** (graduated dossier) +
  **Steering** (`[GUIDE-STEERING]` in-flight dossier). **Steering:** closing section redlined (heading
  "…anyone's help?", claim/anecdote/takeaway split, best-customer close) + the **Linck sea-star image**
  (firm duotone tile + cropped duotone colophon + bounded-box colophon sizing standard). New rows
  `[GUIDE-STEERING]` · `[PILLAR-ROADMAP]` · `[PILLAR-DIAGRAM]`. GSC cadence skipped (done Conv 44). Hopper:
  2 verified-dropped + 2 content-ruled (earlier), then 2 promoted / 1 institutionalized / 1 carried.
- **Conv 046:** **Routing-guard enforcement + reference-repo trust-prompt fix** (no content-guide rows
  changed). Strengthened the CLAUDE.md Surfacing rule so routing/disposition vocabulary must be backed by
  a real artifact edit the same turn and a live caveat goes to the hopper — "surfaced inline" barred for
  an unresolved one (`DEC-046-1`, refines `DEC-008-2`); built + registered **`check-routing.sh`** Stop
  hook enforcing it (blocks exit 2 when a disposition phrase appears with a clean board), all five logic
  paths verified. Moved the **fg + frasergorrie** read-only reference repos to
  `permissions.additionalDirectories` + slimmed the `fgw` alias to `--add-dir ../fgw-26` (`DEC-046-2`) —
  stops the per-folder workspace-trust prompt `--add-dir` began showing in CC v2.1.325; verify next launch
  (carried). Promoted **`[GUIDE-PLANNING]`** (the need/discovery guide) from the hopper. Hopper: 1
  promoted, 1 dropped, 4 carried.
- **Conv 045:** **Steering redline — title/opening/steer-section + intuition beat** (`[SITE-CONTENT-HOME]`
  stays — prose unapproved, guide still dark/draft) and **agent-discoverability assessed + deferred**
  (`[AGENT-INITIATIVE]`, `DEC-045-1`: start nothing, revisit Conv 055). Steering: title last word
  `mean`→`meant` (`DEC-045-2`); card/snippet retuned; bridging pull-quote; Short answer + Paras 2/3 reworked
  (seat "AI-built software" entity, tense fix, italic coinage, "a skill you can learn"); P7 closer; Decide +
  confident-nonsense bullets (latter reframed around **intuition**, Steering's first literal use); new
  **"Don't I just need a better plan?"** section foreshadowing the **PLANNING guide** (`DEC-045-3`, folds in
  need/discovery); H2 nouns seated for FAQ-lift (H1/H4); record-keeping + intuition anecdotes (new
  `✎ ANECDOTE` token, `DEC-045-4`). Hopper: 4 carried.
- **Conv 044:** **`[GOOGLE-SERVICES]` Conv-44 GSC check + indexing push** (row stays — standing monitor) and
  **Steering need→mean revert** (`[SITE-CONTENT-HOME]` stays — prose unapproved). GSC filtered to submitted
  pages (operator-directed): **3/22 real pages indexed — the same 3 as Conv 41** (`/`, `/work/`, `/privacy/`);
  18 discovered-never-crawled + 1 crawled-not-indexed (`/testimonials/`); the all-known 3→7 rise was
  old-URL 301 ghosts (live-verified harmless). Health clean (manual actions/security none, sitemap Success,
  re-read Nov 13). **Pulled the lever:** manual Request-indexing on 4 core pages (`/about/ /method/ /phases/
  /contact/`) + re-request `/testimonials/` — all queued; logged for Conv-47 follow-up. Standing-check method
  expanded (`DEC-044-2`: submitted-pages filter + Nov-9 crawl floor + which-crawled-when + issues). Steering
  title reverted `need`→`mean` (`DEC-044-1`: "need"/discovery = a separate future guide). Hopper: 2 carried
  (Deciding "honest" reword, new "need"-guide idea).
- **Conv 043:** **`[SITE-CONTENT-HOME]` SEO/GEO structure + Steering first pass** (rows stay — guide prose
  unapproved). Content-art **image layout finalized** (`DEC-043-1`: two-column sticky aside, dark thin
  border, fixed 320px below 1024); hub cards retoned to one evoke-and-stop register + equalized to one
  height. **Card/snippet decoupling** (`DEC-043-2`): new `snippet` field feeds search/GEO meta while the
  card keeps the evocative `description`; authored per guide + extended to the blog. **Per-piece JSON-LD
  built** (`DEC-043-3`): `Article`/`BlogPosting` + `BreadcrumbList` + `FAQPage` with Q&A auto-extracted from
  on-page `?`-H2s (lead-in answers completed to the next H2), reusing the site `#fraser`/`#meristics` nodes;
  `ArticleJsonLd.astro` + `lib/articleJsonLd.ts`. **Entity naming** (`DEC-043-4`): "AI-built software"
  seated in Steering + Deciding (F1; F2/F3 rejected, Trust frozen). Steering **first editorial pass** +
  4-term glossary + `mean`→`need` title. Hopper: 1 promoted (flip-gate: strip `✎ OPTIONAL` markers), 2
  carried (Deciding "honest" reword, Steering need/mean).
- **Conv 042:** **`[CONTENT-ART]` + `[IMAGE-PROVENANCE]` foundation built** (new rows; programme ongoing).
  Settled the guide/article illustration approach (`DEC-042-1`): public-domain natural-history **line
  engravings** (not photos/AI — a naturalist's plate already does the diagnostic interpretation that tracing
  a photo can't), cleaned as a raster engraving, a **square detail tile** in-page + a **full-plate colophon**
  (species name + PD credit); text handled by cropping; gentle cleanup (a flat-field washed detail away,
  rejected); O'Reilly copyright clean, trade-dress a managed watch-item. Built the **image-provenance
  architecture** (`DEC-042-2`): `images` content collection + one central Zod schema, co-located
  `provenance.json` per `src/content/images/<id>/` (one source → many kept treatments; folder = id);
  single-repo co-located (rejected the docs/site split). First image **`conus-marmoreus-lister`** (Lister
  *Conus marmoreus*, PD) — `source` + `square` + `colophon`; `guides` `image` ref; **Trust guide wired +
  rendering** (verified in dev). Hopper: 2 promoted (`[CONTENT-ART]`, `[IMAGE-PROVENANCE]`), 1 dropped.
- **Conv 041:** **Trust rendered-read redline + prose-link + content-media policy + GSC check** (rows stay
  — content + flip pending). Operator read the Trust guide as a rendered page; **11 content edits** applied
  (hook lede with keyphrase, tightened opening, "prompt"→"directions you gave it", edge-case "them"
  disambiguation, "recognizable kinds", "When does checking end?" two-part test). **`DEC-041-1` prose-link
  styling unification** (`--link` token; `.prose a`↔`.text-link` → semibold, no underline; fixed a
  light-mode content link that was invisible against `--ink`). **`DEC-041-2` content-media policy**
  (byline-less → JSON-LD author; `pubDate` + optional `updatedDate`; optional `image()` hero as on-page
  adornment, og decoupled) — implemented + verified (blog schema, `writing/[slug]` render, `.prose img`).
  **`[GOOGLE-SERVICES]` cadence check** (Conv 41): no new concerns; 3/22 real pages indexed, rest
  discovered-and-queued (expected lag), old-path URLs self-healing. Hopper cleared (3 items: Trust read done,
  content-media ruled, flip steps folded to board).
- **Conv 040:** **`[SITE-CONTENT-HOME]` Trust guide redlined + glossary feature** (row stays — content +
  flip pending). Heavy operator-directed redline of `is-your-ai-built-software-sound.md` (`draft:true`/
  dark): intuition throughline, edge-cases framing, human-nature testing → automated checks, new **"Know
  your limits, and grow past them"** section, home-repair + collaborative-close fixes; then a whole-guide
  **tone/presentation review** — **glossary feature** (`DEC-040-3`), an **"it" pass** (default "it" = your
  AI-built software; non-software "it"s named), and **"I"/conjunction/metaphor balancing** (headings →
  "you"). Built the **`scripts/number-content.mjs`** `P#S#` coordinate-view tool (`DEC-040-1`). Governance:
  editing working-mode + audience-drift/for-builders capture (`DEC-040-2`, `_cc/for-builders-tidbits.md`),
  conjunction + metaphor voice rules (`DEC-040-4`), intuition theme, `VOICE.md`/`PERSONA.md` accretions.
- **Conv 039:** **`[SITE-CONTENT-HOME]` dark scaffold built + IA settled** (row stays — content + flip
  pending). Hub-and-spoke content home in `fgw-26`, gated dark by `CONTENT_HOME_LIVE` (`DEC-039-1`): `guides`
  collection + `pillar` join on `blog`; hub `/guides/`, `/guides/<slug>/`, `/writing/` (renamed from
  `/blog/`), `/writing/<slug>/`; nav "Guides" + footer "Guides"/"Writing" — all gated `CONTENT_HOME_LIVE ||
  DEV` (`DEC-039-4`, flag-gate pattern retiring the dev-preview juggling). **IA** (`DEC-039-3`): "Guides"/
  "Writing" labels, single-purpose `/guides/`+`/writing/` bound by cross-links, `/blog/` retired →
  `[BLOG-REDIRECT]`. **Draft content** (all `draft:true`): 3 cornerstone guides (Trust/Steering/Deciding) +
  1 throwaway article — pending redline. New rows **`[PROD-DEPLOY-BAN]`** (`DEC-039-2`, fail-closed guard;
  staging exempt) + **`[BLOG-REDIRECT]`**. Interface polish: nav trimmed ("Home" dropped, logo covers it;
  `DEC-039-5`), Phases added to footer, **sticky footer** (short-page fix), footer "corrected"→"steered"
  (matches og-image), `/writing/` back-link + eyebrow-collision fixed. Verified in dev via Chrome.
- **Conv 038:** **`[POSTING-PLAN]` stood up** — built `reference/CHANNELS.md` (funnel: WoM + inbound-discovery
  entries; LinkedIn/X/Website roles; biweekly cadence; Trust/Steering/Deciding pillars; sourcing + CC-drafts
  workflow; **guides+blog** content home; em-dash sanity-check + complete-sentences copy conventions). New row
  `[SITE-CONTENT-HOME]`. **X pinned post** written → posted → pinned (Straw Man → `/phases`). **OG share card**
  rebuilt to name the subject, then augmented (MSc eyebrow mark, "Over 40 years", "Built with AI / Steered by
  me", circular headshot) with a durable HTML source — prod-deployed, pin re-imaged. Editor model reaffirmed
  (CC sole editor, per-project; `DEC-038-*`). No X Premium. GSC cadence check skipped (operator). Detail in
  `_cc/x-makeover.md` + `_cc/assets/og-image.html`.
- **Conv 037:** **X.com makeover** (`[SOCIAL-MAKEOVER]` X half → row **completed**, both halves done) ✅ —
  profile reworked **live** to the educating-front-door direction: name "Fraser Gorrie, MSc 🇨🇦", concise new
  bio, new warm-dark brand header (re-rendered at 1500×500, replacing the "2 Paths" sales banner); pinned-post
  deferred to `[POSTING-PLAN]`. Detail in `_cc/x-makeover.md`. Plus: **4 site-copy/structured-data edits
  deployed & verified live** (geography "US, Canada and Europe" in `history`/`llms.txt`/`areaServed`; About
  "unreliable tool" → "powerful tool"; `DEC`s at /r-end). **Meristics LinkedIn Company Page deactivated**
  (stranded by the makeover). GSC "Alternate page / canonical" alert investigated — **benign/stale old-site
  URL, no action**. Verified the Conv-036 LinkedIn profile still live. New row `[SITE-TRAILING-SLASH-LINKS]`
  (keep slashes, align internal links — boarded, not done). ⚠️ Operator still to send Gabriel the LinkedIn rec.
- **Conv 036:** **LinkedIn makeover** (`[SOCIAL-MAKEOVER]` LinkedIn half) ✅ — whole profile reworked **live**
  to the "educating front door" direction (`DEC-036-1`) for a **buyer** audience (`DEC-036-2`): new banner,
  headline, About ("worthy companion to AI"), Experience (Software developer · Fraser Gorrie ·
  Self-employed, with the Gabriel testimonial image + clickable `/testimonials` link as permanent media),
  pinned Top-3 capability skills; Services/Projects/Licenses removed; Calendly dropped; Featured =
  testimonials link + kept posts. Built **`reference/PERSONA.md`** (persona + audience, standing reference;
  `DEC-036-3`, now cited in `CLAUDE.md`). Hopper: 3 carried items ruled (→ `[EMAIL-AUTH]`,
  `[SECURITY-TXT-RENEW]`, GEO folded into `[POSTING-PLAN]`). ⚠️ Operator to send Gabriel the recommendation
  request.
- **Conv 035:** Secondary-button fix (3:1 border + translucent hover, `DEC-035-1`) — **deployed** (cleared
  the pending Conv-033/34 deploy to staging + prod). `[GOOGLE-SERVICES]` initial GSC alignment (correct
  `sitemap-index.xml`, broken legacy sitemap removed, homepage re-crawl, **GA4 ↔ Search Console linked**) —
  row kept as a standing monitor. `security.txt` (RFC 9116) added. Built the `/r-start` **cadence
  mechanism** (`DEC-035-4`, fps port). Opened the **agent-discoverability** initiative
  (`AGENT-DISCOVERABILITY.md`, `DEC-035-2`/`-3`). Web-2026 research → 4 new 📋 rows (`[SITE-CSP]` /
  `[SITE-STRUCTURED-DATA]` / `[SITE-CONSENT]` / `[SITE-WCAG22]`) + 3 carried hopper items.
- **Conv 034:** `[SITE-HEADER-TITLE]` ✅ — the page title now reveals in the sticky header once the H1
  scrolls off: inline beside the brand at ≥1024px, a full-width second row inside the header below that
  (keeps the horizontal nav down to 768px). Eyebrow styling (uppercase ember), `IntersectionObserver`
  re-bound across ClientRouter swaps, brand forced no-wrap, anchor `scroll-padding` bumped for the
  two-row header; home omits it. Plus hopper do-nows: masking exception recorded (`DEC-034-1`),
  orphaned `.sample-badge` CSS removed.
- **Conv 033:** Turnstile → "interaction-only" (hidden unless challenged; **deployed**) · robots.txt made
  single-source (disabled Cloudflare Bot Preference Sync; `Google-Extended` allow restored) · `/llms.txt`
  canonical trailing-slash links · **Gabriel Rymberg testimonial published** (home mask-safe pull-quote +
  full named quote on `/testimonials`, `#gabriel-rymberg` deep-link, AI-era section restored) — committed,
  **not yet deployed** · anchor `scroll-padding-top` fix · lede de-identification wording. (Hopper do-nows
  + fixes, not board rows.)
- **Conv 032:** `[SITE-GO-LIVE]` ✅ — DNS cutover complete; `frasergorrie.com` serves fgw-26 (apex custom
  domain + `www` route, MX/email left intact). Plus hopper do-nows (not board rows): contact-form
  ClientRouter submit fix, image brown-band fix, 6 old-URL 301 redirects, deploy-routes guard, lint debt.
- **Conv 031:** `[SITE-ANALYTICS]` · `[SITE-SOCIAL]` · `[SITE-PERF]` · `[SITE-OG-IMAGE]` · `[SITE-NARRATIVE]`
  (signed off) · `[CONTACT-TURNSTILE]` · `[SITE-GO-LIVE]` step 1 · `[CASE-MOCKUPS]` lightbox.
- **Earlier:** `[SITE-A11Y]` / `[CASE-RECORD-SIGNOFF]`* / `[NODE-FLOOR]` ✅ Conv 030 · `[SITE-CONSISTENCY]`
  ✅ 029 · `[CASE-MOCKUPS]` / `[CASE-DIAGRAMS]` / `[CASE-RECORD-REFRESH]` ✅ 025 · `[SITE-AI-SEO]` ✅ 016 ·
  `[SITE-SEO]` / `[SITE-CROSSLINK]` ✅ 015 · `[SITE-CONTACT]` / `[SITE-TESTIMONIALS]` / `[SITE-FAQ]` /
  `[SITE-HISTORY]` ✅ 013 · `[SITE-VISUAL]` ✅ 010 · `[SITE-PHASES]` ✅ 011 · `[SITE-ASSESS]` ✅ 009 ·
  `[SITE-DEPLOY-STAGING]` ✅ 008 · `[SITE-TEST-SETUP]` ✅ 006.
  (*`[CASE-RECORD-SIGNOFF]` row persists above for its standing masking guard.)
