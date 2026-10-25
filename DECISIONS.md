# Decisions — fgw

Every decision (design and process alike), numbered `DEC-NNN-N`, **newest-first**. Each: `Decision:` /
`Rationale:` (name the alternative that lost) / `Consequences:`. 🔴 IDs are never reused or renumbered;
a superseded decision is **tombstoned, never deleted** (`### DEC-NNN-N — ⛔ superseded by \`DEC-MMM-M\``
and nothing else), so every handle ever issued resolves. Scan `DECISIONS-DIGEST.md` for precedent, then
open the cited entry here. Full format: `reference/CONV-FORMAT.md`.

---

## Conv 003

### DEC-003-2 — fgw-26 testing strategy (all layers)
**Decision:** Adopt one testing strategy across layers, most infra standing up at `[SITE-SCAFFOLD]`:
- **Unit/integration:** Vitest, co-located `*.test.ts`, kept thin (a marketing site has little logic).
  Add a `better-sqlite3`-as-D1 in-memory helper (Peerloop/fps pattern) **only if/when** the site reads
  or writes D1 — not before.
- **UI/component:** React Testing Library on Vitest/jsdom, testing the **interactive React islands
  only** (static Astro markup is eyeballed via the bridge, not unit-tested). If `[STYLE-THEME]` picks
  shadcn/ui, lift fps's `vitest.setup.ts` jsdom-hardening (Radix `ResizeObserver`/`matchMedia`/
  pointer-capture) wholesale.
