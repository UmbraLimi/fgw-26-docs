**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 016 built **`[SITE-AI-SEO]`** (Phase 3) and deployed it to staging: a production AI-crawler policy
in the `robots.txt` endpoint (`DEC-016-1`), a new `/llms.txt` endpoint (Work section auto-generated), and
machine-readable facts (`FAQPage` on `/faq` + `OfferCatalog`/`knowsAbout` on the global JSON-LD, via a new
reusable `<head>` slot). While verifying in the running product, found and fixed a **live site-wide
"-12 years" bug** (`DEC-016-2`) — `YEARS_EXPERIENCE` was a module-top-level `new Date()` const, which the
Workers global scope reads at epoch 0; now `yearsExperience()` computed at call time, verified "44 years"
live. Added a **latent-`Date` eslint guard + a vitest test**. Staging held `noindex` throughout. Phase 3's
findable/fast leg is now: SEO ✅ (Conv 015), AI-SEO ✅ (Conv 016), perf still owed.

## Next action

**No un-gated CC build is queued** — both remaining ordered builds are gated:
- **`[SITE-PERF]`** (the last Phase 3 build) 🔴 **waits until all images are added** (operator, Conv 016) —
  the image-optimization leg needs the full image set first. Start it once the images land.
- **`[SITE-NARRATIVE]`** is content-complete but gated on **client sign-off** (production gate).
So the next moves are operator-owed: **add the full image set** (unblocks `[SITE-PERF]`) and **secure
client sign-off** (unblocks production). `[SITE-OG-IMAGE]` also still needs a design-asset/operator call.

⚠️ Production has **never been deployed** — everything verified this conv is on staging only; prod
robots/llms/AI-policy do not exist live until `[SITE-GO-LIVE]` (Phase 4).

## 🔬 Carried findings
_None._
