**Conv:** 052 ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 052 ran the **Deciding guide's points round-trip**: the operator augmented
`.scratch/deciding-points.txt` paragraph by paragraph (P2 capacity drop, P3 naive framing, P5 pure-gold +
candor relocation, P8 lead-in, P18 sharpening, P22 heading → "What do I keep, rebuild, or hand off?", P23
third option, P24 rewrite) while CC seeded **four arc reinforcements** + the **P3→P6 naive→judgment** arc.
CC then wrote the **second draft** (a single whole-draft pass, build-clean, still `draft:true`/dark;
GUIDE-CREATE step 6c). Interleaved: a **sticky-together guide aside** (`DEC-052-2`, fixing the disappearing
glossary), a **colophon `year`** (`DEC-052-3`), the **retitle + snippet** rework, and process hardening —
the **lint-hopper rule** (`DEC-052-1`) and the **breadcrumb/intent-not-prose** principle (`DEC-052-4`).
`[DOSSIER-FORMAT]` is now the active pipeline-capture point (operator: "the pipeline is the product").

## Next action

🔴 **Deciding's second draft awaits the operator's whole-piece read** (GUIDE-REVIEW step 1) —
`src/content/guides/build-it-yourself-or-bring-someone-in.md`, rendered dark at
`/guides/build-it-yourself-or-bring-someone-in/` (restart `astro dev` from `fgw-26` if needed). After the
read, apply edits, then continue the finalize pass (steps 2–15). The `[GUIDE-DECIDING]` board row holds the
full state + the piece dossier.
⚠️ The `.scratch/deciding-view.txt` coordinate view is **stale** (the second draft moved past it) —
regenerate with `node scripts/number-content.mjs <file>` (from `fgw-26`) when block-addressing is needed for
the redline. ⚠️ `.scratch/` is gitignored: `deciding-points.txt` / `deciding-view.txt` live only on this
machine's checkout (the durable record of their decisions is on the board row).
Hopper carries **1** item: the 3-cornerstone interlink (gated on Deciding finishing) — run `/r-hopper` next conv.

## 🔬 Carried findings

_None._ (The 3-cornerstone interlink is a **hopper** carry, not a carried finding. The COLOPHON.md field-list
staleness found during this close was fixed in place, Conv 052.)