- **Browser/e2e:** `/chrome` bridge is the live tool (ad hoc). PLATO deferred (`DEC-003-1`); Playwright
  deferred until real flows exist and then kept to a tiny genuinely-gating set (not left to rot as
  Peerloop's did).
- **Harness CLI/scripts:** hand-rolled POSIX `sh`/bash harnesses + a `test-harness.sh` aggregator;
  **mutation-check the guards** — each guard test names, in a comment, the deliberate break it must
  catch, verified to fail on it.
- **Gates/CI:** npm `verify` = lint + typecheck (`tsc --noEmit`) + test + build as the commit-safety
  command; **ESLint (flat) + Prettier** for `eslint-plugin-jsx-a11y` + `react-hooks`; GitHub Actions
  deferred to `[SITE-SCAFFOLD]`/deploy; no TZ-matrix.
- **Discipline:** keep the `[checked:]` tags + re-run-baseline-this-conv rule (`DEC-000-7`); treat the
  bridge-rendered DOM as ground truth (Peerloop's "only a DOM check exposed the empty feeds" lesson).
**Rationale:** Vitest + RTL/jsdom is the unanimous sibling default and native to the Astro/Vite/Workers
stack. Choices made against alternatives: **ESLint+Prettier over Biome** (Biome is leaner and fps uses
it for its core, but a public "broad-appeal" marketing site makes `jsx-a11y` accessibility linting
load-bearing, and that's an ESLint plugin — revisit if a11y linting underdelivers); **hand-rolled bash
over bats/shunit2/`node:test`** (zero new deps; our scripts are shell and we already have one such test,
`check-ab-options.test.sh`); **mutation-checking the guards but skipping spt's full `*.mutants.json`
formalism** (discharges our own "an unproven guard is unproven however green" rule at the lean end);
**CI deferred** (fps ships with none; add it with a deploy target, as Peerloop/spt did). Thin-by-default
and island-only testing keeps this from over-building for a mostly-static site (`DEC-000-7`).
**Consequences:** Two board rows created — `[HARNESS-TESTS]` (actionable now) and `[SITE-TEST-SETUP]`
(parked on `[SITE-SCAFFOLD]`). Most of the stack materialises at scaffold time; the harness aggregator +
mutation-checked guards can proceed independently now. Every deferral (PLATO, Playwright, CI, D1 test
helper) sits behind a named trigger (here and in `_cc/PLATO.md`). Complements `DEC-003-1`; not a
supersession.

### DEC-003-1 — Defer PLATO for fgw-26; document the adoption playbook
**Decision:** Do not build a PLATO-style journey runner for fgw-26 now. Start browser/UI testing with
Vitest + React Testing Library on jsdom for components, and the `/chrome` bridge used ad hoc for visual
checks. Capture the full "what PLATO is / when to adopt / how to adopt" playbook in `_cc/PLATO.md` so
the deferral is revisitable. Browser testing still models on Peerloop's quadrant division of labour
(unit/API → PLATO → bridge-scripted UI walk → sparse Playwright) — only the PLATO layer is deferred.
**Rationale:** PLATO (Peerloop's Platform Action Test Orchestrator) proves that one endpoint's output
is valid input to the next across a *deep, data-accumulating* user journey; its value scales with
journey depth. fgw-26 is a marketing site whose journeys are thin (view → read → CTA/contact), so the
full runner/persona/scenario/`SqlTopUp` apparatus is unjustified weight (`DEC-000-7` lean). Rejected:
A) adopt the full four-layer model incl. PLATO from the start (apparatus over-built for current scope);
B) borrow only the pattern now — PLATO-style step defs scripting the `/chrome` bridge walk — without the
runner (still premature with no real journeys; retained in `_cc/PLATO.md` as the *middle path* to reach
for first once journeys appear).
**Consequences:** Near-term UI verification is an ad-hoc bridge walk, not a scripted/repeatable one — a
known gap, with the trigger conditions for closing it recorded in `_cc/PLATO.md` (a server-gated
multi-step journey, a need for realistic seed data, or the bridge walk becoming repetitive/regression-
prone). The Peerloop quadrant model is adopted as fgw-26's browser-testing frame minus the PLATO layer.
Revisit at `[SITE-SCAFFOLD]` and whenever a trigger fires.

## Conv 002

### DEC-002-1 — A/B Stop guard: read `last_assistant_message`, assess only the ask block
**Decision:** `check-ab-options.sh` no longer parses the transcript. It reads the turn text from the
`last_assistant_message` field CC passes to the Stop hook, isolates the **ask** — everything after the
*last* `👉👉👉` anchor (`${text##*"$anchor"}`) — and requires both an `A)` and a `B)` label within that
block. A durable 15-case test suite (`.claude/hooks/check-ab-options.test.sh`) covers the behaviour.
DEC-001-1's decision (enforce A/B via a Stop hook) still stands; only the mechanism changes — this is
not a supersession.
**Rationale:** The Conv-001 hook used `tail -n1` on the transcript, which CC writes asynchronously and
lags behind the live conversation (documented behaviour). Observed live in Conv 002: it read a prior
`thinking` record (empty text → silent miss, the false negative) and, on the next turn, a stale earlier
message (fired citing the wrong turn, the false positive). `last_assistant_message` is the documented,
race-free source. Separately, scanning the whole message let a stray `A)`/`B)` in lead-up prose satisfy
the guard; scoping to the ask block targets the actual question, and using the *last* anchor (not the
first) keeps a `👉👉👉` merely mentioned in prose from mis-targeting it. Rejected: B) keeping transcript
parsing with a flush-wait (still racy, version-dependent); C) a `MessageDisplay` pre-render hook
(display-only — cannot block or regenerate the turn or change what the model sees, confirmed from the
CC hooks docs); D) splitting on the *first* anchor (a prose mention mis-targets the block — caught in
live verification, not by the tests).
**Consequences:** The A/B convention tightens: labelled options must sit in the trailing ask block —
**anchor first, then `A)`/`B)`** — so options listed *above* the anchor now (correctly) count as
non-compliant. The guard remains after-the-fact: it forces a corrective re-ask but cannot revise an
already-displayed turn (no CC hook can — the only pre-display hook, `MessageDisplay`, is display-only).
Re-run the test suite after any change to the hook. DEC-001-1 is not tombstoned; its handle still
resolves.

## Conv 001

