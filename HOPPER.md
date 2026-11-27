# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop / carry) before `/r-end`.
The durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] **[CARRY → next conv — the NEXT BUILD] On-site type-filtered content library (POSSE) (operator, Conv 061).** Give every content piece a home on the public site (`fgw-26`) + a listings/search UI that filters by **type** (Articles / X Posts / LinkedIn Posts / Substack articles / …). POSSE: the site holds the canonical copy, social is syndication — so link-less social posts (good for reach) still get a permanent, findable on-site home. Reuses the pipeline `type`/`track` field as the facet. New pieces: a site content collection for posts (post text → a real page), a faceted listings page (type facets + search / subset-selection), canonical/SEO handling (site copy canonical; X/LinkedIn copies point back), a dossier→site-content path. Completes the opt-in **post↔article relationship** (option A, Conv 061: `related_article` / `related_posts`, `links_out` per-post toggle). Open as its own design thread next conv.
- [ ] **Wire `/r-post` + `/r-content` to the pipeline model (Conv 061).** (a) Scaffold dossier frontmatter at creation — `type`/`track`/`status: drafting`/`pillar`/`slug` (+ the `stats:` stub for posts: status active + due from the channel horizon) — so `/r-content-pipeline` + `/r-post-stats` never see a "missing fields" item. (b) An idea graduating out of `_cc/content-backlog.md` should delete its backlog row as the dossier is created (keep single-source). (c) Update the stale wording: `r-post` line 54 + `CHANNELS.md` (content-backlog is now the **backlog/ideas** tier only, not seeds→drafts→published). Edits: `.claude/skills/r-post/SKILL.md`, `.claude/skills/r-content/SKILL.md`, `reference/CHANNELS.md`, maybe `reference/POST-CREATE.md`.
