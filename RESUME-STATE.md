**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 042 built the guide/article **illustration programme** (`[CONTENT-ART]`) and its **image-provenance
architecture** (`[IMAGE-PROVENANCE]`). Approach (`DEC-042-1`): public-domain natural-history **line
engravings** (not photos/AI — a naturalist's plate already does the diagnostic interpretation tracing a
photo can't), cleaned as a raster engraving, a **square detail tile** in-page + a **full-plate colophon**;
no light/dark theming (fixed background). Data model (`DEC-042-2`): co-located `provenance.json` per
`fgw-26/src/content/images/<id>/`, validated by one central Zod schema (one source → many kept treatments;
folder = id), single-repo. First image **`conus-marmoreus-lister`** (Lister *Conus marmoreus*, PD) is built
and **rendering on the Trust guide** (square + colophon), verified in dev. Trust guide prose is now **final**.

## Next action

**Images for the Steering and Deciding guides** — same recipe (operator sources a PD line engraving → picks
a diagnostic square crop → gentle cleanup → folder + `provenance.json`). With those two guides' prose, that
is what the `[SITE-CONTENT-HOME]` flip waits on. Separately, `[IMAGE-PROVENANCE]` wants a build/commit
**guard** (nothing fails today when an image lacks provenance) + a **usage cross-reference** — design-heavy,
sequence after the images are flowing. Prod deploys remain banned until the content home is finalised
(`[PROD-DEPLOY-BAN]`).

⚠️ **Human carry-over (still open):** the operator is to **send Gabriel the LinkedIn recommendation request**
(note + draft in `_cc/linkedin-makeover.md`) — unchanged.

## 🔬 Carried findings

_None._
