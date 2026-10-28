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

1. ⚡ **[SITE-NARRATIVE]** — turn the evidence (`discovery/EVIDENCE-LEDGER.md`) + the `WORKING-METHOD.md`
   honesty frame (`DEC-000-6`) into real site copy, de-identified per the publishability map.
   Critical-path **Phase 2** (the site needs true content before a real domain points at it).
2. **[SITE-SEO]** — SEO infrastructure the scaffold lacks (site URL, sitemap, robots.txt, canonical,
   og:image, `schema.org` JSON-LD). Opened Conv 009. Critical-path **Phase 3**.
3. **[SITE-AI-SEO]** — AI/LLM discoverability (llms.txt, structured facts, AI-crawler policy). Opened
   Conv 009. Critical-path **Phase 3**; shares machinery with [SITE-SEO].
4. **[SITE-PERF]** — page-speed as a tracked discipline (Lighthouse/CWV + budget, image optimization).
   Opened Conv 009. Critical-path **Phase 3**; mostly satisfied already by the static+edge architecture.
5. **[SITE-VISUAL]** — close the gap between the intended warm-editorial direction and the
   near-monochrome, imageless, "AI-default" result (operator critique Conv 009): warmth, deliberate
   accent, icons, imagery. Opened Conv 009. Pre-go-live polish (alongside Phase 3).
6. **[SITE-ASSESS]** — substantiate "you can check my work" with an independent, evidence-cited
   assessment of Fraser's steering value on each Work project, read from that project's docs repo.
   Opened Conv 009. Enhances the Work set (Phase 2); pilot on this site.
7. **[SITE-GO-LIVE]** — production deploy + cut `frasergorrie.com` over to fgw-26 on Cloudflare. Opened
   Conv 007; lean until the pre-go-live work lands. Critical-path **Phase 4** — the destination.

(**[SITE-DEPLOY-STAGING]** — critical-path Phase 1 — ✅ completed Conv 008; see ✅ Completed this conv.)

---

## 🎯 Critical path — to fgw-26 live on Cloudflare at frasergorrie.com

Set Conv 007. The arc from the current scaffold (placeholder copy, now live on staging as of Conv 008)
to the real site serving at **frasergorrie.com**.

🔴 **This section is pure sequence + pointers.** Every step names an **existing** task by `[CODE]` or an
operator action; the row holds the work, detail, and done-condition — this holds the order *over* them,
not a second copy.

**Already true — NOT a gate:** the app is scaffolded (Astro 7 + Cloudflare Workers adapter + Tailwind
v4), `npm verify` green, WCAG AA verified, Node 24 baseline (all Conv 006); and the staging deploy
pipeline is proven — scaffold live at `fgw-staging.fgorrie.workers.dev` (Conv 008). What's missing is
(a) real copy, (b) the production deploy + the domain.

