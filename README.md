# fgw-26-docs — project home for the frasergorrie.com rebuild

This is the **documentation / project-management repo** for the new frasergorrie.com ("fgw", for
2026). It is where Claude Code is launched, and it holds the design, decisions, methodology
(`.claude/` skills + scripts, once they land), and the discovery research for the project.

## Repo topology

| Repo | Role |
|---|---|
| **`fgw-26-docs`** (here) | Project home — docs, decisions, methodology, `.claude/`, `CLAUDE.md` |
| **`fgw-26`** | The website code (Astro / Cloudflare Workers / Tailwind) |
| **`frasergorrie`** | The **legacy** frasergorrie.com (Next.js) — reference only, being replaced |

Mirrors the proven `fps-docs` / `peerloop-docs` / `spt-docs` pattern: a docs repo that governs a
sibling code repo.

## Contents

- **`discovery/`** — the evidence base and working-method assessment compiled at project start:
  - `EVIDENCE-LEDGER.md` — honest inventory of prior projects as competence evidence, plus a
    publishability map and candidate site proof-points.
  - `WORKING-METHOD.md` — how Fraser and AI actually work together: the method, the strengths, and
    the honest caveats. The good and the bad, no illusions.
- `.scratch/` — gitignored, non-durable multi-conv working space (see its README).

_Last updated 2026-10-23._
