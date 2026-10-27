**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 007 adopted the fps `CURRENT-TASKS.md` board format (`DEC-007-1`) with a staging→content→live
**critical path**, and wired (but did **not** run) the Cloudflare staging deploy: `wrangler.jsonc` worker
`name` is now `fgw` (production) + an `env.staging`→`fgw-staging`, with `deploy` / `deploy:staging`
scripts — brand-stable names decoupled from the yearly repo (`DEC-007-2`). The pipeline is **unproven**:
nothing has deployed, because Cloudflare auth is expired. The site's client-attraction **positioning
thesis** (worldview + the reassurance half) is documented in `[SITE-NARRATIVE]` as a Phase-2 drafting
brief — not yet copy.

## Next action

**`[SITE-DEPLOY-STAGING]`** (🔥 Ordered #1, critical-path Phase 1) — the first staging deploy. **Blocked
on the operator:** clear Cloudflare auth — `wrangler login` (interactive; run via `! npx wrangler login`)
or set `CLOUDFLARE_API_TOKEN`. Once cleared, CC runs `npm run deploy:staging` **under Node 24**
(`nvm use` in `~/projects/fgw-26`; the `predev`/`prebuild` guard refuses older Node) → a live
`fgw-staging.<account>.workers.dev`. **Done-when:** the scaffold (placeholder copy) is reachable + correct
at that URL. Also still open on the board: confirm the staging worker deploys cleanly before Phase 2 copy.

## 🔬 Carried findings

_None._
