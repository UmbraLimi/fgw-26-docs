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

3. **Seed capture** `[all]` — log the seed + chosen angle in `_cc/content-backlog.md` (seeds → drafts →
   published), so the backlog stays the durable index.

4. **Create the post file** `[all]` — `docs/content/posts/<slug>.md` in **fgw-26-docs**. Social posts are
   not site content, so they live in the **docs repo** (unlike guides/articles, which draft in `fgw-26`
   `src/content/`). Frontmatter: `slug`, `channel`, `pillar`, `status: draft`, `link_target`, `created`,
   `published:` (empty). Body = the **draft prose** + an **Outcomes** section stub (capture set in
   `_cc/content-analytics.md`). This file is the post's durable prose home from draft → published; the
   board row stays a lightweight dossier/pointer to it.
   🔴 **Store the draft as plain prose — no blockquote (`> `) or decorative markup.** The operator copies
   a block to send a rewrite back, and any markup rides along as friction to strip (CC remains the sole
   editor). Plain prose keeps the copy-edit-return loop clean (markup-stripping precedent, `GUIDE-REVIEW`
   step 1 / `DEC-054-1`).

5. **Draft** — write the post *into the file*, to the channel's register:
   - `[LinkedIn]` — positioning / credibility register (the look-you-up moment). Complete sentences
     (`CHANNELS.md` social conventions). A biweekly pillar post. **One outbound link, to the site** (a
     guide / the hub / contact) — never to X; one link per post (`CHANNELS.md`, Conv 058).
   - `[X]` — personality / point-of-view register (the warming moment), **adapted opportunistically from a
     LinkedIn piece with a personable angle** — X keeps no schedule of its own. Lean; no long-form (that
     lives on the site). Attach a visual as **media** (X renders no link card). **One outbound link, to
     the site**; not cross-referenced from LinkedIn (the channels don't cross-link).

6. **Hand to the finalize pass** — the draft goes through `POST-REVIEW.md` before it can publish.

## Not here
The live guides/articles the posts point to are built via `GUIDE-CREATE.md` / `GUIDE-REVIEW.md`. This pass
is the **post** only. Image/colophon workflow (`COLOPHON.md`) applies only if a post carries bespoke art;
most posts reuse an existing asset (the branded og-image, a guide's square tile).
