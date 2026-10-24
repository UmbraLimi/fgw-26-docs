# Decisions digest — fgw

🔴 **Generated — do not edit.** A deterministic projection of `DECISIONS.md`: each entry's heading + its `Decision:` gist (tombstones = heading only). Regenerate with `.claude/scripts/gen-decisions-digest.sh`; `/r-end` refreshes it when `DECISIONS.md` changed. Load THIS file to scan for precedent, then open the cited `DEC-NNN-N` in `DECISIONS.md` for the full Decision/Rationale/Consequences.

_As of 2026-10-23._

---

### DEC-000-7 — Keep the process lean by policy

The conv/documentation methodology is kept deliberately lean. Prune `CLAUDE.md` past
~120 lines; treat the documentation apparatus as a cost; verify in the running product, not just in
tests; a green check is not proof.

### DEC-000-6 — Site thesis: judgment over commoditized code

The new frasergorrie.com positions Fraser as the "route planner and helmsman" whose
44 years of judgment steer AI-driven development — understanding client needs and knowing when a
solution will actually work. It retires the legacy site's "NoCode-First for everything" framing and
updates "40 years" to 44.

### DEC-000-5 — Full decisions + learnings + generated digest from day one

`DECISIONS.md` (numbered, tombstoned), per-conv learnings records (`docs/convs/`), and
the generated `DECISIONS-DIGEST.md` are all set up from the start — not deferred until the record is
large.

### DEC-000-4 — Single-file task board to start

The board is one file, `CURRENT-TASKS.md`, with sections 🔥 Ordered / 📋 Unordered /
⏸️ Parked / ✅ Completed this conv.

### DEC-000-3 — Conv lifecycle adapted from fps (most current)

The session methodology is adapted from **fps**, the most current of the sibling
lifecycles: skills `r-start` / `r-commit` / `r-end` / `r-hopper`, plus `conv-state.sh` and
`gen-decisions-digest.sh`. Skill names kept as-is.

### DEC-000-2 — Dual-repo control

`fgw-26-docs` is the project home and governs the website code repo `fgw-26`; the
lifecycle commits and pushes both. `frasergorrie` (the legacy site) is read-only reference and is
never committed or pushed by the lifecycle.

### DEC-000-1 — Tech stack: Astro + Cloudflare Workers + Tailwind v4 (latest)

The website is built on Astro (SSR, Cloudflare adapter) deployed to **Cloudflare
Workers**, with **Tailwind v4** (CSS-first, via `@tailwindcss/vite`), on latest package versions.
**shadcn/ui** is under consideration for styling consistency (React islands + Tailwind + CSS-variable
theming). TypeScript throughout; Vitest; ESLint + Prettier; wrangler exact-pinned.

