**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 006 scaffolded the fgw-26 app: **Astro 7 (static output) + Cloudflare Workers + Tailwind v4**, with
the `DEC-004-6/7` tokens realised as a Tailwind v4 `@theme` + `global.css` component layer, the
single-sourced component library, five routes + `/work/[slug]` + a reserved-unsurfaced `blog`
collection, the canonical `/styleguide`, and the gates (`npm verify` green). The **live WCAG AA contrast
review passed** (computed + visual, light & dark), closing `[STYLE-THEME]` and `[SITE-TEST-SETUP]`. The
second half hardened tooling: ESLint 9 / `eslint-plugin-astro` ^1 / TS 6 pins (ecosystem lag,
`DEC-006-2`), a scoped `undici` 7.30.1 override (`DEC-006-3`), and a move to **Node 24 LTS** enforced via
`engines.node >=24` + npm 11 `allowScripts` (`DEC-006-4`). Page copy is deliberate placeholder.

## Next action

**`[SITE-NARRATIVE]`** (🔥 Ordered #1) — build the site copy/messaging from
`discovery/EVIDENCE-LEDGER.md`'s proof-points + the `WORKING-METHOD.md` honesty frame (`DEC-000-6`),
dropping it into the scaffold's routes, `work`/`blog` content collections, and component library.
De-identify all client material per the publishability map; each `/work/<slug>` case is gated on its
de-identification, so start with the most showable (`redline` is fully clear).

**Operational:** fgw-26 is on **Node 24** — run `nvm use` in `~/projects/fgw-26` (the `predev`/`prebuild`
guard refuses older Node). `npm verify` is the commit gate.

## 🔬 Carried findings

_None._
