# Repo layout — fgw

Detail behind `CLAUDE.md` §Repos & paths. The rules that must be followed every command stay in
`CLAUDE.md`; this is the map.

## The repos

| Repo | Path | Remote | Holds |
|---|---|---|---|
| `fgw-26-docs` | `~/projects/fgw-26-docs` | `UmbraLimi/fgw-26-docs` | **Project home** — docs, `DECISIONS.md`, conv records, `.claude/`, `CLAUDE.md`. CC launched here. |
| `fgw-26` | `~/projects/fgw-26` | `UmbraLimi/fgw-26` | The **website** (Astro / Cloudflare Workers / Tailwind — `DEC-000-1`). |
| `frasergorrie` | `~/projects/frasergorrie` | `UmbraLimi/frasergorrie` | The **legacy** frasergorrie.com (Next.js). 🔴 **Read-only reference — never committed or pushed by the lifecycle.** |

**Dual-repo control** (`DEC-000-2`): `fgw-26-docs` governs `fgw-26`, mirroring the proven
`fps-docs`/`fps`, `peerloop-docs`/`Peerloop`, `spt-docs`/`spt` pattern. The conv lifecycle commits and
pushes `fgw-26-docs` + `fgw-26`; `frasergorrie` is never touched.

## Launch

The `fgw` shell function (in `~/.zshrc`, machine-local):

```bash
cd ~/projects/fgw-26-docs && claude --add-dir ../fgw-26 --add-dir ../frasergorrie
```

It runs behind the cross-project launch guard (refuses to start fgw from inside another project's tree).

## Single-machine

fgw runs on **MacMiniM4Pro** (per the global `SessionStart` machine-detection hook, shared with the
sibling projects). `.conv-current` is machine-local and untracked; the `Machine:` commit trailer is
provenance. If a second machine is ever adopted, revisit the lifecycle guards.

## Origins & evidence

Project discovery lives in `discovery/` — `EVIDENCE-LEDGER.md` (competence base + publishability map)
and `WORKING-METHOD.md` (how Fraser and AI work together, with the honest caveats). The methodology
here is adapted from **fps** (the most current of the sibling lifecycles), deliberately lean
(`DEC-000-3`, `DEC-000-7`); `r-vocab` and the vault/sensitive/MCP machinery were not ported.
