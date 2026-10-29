**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 012 was an operator-led visual/UX pass: **items 1/2/4 shipped** — case-page extras (a JSON
`caseExtras` collection → per-case diagram + tools + benefit + card motif, mock content), section icons
(Method + Home "What I do" + a proof-band eyebrow), and the **FG monogram** favicon/app-icon set + header
lockup — plus a **theme-on-nav fix** (`astro:after-swap`) and a `--surface` **header tone**. Two bigger
threads: a **contact form** (`[SITE-CONTACT]`) — real form → Worker route → Resend, built + dev-verified
but **inert until the operator provisions Resend secrets** — and a **file-based secrets/config convention**
(`VARS_SECRETS.md`, `DEC-012-3`) that also uncovered + fixed a silently-broken deploy guard
(`assert-worker.mjs`). Everything verified in dev; nothing in production. **Staging is behind HEAD** — it
has the favicon + theme fix (version `7f826659`) but not the header lockup, header tone, or the form.

## Next action

Finish **`[SITE-CONTACT]`** (⚡ next): operator creates the gitignored `.dev.vars.staging` /
`.dev.vars.production` (real `RESEND_API_KEY` + `EMAIL_TO`), confirms the committed `EMAIL_FROM`, and
verifies the Resend sender domain — then redeploy staging (`npm run deploy:staging`, now ships secrets via
`--secrets-file`) and **live-test the contact round-trip**. Reason: it's the committed-but-inert work the
operator named as the next-conv priority, and the redeploy also brings staging current. Then start
**`[SITE-TESTIMONIALS]`** (item 6). ⚠️ New shells still need a manual `nvm use 24` (`[NODE-FLOOR]`).

## 🔬 Carried findings

_None._
