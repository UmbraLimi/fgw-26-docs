# Social post — the creation pass (fgw)

One repeatable pass to take a social post from **seed** to **channel draft** — the analog of
`GUIDE-CREATE.md`, scaled to a short post. Consult `PERSONA.md`, `VOICE.md`, `CHANNELS.md` as relevant.
**Lean by intent: a checklist, not a gate** — "checked, clean" is a valid outcome, stated not skipped.

> **Channel-tagged, one document (`DEC` Conv 058).** Steps tagged `[all]` run for every channel; a
> `[channel]` tag (`[LinkedIn]`, `[X]`) marks a step or sub-note specific to one channel. **Channel-specific
> content shows *inside* the section it belongs to**, not in a separate doc. New channels (Substack,
> YouTube Shorts, …) add their own tag + sub-notes to the relevant steps — don't fork the document.

## The pass (in order)

1. **Pillar & angle** `[all]` — pick the pillar (trust | steering | deciding; the roadmap grows,
   `[PILLAR-ROADMAP]`) and the buyer-chord angle: validate the **wonder**, name the **unease**, never make
   AI scary — **empowering, not fear** (`PERSONA.md` "How they see AI"). Lead with usefulness/teaching, not
   credentials; signal selectivity, never hunger.

2. **Link target & funnel role** `[all]` — name what the post points *to* (a live guide, the `/guides/`
   hub, the site contact) and confirm the funnel direction is **toward the site** (`CHANNELS.md` flow).
   Social is a confirmation/qualification layer, not cold acquisition — don't write it as a lead magnet.

3. **Backlog reconcile** `[all]` — if this post **originated from a backlog idea** in
   `_cc/content-backlog.md`, **delete that idea's row** now — it is graduating to a dossier, and from here
   its state lives in the dossier `status:` frontmatter (single-source). A fresh post with no backlog row
   removes nothing. The backlog holds only the **`backlog` (ideas) tier**; everything from `drafting` on
   lives in the dossier (full pipeline → `/r-content-pipeline`).

4. **Create the post file** `[all]` — `docs/content/posts/<slug>.md` in **fgw-26-docs**. Social posts are
   not site content, so they live in the **docs repo** (unlike guides/articles, which draft in `fgw-26`
   `src/content/`). **Frontmatter — the full pipeline shape** (so `/r-content-pipeline` + `/r-post-stats`
   never meet a missing-fields item): `slug`, `type: post`, `track` (`x` | `linkedin` | …, derived from
   the channel), `channel`, `pillar`, `status: draft` (`# draft | approved | published`), `link_target`,
   `created`, `published:` (empty), `post_url:` (empty), and a **`stats:` stub** (schema in
   `/r-post-stats`). 🔴 **`stats:` values are filled at PUBLISH, not here** — `/r-post-stats` skips any
   post whose `status:` ≠ `published`; at publish set `status: active` + `due` = `published` + the channel
   horizon (LinkedIn ~pub + 14d · X ~pub + 48h, `_cc/content-analytics.md`). Body = the **draft prose** +
   an **Outcomes** section stub (capture set in `_cc/content-analytics.md`). This file is the post's
   durable prose home from draft → published; the board row stays a lightweight dossier/pointer to it.
   🔴 **Store the draft as plain prose — no blockquote (`> `) or decorative markup.** The operator copies
   a block to send a rewrite back, and any markup rides along as friction to strip (CC remains the sole
   editor). Plain prose keeps the copy-edit-return loop clean (markup-stripping precedent, `GUIDE-REVIEW`
   step 1 / `DEC-054-1`).
   🔴 **Readable `.scratch` copy-from surface (operator, Conv 060) — applies to every post, guide, and
   article.** CC also keeps a clean plain-text copy of the **current draft** at **`.scratch/<slug>-draft.md`**
   — just the readable post text (no frontmatter, no markup), so the operator can open it in a text editor
   and **copy from it**. 🔴 **The operator reviews there and pastes proposed changes back in chat — never by
   editing the `.scratch` file (CC is the sole editor, `DEC-024-1`).** CC applies each change to **both** this
   readable copy **and** the durable source (`docs/content/posts/<slug>.md`). The `.scratch` copy is a
   working mirror (gitignored — regenerate from source if lost), not the durable record. (DEC at /r-end.)

5. **Draft** — write the post *into the file*, to the channel's register:
   - `[LinkedIn]` — positioning / credibility register (the look-you-up moment). Complete sentences
     (`CHANNELS.md` social conventions). A biweekly pillar post. **One outbound link, to the site** (a
     guide / the hub / contact) — never to X; one link per post (`CHANNELS.md`, Conv 058).
   - `[X]` — personality / point-of-view register (the warming moment). **X-native content, not a LinkedIn
     adaptation (Conv 060):** spin the post from the **40-years Judgement thread** (grounded stories, candid
     misses, the throughline that the tool was never the interesting question), on X's own cadence (~monthly
     now, biweekly the goal). Lean; no long-form (that lives on the site). A personality post may carry **no
     link at all**; if it links, **one outbound link, to the site** (never to LinkedIn — the channels don't
     cross-link). Attach a visual as **media** if one is wanted (X renders no link card).

6. **Hand to the finalize pass** — the draft goes through `POST-REVIEW.md` before it can publish.

## Not here
The live guides/articles the posts point to are built via `GUIDE-CREATE.md` / `GUIDE-REVIEW.md`. This pass
is the **post** only. Image/colophon workflow (`COLOPHON.md`) applies only if a post carries bespoke art;
most posts reuse an existing asset (the branded og-image, a guide's square tile).