### DEC-001-2 — Capture the operator's turns verbatim via a UserPromptSubmit hook
**Decision:** A `UserPromptSubmit` hook (`.claude/hooks/capture-turn.sh`) appends each operator prompt
verbatim as one JSON line to the untracked `.conv-turns.jsonl`; `/r-end` renders those into a per-conv
dialogue companion (`docs/convs/.../Conv NNN — dialogue.md`, specced in `reference/CONV-FORMAT.md`) and
deletes the `.jsonl`. The hook gates on `.conv-current`, writes only to files (never stdout — a
UserPromptSubmit hook's stdout enters context), and fails open.
**Rationale:** `## Progress` only summarizes; the back-and-forth that shapes the project was being lost
(Conv 000's companion was hand-built). Surveyed all three siblings: FPS captures nothing (what fgw
inherited); Peerloop uses a manually-maintained `.scratch/conv-turns.md` plus a separate transcript
viewer; SPT auto-captures via a `UserPromptSubmit` hook. Chose SPT's hook model — capture must not
depend on live discipline (the thing that failed on A/B this same conv). Rejected: B) Peerloop's
manual log; C) a transcript-scraping viewer tied to CC's undocumented JSONL format.
**Consequences:** New hook + a `/r-end` render/drain step + a `CONV-FORMAT.md` companion spec (weighed
against `DEC-000-7`: lean — one `jq`-writing shell hook, not SPT's multi-type `event.js` Node system).
Capture only runs inside an open conv. If CC's UserPromptSubmit payload shape changes, the hook's
`.prompt` read breaks — health-logged to `.scratch/hook-health.log`, not silent.

### DEC-001-1 — Enforce the A/B question format with a Stop hook, not willpower
**Decision:** A project Stop hook (`.claude/hooks/check-ab-options.sh`, registered in
`.claude/settings.json`) inspects the last assistant turn; if it ends with a `👉👉👉` question but
presents no labelled `A)`/`B)` options, it blocks the stop (exit 2) and feeds the lapse back to be
re-asked. The `👉👉👉` anchor (CLAUDE.md "Interaction model") is the detection handle. Permission asks
count — every `👉👉👉` question must offer labelled options. The hook fails open and has a
`stop_hook_active` loop guard (at most one forced correction).
**Rationale:** The A/B rule already lived in `CLAUDE.md` and was still violated in-conv; "I'll apply
it going forward" is the same judgment that just lapsed, so only a check outside that judgment is
worth anything. Rejected: B) relying on manual enforcement (the trust that already failed).
**Consequences:** New process artifact (weighed against `DEC-000-7` lean-process: small, single-purpose,
self-testing). Takes effect once the session reloads hook config. If the anchor convention changes,
the detection handle changes with it.

---

## Conv 000 — bootstrap (manual setup, predates the lifecycle)

### DEC-000-7 — Keep the process lean by policy
**Decision:** The conv/documentation methodology is kept deliberately lean. Prune `CLAUDE.md` past
~120 lines; treat the documentation apparatus as a cost; verify in the running product, not just in
tests; a green check is not proof.
**Rationale:** The sibling projects' scars: SPT cut its `CLAUDE.md` 96% (1,009→41 lines) after it
over-grew, and in one stretch its harness out-committed its product 22:2; Peerloop shipped a silent
14% icon shrink because a page was never live-verified. The method should practice what the new site
preaches. Rejected: porting fps's full ~150-line rule set and five-skill surface verbatim.
**Consequences:** Skills and `CLAUDE.md` are trimmed adaptations, not copies; `r-vocab` and the
vault/sensitive/MCP machinery were dropped; `dep-check`/`dist-check` deferred until `fgw-26` exists.

### DEC-000-6 — Site thesis: judgment over commoditized code
**Decision:** The new frasergorrie.com positions Fraser as the "route planner and helmsman" whose
44 years of judgment steer AI-driven development — understanding client needs and knowing when a
solution will actually work. It retires the legacy site's "NoCode-First for everything" framing and
updates "40 years" to 44.
**Rationale:** In the AI age, writing code is commoditized; judgment is not. The evidence base
(`discovery/`) supports the judgment thesis far better than a capabilities list. Rejected: carrying
forward the NoCode-strategist positioning (dated, and undersells the differentiator).
**Consequences:** Site copy is built from the `EVIDENCE-LEDGER.md` proof-points; messaging must avoid
reading as "not technical." Style/theme to be decided separately (marketing site, broad appeal).