### Phase 1 — Staging reachable *(prove the deploy pipeline)* — ✅ DONE Conv 008
- **1.0 — operator: clear Cloudflare auth** — ✅ done Conv 008 (`wrangler login`, OAuth).
- **1.1 — `[SITE-DEPLOY-STAGING]`** — ✅ done Conv 008. Deploy env-selection corrected to build-time
  `CLOUDFLARE_ENV` + a fail-closed resolved-name guard (`DEC-008-1`, correcting `DEC-007-2`'s wiring).
  Scaffold live + correct at `fgw-staging.fgorrie.workers.dev` (HTTP 200). CI stays deferred (`DEC-003-2`).

### Phase 2 — Publishable content *(the site must say something true)*
- **2.1 — `[SITE-NARRATIVE]`** — real copy/messaging + de-identified `/work/<slug>` cases (start with
  `redline`, fully clear). Redeploy to staging as it lands.

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
**In progress.** The active critical-path item. Copy structure/approach agreed Conv 009 (below);
drafting of the unblocked pages underway.

**Settled plan (Conv 009):**
- **IA:** the built 5-page scaffold, unchanged. The three candidate "services" fold into a light
  **"What I do"** block on Home — no Services page, no route (revisitable; the dedicated-page option
  stays open if it earns its place).
- **Home:** keep scaffold h1 ("I steer; AI drives — and I know when to overrule it"); lede = the
  two-half positioning thesis; **3 proof cards = #2 catch-what-checks-miss · #3
  tell-you-when-it-isn't-working · #4 measure-not-guess** (ledger proof-points; #1 is the headline,
  #5 range → About).
- **Method** (the differentiator): collaboration shape + why-pay warrant (deterministic core /
  human-in-loop / 80/20) **and** the honesty frame — honesty half is load-bearing here.
- **Work:** `redline` first (fully clear); then de-identified SPT + Peerloop; bake-off optional.
- **Contact:** short framing, email CTA (address still a launch-config placeholder).

**Drafted + live Conv 009:** Home, Method, Contact, `redline`, **About** (biography verified Conv 009,
recorded in `discovery/BIO-VERIFIED.md`).
**Live on dev + staging-eligible (Conv 009):** two de-identified cases —
`work/translation-platform.md` (= the translation-system/SPT engagement) and
`work/learning-marketplace.md` (= the Peerloop engagement) — now `draft: false`. 🔴 This mapping lives
here, never in the `fgw-26` site source.
🔴 **Sign-off gate (operator, Conv 009):** client sign-off is required before the **production** deploy
to frasergorrie.com (`[SITE-GO-LIVE]` / Phase 3) — **not** for dev or staging. De-identification is the
guard that makes dev/staging safe; sign-off is the guard for production.
**About voice:** resolved Conv 009 — lightly-warmed register, operator-chosen.
**Remaining Work cases:** **this site (`fgw-26`)** as a Work case — operator-requested Conv 009 ("it
shows AI and myself at work"); it is the `[SITE-ASSESS]` pilot and its "The record" block is the
assessment of this very project. Optional urantia bake-off case stays deferred (Conv 009).

**Source material (Conv 008):** `discovery/NARRATIVE-SOURCE-GEMINI.md` — distilled from Gemini's reading
of ~30 Zoom talks; mapped to the positioning thesis + honesty frame, with the biography flagged
`[unverified]` and a verbatim draft-copy appendix. Raw clay, honesty half must be folded back in.

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

### [SITE-ASSESS] · opened Conv 009 · enhances the Work set

#### What it is
The site claims Fraser's work is legible — clients can check it. `[SITE-ASSESS]` makes that literal: for
each project shown in Work, read **that project's own docs repo** and produce an honest, evidence-cited
assessment of Fraser's contribution — *did he plan well? did he steer the AI, and overrule it when it
mattered?* — citing the specific decision records / conv logs so a reader could verify. On-thesis: an AI
independently assessing the human's steering is itself proof of the thesis.

#### Mechanism (Conv 009 — adjusted per operator "C", pending sign-off)
- One **independent read per project docs repo** (a subagent per repo: keeps the big cross-file reads out
  of the main context and reads the record fresh). Map: `redline` case → `redline`; translation-platform
  → `spt-docs`; learning-marketplace → `peerloop-docs`; this site → `fgw-26-docs`.
- **Each agent returns, grounded in cited artifacts (`DEC-NNN` / conv refs so a reader can verify):**
  1. **Scale** — how big the project is: **number of convs first**, plus whatever other scale the repo
     offers (decisions recorded, files / LOC, duration).
  2. **Steering** — specific **highlighted decisions that show Fraser steering or overruling the AI**,
     each cited — **including where he did NOT steer well** (the honesty frame, `DEC-000-6`).
  3. **The plan** — a comment on **how well he planned** the work.
- Rendered as a per-case **"The record"** block on each `/work/<slug>` detail page.

#### 🔴 Constraints / open fork
- De-identify client-project assessments (`spt-docs`, `peerloop-docs`) exactly as the cases are.
- **Checkability asymmetry:** "you can check it" is *literal* only for owned/public repos (`redline`,
  `fgw-26-docs`); client repos are private, so their assessment is grounded-but-not-publicly-openable.
  **Open fork:** do client projects get the assessment block at all, or only the owned/public ones?
- Honest, not hagiography. Reads of other repos are outside the declared working dirs → may prompt.

#### Pilot
This site (`fgw-26-docs`) — fully owned, fully accessible, and the new Work case the operator asked for
(this website "shows AI and Fraser at work"). Doubles as the `[SITE-VISUAL]`-era Work-case content.

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

### [SITE-DEPLOY-STAGING] · critical-path Phase 1 · ✅ Conv 008
First staging deploy landed: scaffold live + correct at `https://fgw-staging.fgorrie.workers.dev`
(HTTP 200). The Conv 007 `--env`-at-deploy wiring was broken — it silently deployed the production-named
`fgw` — so env-selection was corrected to build-time `CLOUDFLARE_ENV` + a fail-closed resolved-name guard
(`scripts/assert-worker.mjs`), with a split `.env.*` / `.dev.vars.*` env-file layout (`DEC-008-1`,
correcting `DEC-007-2`). Stray `fgw` worker deleted. Done-when met.
