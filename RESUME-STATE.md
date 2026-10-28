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

## ⏭️ Queued for next conv (added mid-Conv 009 at operator request)

> Deferred from Conv 009 on purpose. (This file is Conv 008's handoff; `/r-end` will rewrite it and must
> carry these two forward.)

- **B — `[SITE-VISUAL]` directions.** Mock up 2–3 distinct visual directions (warmth, deliberate ember
  accent, icons for theme/menu, imagery incl. headshot + `og:image`), operator picks one, then spec +
  implement. Context: the delivered site reads near-monochrome / "AI-default", a gap from the intended
  warm-editorial direction (`DEC-004-5/6`). See the `[SITE-VISUAL]` board row.
- **C — whole-site voice/candor pass.** Bring **every** page into the one documented voice:
  `reference/VOICE.md` — Fraser speaking directly to a client in a first meeting, lightly-warmed
  register, candid (the `this-site` "The record" block is the exemplar). Also review/edit the `this-site`
  case itself. The copy drafted Conv 009 was written toward this voice but predates the written standard,
  so re-pass it against `reference/VOICE.md`.

## 🔬 Carried findings

_None._
