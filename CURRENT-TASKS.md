# Current tasks — fgw

The board. One file (`DEC-000-4`). `[CODE]` handles are readable + hyphenated and are the stable id.
`🔥 Ordered` = sequenced, next-first. `📋 Unordered` = real but not yet sequenced. `⏸️ Parked` = gated,
waiting on something named. `✅ Completed this conv` holds only the conv being closed (emptied each
`/r-end`; the durable history is the conv record).

## 🔥 Ordered

### [SITE-NARRATIVE] Turn the evidence into site copy
Build the site messaging/structure from `discovery/EVIDENCE-LEDGER.md`'s proof-points and the
`WORKING-METHOD.md` honesty frame (`DEC-000-6`). Honour the publishability map — de-identify all
client-owned material. The scaffold now provides the routes + the `work`/`blog` content collections +
the component library to drop copy into; each `/work/<slug>` case is gated on its de-identification,
so start with the most showable (`redline` is fully clear). _Sequenced Conv 006 once the scaffold
landed._

## 📋 Unordered

_None._

## ⏸️ Parked

_None._ (`[SITE-TEST-SETUP]` completed this conv; its gate — the scaffold — is satisfied.)

## ✅ Completed this conv

### [SITE-SCAFFOLD] Scaffold the fgw-26 website app
Shipped the Astro 7 + Cloudflare Workers (static output + adapter) + Tailwind v4 app in `~/projects/fgw-26`:
`DEC-004-6/7` tokens → Tailwind v4 `@theme` + `global.css` component layer; component library
(Layout/SiteLayout, Nav, Footer, Button, Card, ThemeToggle island); five routes + `/work/[slug]` +
reserved-unsurfaced `blog` collection (`DEC-004-2`); canonical `/styleguide`; gates green; **live WCAG
AA review passed** (computed + visual, light & dark). Baseline moved to **Node 24 LTS** during the conv.

### [STYLE-THEME] Style guide + theme for the marketing site
Implementation + review completed (design was done Conv 004). `DEC-004-6/7` tokens realised as Tailwind
v4 `@theme` with light/dark via CSS `light-dark()` + a `[data-theme]` toggle; the component styles live
in `global.css` as the single durable source; `/styleguide` renders them. **WCAG AA contrast verified**
(every required pair passes in both themes; light accent-as-text is a thin 4.70:1 pass; `--faint` is
placeholder-only and exempt). This closes `DEC-004-7`'s "not closed until that review".

### [SITE-TEST-SETUP] Stand up fgw-26's testing stack
Stood up with the scaffold (`DEC-003-2`): Vitest + React Testing Library on jsdom (the `ThemeToggle`
island test), ESLint flat (`jsx-a11y` + `react-hooks`) + Prettier, and `npm verify` =
lint+typecheck+test+build — all green. The deferred extras (D1-in-memory helper, GitHub Actions,
Radix jsdom-hardening) remain **trigger-gated** per `DEC-003-2`, none fired.
