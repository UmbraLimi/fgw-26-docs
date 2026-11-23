# Content art & copyright — guide/article imagery (working doc)

> Working record for the **visual-art programme** on the content home (`[SITE-CONTENT-HOME]`): the art
> direction for guide + article imagery, and the copyright treatment that keeps the source photography
> clean. Durable homes for the *reasoning*: formal decisions → `DECISIONS.md`; the live task → a board
> row; voice/persona → `reference/`. This note holds the art direction, the copyright framework, and the
> vetted source shortlist so nothing lives only in chat. Opened **Conv 042**.
>
> ⚖️ **Not legal advice.** The copyright section is a practical working framework, grounded in the cited
> sources, not a lawyer's ruling. Each image's license is verified at the source before use.

## Status (Conv 042)

- Trust guide **prose final** and its **illustration built + rendering** (Conus; square tile in-page +
  full-plate colophon). **Steering's image is now done too** (Conv 047 — Linck sea star, duotone tile +
  cropped duotone colophon). **Deciding's image is now done too** (Conv 056 — Bloch *Esox lucius* pike,
  `esox-lucius-bloch`, the **first hand-coloured plate** in the set, duotone tile + cropped colophon). All
  three cornerstone guides are **graduated** (Conv 056); the flip now waits only on the **guides-only launch
  mechanics** (`[SITE-CONTENT-HOME]` flip + `[PROD-DEPLOY-BAN]` amend, Phase 2).
- **Approach settled (`DEC-042-1`):** PD natural-history **line engravings**, cleaned as a raster engraving,
  a **square detail tile** in-page + a **full-plate colophon**; no light/dark theming (fixed background).
  Got here via rejected experiments — photo-tracing a dragonfly head + a pimpleback mussel *reproduced*
  3-D/tonal noise, never *interpreted*; and a tonal lithograph (Conrad) is tone, not line. (See
  "Reproduction vs. interpretation" + "O'Reilly".)
- **Architecture built (`DEC-042-2`):** the `images` content collection + one central Zod schema, single-
  repo co-located. (See "Storage architecture" + "First image".)
- First image: **Lister, *Conus marmoreus*** (PD line engraving, Historiae Conchyliorum). [checked: Commons
  API, Conv 042]

## Art direction (locked so far, Conv 042)

- **Theme:** aquatic life, **North American** to start — the art *in* the form, not the species as a
  subject. Candidate motifs the operator named: a **dragonfly wing** (venation), **sunfish scales**
  (tessellation), a **swarm of whirligig beetles**.
- **Macro / close-up**, not whole-animal portraits.
- **Framed as a bordered square** — each image reads as a close-up seen through a window; a consistent
  1:1 tile across every guide and article.