### DEC-000-5 — Full decisions + learnings + generated digest from day one
**Decision:** `DECISIONS.md` (numbered, tombstoned), per-conv learnings records (`docs/convs/`), and
the generated `DECISIONS-DIGEST.md` are all set up from the start — not deferred until the record is
large.
**Rationale:** Going back into the decision record to chart local choices is where both parties
benefit; the digest is how that scan stays cheap as the record grows. Rejected (my initial
recommendation): defer the digest until the record is big — the user wants the mechanism in place from
conv one.
**Consequences:** `gen-decisions-digest.sh` ported and run from Conv 000; `/r-end` regenerates the
digest whenever `DECISIONS.md` changes.

### DEC-000-4 — Single-file task board to start
**Decision:** The board is one file, `CURRENT-TASKS.md`, with sections 🔥 Ordered / 📋 Unordered /
⏸️ Parked / ✅ Completed this conv.
**Rationale:** A new, small project does not need fps's two-file Ordered/Unordered split; lean first.
Rejected: fps's `CURRENT-TASKS.md` + `UNORDERED-TASKS.md` split.
**Consequences:** Split into two files only if the single board demonstrably earns it.

### DEC-000-3 — Conv lifecycle adapted from fps (most current)
**Decision:** The session methodology is adapted from **fps**, the most current of the sibling
lifecycles: skills `r-start` / `r-commit` / `r-end` / `r-hopper`, plus `conv-state.sh` and
`gen-decisions-digest.sh`. Skill names kept as-is.
**Rationale:** fps is the latest iteration of the pattern used across fps/Peerloop/SPT. Keeping the
names avoids needless divergence. Rejected: rebranding the skills; porting from the older
Peerloop/SPT variants.
**Consequences:** `r-vocab` (fps PKM-specific) not ported; vault/sensitive-egress/MCP machinery and
the decile/sweep scaffolding dropped; the global `SessionStart` machine-detection hook is reused.

### DEC-000-2 — Dual-repo control
**Decision:** `fgw-26-docs` is the project home and governs the website code repo `fgw-26`; the
lifecycle commits and pushes both. `frasergorrie` (the legacy site) is read-only reference and is
never committed or pushed by the lifecycle.
**Rationale:** Mirrors the proven `fps-docs`/`fps`, `peerloop-docs`/`Peerloop`, `spt-docs`/`spt`
pattern. Rejected: a single combined repo; treating `fgw-26` as the home.
**Consequences:** `--add-dir ../fgw-26 --add-dir ../frasergorrie` on launch; skills stage by name
across the two owned repos only.

### DEC-000-1 — Tech stack: Astro + Cloudflare Workers + Tailwind v4 (latest)
**Decision:** The website is built on Astro (SSR, Cloudflare adapter) deployed to **Cloudflare
Workers**, with **Tailwind v4** (CSS-first, via `@tailwindcss/vite`), on latest package versions.
**shadcn/ui** is under consideration for styling consistency (React islands + Tailwind + CSS-variable
theming). TypeScript throughout; Vitest; ESLint + Prettier; wrangler exact-pinned.
**Rationale:** Adopts peerloop/SPT's battle-tested stack decisions (Workers over Pages — the adapter
dropped Pages; exact-pin wrangler to dedupe Miniflare). shadcn's copy-in, CSS-variable model suits a
style-guide + theme. Rejected: Cloudflare Pages; the legacy Next.js/Chakra stack; Vercel.
**Consequences:** Marketing site may not need `output: 'server'` (could be mostly static + a Worker
only if a form/endpoint appears); shadcn to be weighed against JS weight during the style discussion.
Concrete versions pinned when `fgw-26` is scaffolded.
