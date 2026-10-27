**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 008 **proved** the Cloudflare staging deploy: the scaffold is live + correct at
`fgw-staging.fgorrie.workers.dev` (critical-path Phase 1 done). The Conv-007 `--env`-at-deploy wiring was
broken — it silently deployed the production-named `fgw` — so it was corrected to build-time
`CLOUDFLARE_ENV` selection via a committed `.env.staging`, guarded by `scripts/assert-worker.mjs`, with a
split `.env.*` / `.dev.vars.*` env-file layout (`DEC-008-1`). SITE-NARRATIVE source material from ~30 Zoom
talks was distilled into `discovery/NARRATIVE-SOURCE-GEMINI.md`.

## Next action

**`[SITE-NARRATIVE]`** (🔥 Ordered #1, critical-path Phase 2) — draft real site copy. Start from
`discovery/NARRATIVE-SOURCE-GEMINI.md` (Gemini synthesis, already mapped to the positioning thesis +
honesty frame) and `discovery/EVIDENCE-LEDGER.md`, honouring the `WORKING-METHOD.md` honesty frame
(`DEC-000-6`). 🔴 Three gates before any copy publishes: **verify the biography** (incl. the "44-year" vs
"decades" mismatch); **fold the honesty half back in** (Gemini's draft is pure highlight reel); and
**de-identify** per the publishability map. Redeploy to staging as copy lands.

## 🔬 Carried findings

_None._
