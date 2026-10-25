# Current tasks — fgw

The board. One file (`DEC-000-4`). `[CODE]` handles are readable + hyphenated and are the stable id.
`🔥 Ordered` = sequenced, next-first. `📋 Unordered` = real but not yet sequenced. `⏸️ Parked` = gated,
waiting on something named. `✅ Completed this conv` holds only the conv being closed (emptied each
`/r-end`; the durable history is the conv record).

## 🔥 Ordered

### [SITE-SCAFFOLD] Scaffold the fgw-26 website app
Stand up the Astro + Cloudflare Workers + Tailwind v4 skeleton (`DEC-000-1`) in `~/projects/fgw-26`,
latest versions, with the testing/lint/format gates. Translate the `[STYLE-THEME]` tokens
(`DEC-004-6/7`) into Tailwind v4 `@theme`, build the components + the canonical `/styleguide` page, then
the live review (incl. WCAG AA contrast). Pins `dep-check.sh` can then be adapted to. _Sequenced Conv 004
once the style direction was set._

## 📋 Unordered

### [STYLE-THEME] Style guide + theme for the marketing site
**Design complete** this conv: direction (`DEC-004-5`), tokens — fonts/palette/scale (`DEC-004-6`), and
component styles — buttons/inputs/cards/prose/nav/footer/misc (`DEC-004-7`); Tailwind v4 CSS-first, no
shadcn (`DEC-004-3`). The definitive single source for all styling. **Outstanding (post-scaffold, per
the agreed plan):** implement as Tailwind v4 `@theme` + components, build the canonical `/styleguide`
page, and the live review — including WCAG AA contrast verification. Not closed until that review.

### [SITE-NARRATIVE] Turn the evidence into site copy
Build the site messaging/structure from `discovery/EVIDENCE-LEDGER.md`'s proof-points and the
`WORKING-METHOD.md` honesty frame (`DEC-000-6`). Honour the publishability map — de-identify all
client-owned material.

## ⏸️ Parked

### [SITE-TEST-SETUP] Stand up fgw-26's testing stack — gated on [SITE-SCAFFOLD]
Vitest (co-located `*.test.ts`, thin) + React Testing Library on jsdom (interactive islands only) +
ESLint flat + Prettier (`jsx-a11y` + `react-hooks`) + npm `verify` = lint+typecheck+test+build. shadcn
declined (`DEC-004-3`), so fps's `vitest.setup.ts` jsdom-hardening is **not** needed unless the
per-component trigger later pulls in a Radix component. D1-in-memory test helper only if data access
appears; GitHub Actions deferred to deploy (`DEC-003-2`). **Gate:** needs the app scaffolded first.

## ✅ Completed this conv

_None._ (Conv 005 was process/infra work, not a board task: hardened the 👉👉👉 question-anchor guard —
`CLAUDE.md` rule wording + `check-ab-options.sh` line-start matching + tests, `DEC-005-1`. No `[CODE]`
task opened or closed; `[SITE-SCAFFOLD]` remains the next action.)
