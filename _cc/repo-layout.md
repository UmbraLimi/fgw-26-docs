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

## Dev environment — Node

`fgw-26` requires the Node version in `fgw-26/.nvmrc` (24.22.1; Astro's floor is ≥22.23.4). Three layers
hold the line: `.nvmrc` (the pin), `engine-strict=true` in `.npmrc` (install-time floor), and
`scripts/check-node.mjs` run from the `pre*` npm hooks (run-time floor — `npm run dev`/`build`/`verify`
fail loud below it).

🔴 **The nvm `default` alias must be ≥ the floor** — set to **24.22.1** (Conv 011). It had been `22.19.0`,
so every new shell nvm-activated a below-floor Node and `verify` died in `astro check` until a manual
`nvm use`. Fix: `nvm alias default 24.22.1`. The alias is machine-local (`~/.nvm`), so a rebuilt or new
machine must re-set it. The `.zshrc` deliberately warns on an `.nvmrc` mismatch but does **not**
auto-switch — a kept global choice; the correct default makes it rarely fire.

## Origins & evidence

Project discovery lives in `discovery/` — `EVIDENCE-LEDGER.md` (competence base + publishability map)
and `WORKING-METHOD.md` (how Fraser and AI work together, with the honest caveats). The methodology
here is adapted from **fps** (the most current of the sibling lifecycles), deliberately lean
(`DEC-000-3`, `DEC-000-7`); `r-vocab` and the vault/sensitive/MCP machinery were not ported.
