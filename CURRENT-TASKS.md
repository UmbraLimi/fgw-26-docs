# Current tasks — fgw

The board. One file (`DEC-000-4`). `[CODE]` handles are readable + hyphenated and are the stable id.
`🔥 Ordered` = sequenced, next-first. `📋 Unordered` = real but not yet sequenced. `⏸️ Parked` = gated,
waiting on something named. `✅ Completed this conv` holds only the conv being closed (emptied each
`/r-end`; the durable history is the conv record).

## 🔥 Ordered

_None yet — sequencing happens once the style direction is set._

## 📋 Unordered

### [STYLE-THEME] Style guide + theme for the marketing site
**Design complete** this conv: direction (`DEC-004-5`), tokens — fonts/palette/scale (`DEC-004-6`), and
component styles — buttons/inputs/cards/prose/nav/footer/misc (`DEC-004-7`); Tailwind v4 CSS-first, no
shadcn (`DEC-004-3`). The definitive single source for all styling. **Outstanding (post-scaffold, per
the agreed plan):** implement as Tailwind v4 `@theme` + components, build the canonical `/styleguide`
page, and the live review — including WCAG AA contrast verification. Not closed until that review.

### [SITE-SCAFFOLD] Scaffold the fgw-26 website app
Stand up the Astro + Cloudflare Workers + Tailwind v4 skeleton (`DEC-000-1`) in `~/projects/fgw-26`,
latest versions, with the testing/lint/format gates. Pins `dep-check.sh` can then be adapted to.

### [SITE-NARRATIVE] Turn the evidence into site copy
Build the site messaging/structure from `discovery/EVIDENCE-LEDGER.md`'s proof-points and the
`WORKING-METHOD.md` honesty frame (`DEC-000-6`). Honour the publishability map — de-identify all
client-owned material.

## ⏸️ Parked

### [SITE-TEST-SETUP] Stand up fgw-26's testing stack — gated on [SITE-SCAFFOLD]
Vitest (co-located `*.test.ts`, thin) + React Testing Library on jsdom (interactive islands only; lift
fps's `vitest.setup.ts` jsdom-hardening if shadcn chosen) + ESLint flat + Prettier (`jsx-a11y` +
`react-hooks`) + npm `verify` = lint+typecheck+test+build. D1-in-memory test helper only if data access
appears; GitHub Actions deferred to deploy (`DEC-003-2`). **Gate:** needs the app scaffolded first.

## ✅ Completed this conv

### [HARNESS-TESTS] Test the `.claude` harness scripts/hooks ✅
`.claude/scripts/test-harness.sh` aggregator (runs every `*.test.sh`, non-zero on any failure, shows
failing output). Guards mutation-checked: `check-ab-options.mutation.test.sh` (4 mutations) and a new
`capture-turn.test.sh` + `capture-turn.mutation.test.sh` (2 mutations). All 6 mutations caught; verified
live that a suite-invisible break is correctly reported SURVIVED (`DEC-003-2`).
