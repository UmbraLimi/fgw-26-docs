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
2. **[SITE-GO-LIVE]** — production deploy + cut `frasergorrie.com` over to fgw-26 on Cloudflare. Opened
   Conv 007; lean until Phases 1–2 land. Critical-path **Phase 3** — the destination.

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

### Phase 3 — Live at frasergorrie.com *(production + domain cutover)*
- **3.1 — operator: confirm where `frasergorrie.com` DNS lives today** and whether/when its zone is in
  this Cloudflare account. The legacy `frasergorrie` site currently answers the domain.
- **3.2 — `[SITE-GO-LIVE]`** — a production worker + a custom-domain/route binding (apex + `www`) + the
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
**Still blocked:** About voice is a draft (operator to react); optional urantia bake-off case not drafted.

**Source material (Conv 008):** `discovery/NARRATIVE-SOURCE-GEMINI.md` — distilled from Gemini's reading
of ~30 Zoom talks; mapped to the positioning thesis + honesty frame, with the biography flagged
`[unverified]` and a verbatim draft-copy appendix. Raw clay, honesty half must be folded back in.

### [SITE-GO-LIVE] · opened Conv 007 · critical-path Phase 3

#### What it is
Take fgw-26 to production on Cloudflare and point **frasergorrie.com** at it: a production worker (the
top-level `wrangler.jsonc` name), a custom-domain/route binding for the apex (+ `www`), and the DNS
cutover from the legacy site.

#### Status — Conv 007 (plain language)
Lean placeholder — opened so the critical path's destination resolves to a real row. Not specced;
blocked behind Phases 1–2. 🔴 **The cutover is outward-facing + hard to reverse** (it takes the domain
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
