# Colophon — image sourcing for guide/article art (fgw)

The **central lookup** for sourcing the public-domain imagery that illustrates guides + articles: the
go/no-go **criteria**, and **where to find** the plates. Centralized Conv 047 (`DEC-047-5`) so the
criteria + source list live in one place instead of scattered across convs.

> **Division of labour.** This doc = *criteria + where to find*. The copyright tiers (PD vs CC-BY vs
> implied-license), the one real risk, and the **treatment/cleanup recipe + square-tile/colophon
> architecture** live in `_cc/content-art-and-copyright.md` (`DEC-042-1`, `DEC-042-2`) — not duplicated
> here. Per-image provenance is captured in `src/content/images/<id>/provenance.json` (`fgw-26`).

## Criteria (go / no-go)

1. 🔴 **License = PUBLIC DOMAIN / CC0 only.** Verify on the actual source page. **Reject** CC-BY,
   CC-BY-SA, and any dealer/stock page (Alamy, Getty, Pinterest, print sellers) — those are **not** PD
   evidence. This is the only load-bearing criterion (`DEC-042-1`; tiers in the content-art doc).
2. **Medium = line / copperplate ENGRAVINGS** (for now — operator, Conv 047). Not photos, not AI, not
   heavy colour lithographs. A **hand-coloured** engraving is a *caveat*, not a bar: the cleanup recipe
   desaturates it to the warm duotone, but the engraved line reads less purely than an uncoloured plate —
   surface it for a conscious call.
3. **Era = similar vintage** to the first image (Lister, *Historiae Conchyliorum*, ~1685). 17th–18th c.
   preferred. A **soft preference, not a gate.**
4. **Subject verified by VIEWING the actual image** — never a title/filename match alone (scar Conv 047:
   a "Seba starfish" plate was actually opossums).
5. **Resolution is NOT a gating criterion** (operator, Conv 047) — low-res is fine; higher is a
   nice-to-have. (Earlier sourcing aimed ≥1500px; that is now a preference, not a requirement.)
6. **"The art in the form."** Choose for pattern / texture / radial form — the species as a *window of
   detail*, not the species-as-subject (content-art doc).

## Square detail tile — what to crop (operator, Conv 047)

The in-page **square** (the zoomed-in detail, distinct from the full-plate colophon at the page foot) is
chosen to **intrigue, not to label**. Prefer:
- the **most ventral / most distinctive feature** of the animal, or
- the **most intriguing** crop — one that teases the reader to scan **down** to the full colophon plate to
  check whether they guessed the animal right.

So an **abstract, pattern-forward** crop that *withholds* the whole-animal read is usually better than one
that gives the species away at a glance. (The colophon at the foot is where the reveal happens.)

## Colophon (full plate) — display size

The full-plate colophon at the page foot renders inside a **bounded box (~384 × 360px)** — `max-w-sm` +
`max-h-[360px]` with `object-contain` — so that **landscape and portrait plates occupy a comparable
footprint** (a landscape plate fills the width; a portrait plate fills the height; both fit the same
envelope). Width-only capping is wrong: a tall portrait plate at a fixed width runs ~2× the height of a
landscape one. Standard set Conv 047 (Linck star = portrait vs Trust Conus = landscape). Wired in
`fgw-26` `src/pages/guides/[slug].astro`.

🔴 **Treatment consistency (Conv 047):** the colophon and the square tile **share one treatment** (the
same duotone/cleanup recipe) so the pair reads as one designed object. Don't leave the colophon raw while
the tile is treated — a raw-sepia plate under a duotone tile reads as a mismatch (caught on the Steering
Linck image; both Trust and Steering now duotone both elements).

## Where to find (compilations)

- **Biodiversity Heritage Library** — [biodiversitylibrary.org](https://www.biodiversitylibrary.org)
  (+ its Flickr, + the underlying Internet Archive scans). Richest well-scanned source of historical
  natural-history plates.
- **Wikimedia Commons** — [commons.wikimedia.org](https://commons.wikimedia.org); search categories
  (e.g. `Category:Asteroidea`, or the work's category). **Cite the `File:` page + the "Original file"
  URL.**
- **Internet Archive** — [archive.org](https://archive.org); the `/download/<item>/page/n<N>.jpg`
  endpoint serves a full-resolution leaf.

## Works drawn from (running list — add as used)

| Work | Date | Subject matter | Status |
|---|---|---|---|
| Martin Lister, *Historiae Conchyliorum* | c.1685–92 | shells (mollusca) | **USED** — Trust guide (*Conus marmoreus*) |
| J. H. Linck, *De Stellis Marinis* | 1733 | dedicated starfish atlas | candidate — Steering |
| Albertus Seba, *Thesaurus* (*Locupletissimi…*) | 1734–65 | vol. 3 = echinoderms / sea stars | candidate (hand-coloured scans) |
| *Tableau encyclopédique et méthodique* | 1791 | echinoderms, cephalopods, &c. | candidate — Steering (Asterias pl.) |
| G. W. Knorr, *Delights of the Eyes and Mind* | 1760s | shells, marine life | not yet used |
| Jonston / Merian, *Historia Naturalis* | 1657 | closest to Lister's era; clean PD scans scarce | not yet located |

## Workflow notes

- 🔴 **Candidate images the operator must see go in `.scratch/`** (the repo, named with provenance), never
  only the session temp dir (`DEC-047-4`). A **chosen** image is then promoted to
  `src/content/images/<id>/` + committed to be durable (`DEC-042-2`).
- Capture provenance at selection: `source { title, work, license, credit, sourceUrl, accessed, file }`
  per `provenance.json` (see an existing entry under `src/content/images/`).
