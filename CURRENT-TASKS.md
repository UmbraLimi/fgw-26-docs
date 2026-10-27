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

1. ⚡ **[SITE-DEPLOY-STAGING]** — the first `wrangler deploy` of the fgw-26 app to Cloudflare staging
   (`fgw-staging.<account>.workers.dev`). Deploy wiring done Conv 007 (`DEC-007-2`); remaining is the
   deploy itself, gated on the operator clearing Cloudflare auth. Critical-path **Phase 1**.
2. **[SITE-NARRATIVE]** — turn the evidence (`discovery/EVIDENCE-LEDGER.md`) + the `WORKING-METHOD.md`
   honesty frame (`DEC-000-6`) into real site copy, de-identified per the publishability map.
   Critical-path **Phase 2** (the site needs true content before a real domain points at it).
3. **[SITE-GO-LIVE]** — production deploy + cut `frasergorrie.com` over to fgw-26 on Cloudflare. Opened
   Conv 007; lean until Phases 1–2 land. Critical-path **Phase 3** — the destination.

---

## 🎯 Critical path — to fgw-26 live on Cloudflare at frasergorrie.com

Set Conv 007. The arc from the current scaffold (placeholder copy, never deployed) to the real site
serving at **frasergorrie.com**.

🔴 **This section is pure sequence + pointers.** Every step names an **existing** task by `[CODE]` or an
operator action; the row holds the work, detail, and done-condition — this holds the order *over* them,
not a second copy.

**Already true — NOT a gate:** the app is scaffolded (Astro 7 + Cloudflare Workers adapter + Tailwind
v4), `npm verify` green, WCAG AA verified, Node 24 baseline (all Conv 006). What's missing is (a) any
deploy, (b) real copy, (c) the domain.

### Phase 1 — Staging reachable *(prove the deploy pipeline)*
- **1.0 — operator: clear Cloudflare auth** — `wrangler login` (interactive) or `CLOUDFLARE_API_TOKEN`.
  Hard blocker; CC cannot do it.
- **1.1 — `[SITE-DEPLOY-STAGING]`** — wiring done Conv 007 (`fgw`/`fgw-staging` + deploy scripts); run
  `npm run deploy:staging` under Node 24 → a live `*.workers.dev` URL. **Done-when:** the scaffold
  (placeholder copy) is reachable + correct at the staging URL. CI stays deferred (`DEC-003-2`); manual
  deploy is the path.

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

### [SITE-DEPLOY-STAGING] · opened Conv 007 · critical-path Phase 1

#### What it is
Stand up a working **staging** deploy of the fgw-26 app on Cloudflare — the first time the scaffold is
reachable at a URL. The build is a **Workers** deploy (`@astrojs/cloudflare` adapter + `wrangler.jsonc`:
server `main` entrypoint + `ASSETS`→`./dist`; `dist/` holds `client/` + `server/`), not Pages.

#### Status — Conv 007 (plain language)
- **What works:** the app builds (`npm run build` → `dist/`); `npm verify` green (Conv 006). Deploy
  wiring is in place (Conv 007): `wrangler.jsonc` worker `name` = `fgw` (production) + an `env.staging`
  → `fgw-staging`; `deploy` + `deploy:staging` scripts added (`DEC-007-2`).
- **What's not built:** no deploy has run — no domain/route binding (that's Phase 3). The staging URL
  will be `fgw-staging.<account>.workers.dev` once deployed.
- **What's buildable next:** `npm run deploy:staging` under Node 24 — **blocked only on the operator
  clearing Cloudflare auth** (`wrangler whoami` = not logged in / token expired, re-checked Conv 007).

#### Owed by the operator
- Clear Cloudflare auth: `wrangler login` (interactive OAuth) or set `CLOUDFLARE_API_TOKEN`. Hard blocker.
- Ruling: staging-URL strategy — **resolved Conv 007 → `*.workers.dev`** (`fgw-staging.<account>.workers.dev`),
  with brand-stable worker naming decoupled from the yearly repo (`DEC-007-2`). Option B
  (`staging.frasergorrie.com`) deferred — needs the zone + DNS, coupling to Phase 3.

#### Build steps (CC)
1. ✅ Conv 007 — `deploy` / `deploy:staging` scripts added (`npm run deploy` / `npm run deploy:staging`).
2. ✅ Conv 007 — `env.staging` block in `wrangler.jsonc` → `fgw-staging`; top-level `name` = `fgw`
   (production).
3. ⏳ `npm run deploy:staging` **under Node 24** — this shell defaults to Node 22 and the
   `predev`/`prebuild` guard refuses older; run via `nvm use`. Blocked on operator Cloudflare auth.

**Done-when:** the scaffold (placeholder copy) is reachable + correct at the staging URL.

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

#### Status — Conv 007
Not started. Scaffold copy is deliberate placeholder (Conv 006). Sequenced behind `[SITE-DEPLOY-STAGING]`
on the critical path (Conv 007) — staging first, then content. Positioning thesis documented Conv 007
(above) as the drafting brief.

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

_None._ Conv 007 shipped no board row — the `fgw` / `fgw-staging` deploy-config wiring is partial
progress on the still-open `[SITE-DEPLOY-STAGING]` (blocked on operator Cloudflare auth).