- **Monochrome line art.** O'Reilly's colophon animals are the *loose inspiration* (good art, biology
  theme, unrelated to the piece's subject), **not** a template to reproduce.
- **One per guide and per article**, read as a single visual system.
- Optional **colophon-style line** at the foot naming what the image is (+ source credit) — echoes the
  O'Reilly colophon and sits naturally beside the glossary feature (`DEC-040-3`).

### Pipeline (unproven — proof-gated)

- No image-generation model is available in-tool; "AI-generated" here means a **programmatic pipeline**:
  photo → tone/edge processing → **trace to SVG** (`potrace` or `vtracer`). [checked: toolchain probe,
  Conv 042 — `potrace`/ImageMagick/`vtracer` all *not installed*; python3 present, no PIL/cv2]
- **Vector (SVG) is the right target for light/dark:** a single-ink SVG recolors with the theme via
  `currentColor`; a raster engraving would need two versions or a CSS invert. [inferred]
- **Fidelity risk:** automated tracing does bold line/pattern well and fine engraving hatching badly.
  The macro-pattern direction (wing venation, scales) plays *to* tracing's strength — a wing is line art
  already. [inferred — to be confirmed on the proof]
- 🔴 **Gate:** one operator-supplied photo → one bordered-square proof → judge on screen **before** adding
  the image field to the `guides` schema or committing the set. (Blog already has `heroImage` with
  `image()`; guides have no image field yet. [checked: `src/content.config.ts`, Conv 042])

## Copyright treatment — the framework

The whole risk sits in **one** place: whether a source image is *genuinely* public domain, not merely
publicly visible. Cropping to a portion and rendering B&W are unrestricted on a PD work and only make it
more transformed.

- ✅ **Public domain / CC0** — no copyright (expired, dedicated, or US-government work). Free; crop,
  recolor, trace, publish, sell; **no attribution legally required**. This is the only tier we source
  from.
- ⚠️ **CC-BY / CC-BY-SA** — *not* public domain. Attribution is **mandatory**; **ShareAlike** (SA)
  further demands the derivative carry the same license — a traced B&W derivative of a CC-BY-SA photo
  would inherit CC-BY-SA, which we do **not** want on the site. [inferred] Avoid SA entirely; accept
  plain CC-BY only with a deliberate credit.
- ❌ **CC-NC (noncommercial)** — the site is a business front; NC is unsafe. Avoid. [inferred]
- ❌ **"Found online"** — a modern macro photo is a new copyrighted work the instant it's taken; the wild
  subject doesn't make the *photo* free. Never source this way.

**Attribution:** not legally owed for PD/CC0, but a quiet colophon credit (source + "public domain") is
free good-faith hygiene and fits the format. Mandatory the moment anything CC-BY sneaks in.

**Two wrinkles:** (1) some museums/archives assert contract terms over their *scans* of PD works — in the
US a faithful scan of a flat PD work gains no new copyright (*Bridgeman v. Corel*) but the terms can still
bind by contract. [inferred] (2) Watch SA/NC as above.

## Reproduction vs. interpretation (Conv 042 — the core insight)

The pipeline *reproduces*: it converts the pixels of a real specimen — shadows, 3-D roundness, incidental
speckle — faithfully. A professional natural-history plate does the opposite: it *interprets*, drawing the
**diagnostic** features (countable fin rays, accented growth rings and bumps) and discarding incidental
tonal noise. A photo of a fin is mush; a drawing of the same fin lets you count the rays.

**Automated tracing cannot invent that interpretation** — it has no idea which lines are diagnostic vs. an
accident of lighting, so it renders everything, and "everything" on a 3-D object always reads as complex.
No blur/threshold tuning fixes this; the interpretation isn't *in* the photo to extract.

**Resolution: feed the pipeline input where the interpretation is already done** — public-domain 19th-c.
natural-history **engravings / lithographs** (BHL, Smithsonian CC0, old conchology/ichthyology plates). A
master illustrator already flattened the 3-D to essential line and accented the diagnostics; tracing clean
line art yields a clean vector that themes for free. Accurate, too (drawn by naturalists) — where an
AI-generated "illustration" would hallucinate the fin-ray count, the opposite of diagnostic.

**Limit:** works only when a good plate of the subject exists. Own photos / arbitrary specimens with no
historical plate still only *reproduce* under tracing — those need a human or commissioned illustrator.

## O'Reilly: copyright is clean, trade dress is the watch-item (Conv 042)

Using the **same PD source** O'Reilly draws from does **not** infringe O'Reilly:

- **Copyright — no issue.** A PD engraving is PD for everyone; O'Reilly holds no copyright in it. Two
  parties independently using a PD work is exactly what PD allows. One rule: source the **original** plate
  (BHL/Smithsonian), never O'Reilly's *redrawn* version (their adaptation could carry a thin derivative
  copyright). Same well, not their bucket.
- **Trademark / trade dress — the real, low-but-nonzero risk.** O'Reilly has strong, aggressively-defended
  trade dress in *"woodcut animal + cover format"* as a **source identifier in technical publishing**. The
  test is **likelihood of confusion** (would someone think this is an O'Reilly product / endorsed by them),
  not "did you use an animal engraving" (unownable). Most factors make it low for us: different goods (a
  consulting site, not books), no O'Reilly name/typography/cover template, our own layout + aquatic-macro
  framing.
- 🔴 **The one aggravator — why the worry is sound:** our content is **software guides.** Woodcut animal +
  *software* is O'Reilly's exact association; a software-advice site doing engraved animals stands in their
  niche in a way a nature blog never would.

**De-risking (safety and originality point the same way):**
- Prefer an **original aquatic line-art identity** (own style, no engraving mimicry; drop the "colophon"
  framing and any evocation of their cover) — sidesteps O'Reilly and is more distinctly Fraser's.
- If the engraving look is kept, keep the presentation unmistakably ours and never evoke the cover — manage
  the low risk rather than avoid it.
- A quick **IP-attorney read** is cheap insurance if leaning toward engravings.

## First image — locked treatment (Conus square, Conv 042)

Settled through live iteration (full trail in `docs/convs/`): **cleaned raster engraving**, not traced line
art; **square in-page tile** (a detail crop), **full plate in the colophon**. No light/dark theming — fixed
background, per operator.

**Locked recipe:**
- **Source:** Lister, *Historiae Conchyliorum* — *Conus marmoreus*, engraved by Anne Lister (1685–92).
  Public domain (pre-1931), via Wikimedia/Wellcome. [checked: Commons API, Conv 042]
- **Crop rule:** square, text-free, framed on the **most distinguishing feature** (operator chooses it).
  Here: operator-framed 1520×1520 on the shell's right side — tent reticulation + concentric ring-end +
  shadow to right/bottom; text- and frame-free.
- **Cleanup — gentle** (a heavier flat-field washed out detail and was rejected):
  `-colorspace Gray -contrast-stretch 0.3%x0.08% +level-colors '#2b2114','#efe7d2'`
  — even the paper, lift contrast lightly, warm duotone (dark-brown ink on aged cream).
- Final asset: `fgw-26/src/content/images/conus-marmoreus-lister/square.png` (1520²), committed Conv 042.
- ⚠️ `#efe7d2` cream is a **placeholder** — match the real site background token at integration.

## Storage architecture (decided Conv 042 — "C")

**Everything lives in `fgw-26`, co-located, one copy.** Per source image,
`fgw-26/src/content/images/<id>/` holds the **original** + **every kept treatment** (full-res masters) +
`provenance.json`. One central Zod schema (`content.config.ts` `images` collection; folder name = id).
Built + `astro sync`-validated Conv 042.

- 🔴 **Rejected: the docs/site split** (full provenance + masters in `fgw-26-docs`, only optimized-used in
  `fgw-26`). The leaner-build gain is **eaten by uneven cross-repo duplication that has to be managed** —
  two homes, a sync/generator step, drift risk. One repo, one copy, no sync beats a smaller build.
  (Operator's call; `DEC-042-2`.)
- **Optimization is not a treatment, and not committed.** Astro reads the committed master and emits
  optimized webp/avif into `dist` at build (ephemeral). We commit masters, never pre-optimized files.
- **Accepted tradeoff:** `fgw-26` carries full-res masters/originals, so the repo grows with the image
  library — accepted over the management cost of a split.

**Built Conv 042:** the `images` collection + schema; `conus-marmoreus-lister/` (`source.jpg` + `square.png`
+ `colophon.png` + `provenance.json`); the `guides` `image` ref; the guide page rendering the **square
tile** + **colophon** (species name + PD credit), verified in dev. **All three cornerstone images done**
(Steering `stella-marina-linck` Conv 047; Deciding `esox-lucius-bloch` Conv 056). **Still open:** the
site-wide provenance guard + usage cross-ref (`[IMAGE-PROVENANCE]`).

## Does Wikipedia already "follow this model"? (the operator's question)

**Partly — it's a reuse pool, not a pure-PD model.** Wikipedia's images live on **Wikimedia Commons**,
which requires a *free* license but accepts a **mix**: public domain, CC0, CC-BY, and CC-BY-SA — and
**rejects** all NC and ND licenses and fair-use. [checked: WebSearch — Commons:Licensing, Nov 2026]
So we **can** reuse "the same photographs" Wikipedia uses, but only by pulling the **PD / CC0 subset** and
verifying each file's tag; a CC-BY-SA Commons image would drag ShareAlike onto our derivative. Commons is
a *discovery + verification* layer, not itself a guarantee of public domain.

## Source shortlist — North American aquatic, PD/CC0 first

Vetted leads from the Conv-042 search; **verify each image's own credit line before use** (agency
libraries mix in credited contractor/third-party images that are *not* PD).

| Source | License model | Fit | Note |
|---|---|---|---|
| **USGS multimedia** (incl. Wetland & Aquatic Research Center) | "Public domain unless otherwise noted" | Freshwater/aquatic, North American | Strong, on-theme. [checked: WebSearch] |
| **USFWS** (`images.fws.gov` / National Digital Library) | US-gov public domain | N. American fish & wildlife | Check credited contractor shots. [checked: WebSearch] |
| **NOAA Photo Library** (`photolib.noaa.gov`) | NOAA-employee photos PD; external credited ones not | Marine (less freshwater) | Verify each credit. [checked: WebSearch] |
| **Smithsonian Open Access** | **CC0** | Biodiversity specimens + 15th–20th-c. illustration | Huge CC0 pool; more specimen/illustration than live macro. [checked: WebSearch] |
| **USGS Bee Inventory (BIML)** | US-gov public domain | **High-res macro insect** photography | Exactly "this model" — a US-gov lab doing PD macro. On Flickr. [inferred — not in this search; verify] |
| **Biodiversity Heritage Library (BHL)** | PD historical | Vintage natural-history *engravings* | If ever wanting real colophon-style plates. [inferred] |
| **Freshwater & Marine Image Bank** (UW, `content.lib.washington.edu/fishweb`) | Historical, public domain | Fish illustration | Historical plates, not photos. [checked: WebSearch] |
| **Wikimedia Commons** | Mixed (PD/CC0/CC-BY/CC-BY-SA) | Everything | Pull PD/CC0 subset only; verify each tag. [checked: WebSearch] |

⚠️ **Avoid as a default: iNaturalist** — many observation photos are **CC-BY-NC**, unsafe for a business
site; usable only after filtering to CC0/CC-BY and verifying per image. [inferred]

## Open / next

- [ ] Operator picks the first PD/CC0 photo (macro, high-contrast, clean separation) from a vetted source.
- [ ] OK to install the trace toolchain (`potrace` + ImageMagick), then run the single-animal proof.
- [ ] After the proof is judged: add an image field to the `guides` schema + light/dark `currentColor`
      render + optional colophon block, then wire the Trust guide image.
- [ ] Consider a dedicated board row for the art programme (currently tracked under `[SITE-CONTENT-HOME]`
      + the hopper proof line).
