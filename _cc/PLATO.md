# PLATO for fgw-26 — deferred playbook

**Status:** DEFERRED for fgw-26 (`DEC-003-1`, Conv 003). Not built. This note records *what PLATO is*,
*why we're not using it yet*, *what would make it worth adopting*, and *how we'd adopt it* — so the
deferral is revisitable, not forgotten.

**Authoritative source:** PLATO is a Peerloop invention. The full design guide lives at
`~/projects/peerloop-docs/docs/reference/PLATO-GUIDE.md` (read in Conv 003). Code:
`~/projects/Peerloop/tests/plato/`. This file is fgw-specific commentary, not a copy of that guide — go
there for the mechanism in full.

---

## What PLATO is (one paragraph)

**PLATO = Platform Action Test Orchestrator.** It executes a realistic user *journey* as a fixed-order
sequence of **real API calls against a real in-memory SQLite DB** (Model B: "sequential
DB-accumulation"). Each step deposits data; the next step must *discover* that data via a GET — exactly
as a real page would — rather than receiving it through carry-state. It never opens a browser. It
proves the one thing unit and single-endpoint API tests cannot: **that one endpoint's output is valid
input to the next**, across a whole journey (register → create → enrol → …). [checked:
PLATO-GUIDE.md §"What PLATO Is", §"How It Works"]

## The insight that makes it matter for browser testing

Each PLATO step definition does **double duty**: (1) an executable API test, and (2) a human-readable
**walk-through script** — its `route` + `description` + `actions` tell a human (or the `/chrome` bridge)
exactly where to go and what to click. So PLATO is what turns the `/chrome` bridge from *ad-hoc* "does
this look right?" into a **scripted, repeatable UI pass**: the step defs *are* the walk script. That is
why Peerloop needs very little Playwright. [checked: PLATO-GUIDE.md §"Page Visits and Actions",
§"The Developer's Manual Walk-Through"]

## The four-layer division of labour PLATO sits in

| Concern | Tool |
|---|---|
| Single endpoint / bad input / edge cases | Vitest unit + API tests |
| **Can the server handle the full journey's API sequence?** | **PLATO** — ~200ms, deterministic, debuggable |
| **Does the UI expose those actions?** | **`/chrome` bridge walk, scripted by PLATO step defs** |
| Multi-browser / real-time only (video rooms, cross-tab, OAuth redirects) | **Playwright**, written sparingly |

[checked: PLATO-GUIDE.md §"The Division of Labor", §"What Playwright IS Good For"]

Peerloop's explicit case against Playwright-for-everything: flakiness (hydration/animation/selector/network
timing), 150–300× slower (~200ms vs 30–60s for ~15 calls), and garbled failures vs PLATO's exact
`status + endpoint + body`. [checked: PLATO-GUIDE.md §"Why Not Playwright for Everything?"]

---

## Why deferred for fgw-26 (`DEC-003-1`)

PLATO earns its weight on a platform with **deep, data-accumulating journeys** where each endpoint's
output feeds the next and hand-inserted "perfect" test data would hide the integration gaps (Peerloop:
register-creator → grant-role → create-community → create-course → add-modules → publish → enrol →
complete → certify — a 20-step catalogue). [checked: PLATO-GUIDE.md §"Current Step Catalog"]

**fgw-26 is a marketing site.** Its journeys are thin — view a page → read → a CTA / contact / maybe a
newsletter opt-in. There is little or no chain where step N's DB write is the precondition for step N+1.
The full apparatus (runner, scenarios, steps, personas, `SqlTopUp`, mock-registry) is a substantial
build; standing it up for journeys this shallow fails the lean-process test (`DEC-000-7`). The near-term
browser check for fgw-26 is the `/chrome` bridge used directly, plus Vitest + RTL/jsdom for components.

## When to reconsider — the trigger conditions

Revisit this deferral (promote toward the middle path, then the full runner) when **any** of these
become true for fgw-26:

- A real multi-step journey appears where **one step's server state gates the next** — e.g. a contact
  or booking flow that creates a record, then a confirmation/status page that must read it back; an
  account/login area; a CMS-backed create→publish→view loop.
- We start needing **realistic seed data** for the site and would otherwise hand-write it — PLATO
  scenarios double as seed generators (Peerloop's `seed-dev`). [checked: PLATO-GUIDE.md
  §"Personas as Seed Data", §"Scenarios"]
- Manual `/chrome` bridge walks become **repetitive and regression-prone** — i.e. we're re-clicking the
  same path every change and missing breakages. That repetition is the signal the walk should be
  *scripted*, which is the middle path below.

## How we'd adopt it — two sizes

**Middle path first (was option B in the Conv-003 discussion).** Borrow only the *pattern*, not the
machine: write PLATO-style step definitions (plain data: `route`, `description`, ordered `actions`) that
serve purely as the **`/chrome` bridge walk script**, with no API runner behind them. Cost: a small
typed shape + a handful of step files. Benefit: the UI walk becomes repeatable and reviewable. This is
the first thing to reach for if the "repetitive bridge walk" trigger fires.

**Full runner (was option A).** Only if genuine server-side journeys appear. Port from Peerloop,
scaled to fgw-26:
1. `tests/plato/lib/` — types + a minimal runner (`executeScenario`), reporter.
2. `steps/` — one file per journey step; each is both an API test and a walk script.
3. `personas/` — actor + data sets; mark fields `DB-REQUIRED` vs `SITE-NECESSARY` per Peerloop's
   convention so steps prove minimum viability while enriched data proves a complete-looking site.
   [checked: PLATO-GUIDE.md §"DB-REQUIRED vs SITE-NECESSARY Fields"]
4. `scenarios/` — composable chains with scenario-level DB verifications.
5. Wire into Vitest so it runs in the normal suite (Peerloop: `npm run test:plato`, also part of
   `npm test`). [checked: PLATO-GUIDE.md §"Running PLATO"]

Carry over the hard-won gotchas if we build the full runner: one SQL statement per `SqlTopUp` step;
CTE for user/course resolution but **explicit JOINs for enrolment lookups** (CTE refs return NULL in D1
INSERT context); `topup-` ID prefix for traceability; verify the "break fast and loudly" property by
commenting out a prior step and confirming the dependent step fails. [checked: PLATO-GUIDE.md
§"SqlTopUp Steps", §"How to Add a New Step" step 7]

## What PLATO never covers (so we still need the other layers)

UI rendering, navigation *paths*, error/validation (happy-path only), true multi-browser real-time,
client-side state (localStorage/cookies/WebSocket), and timing/concurrency races. These stay with
Vitest + RTL, the bridge walk, and (only where a browser is genuinely required) Playwright.
[checked: PLATO-GUIDE.md §"What PLATO Does NOT Cover"]
