# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop / carry) before `/r-end`.
The durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] **🚀 Deploy the Conv-062 `fgw-26` changes to prod + staging.** Two dark, build-verified changes await deploy: (1) author `@id` `url` → `/about/` (`src/layouts/Layout.astro:55`; `[SITE-STRUCTURED-DATA]`); (2) WCAG 2.5.8 target-size CSS on `.nav-link` / `.social-link` (`src/styles/global.css`; `[SITE-WCAG22]`). Run `npm run deploy` (prod) **and** `npm run deploy:staging` (keep-staging rule). **After deploy:** the official Google Rich Results Test on the 3 guide URLs + a 2.4.11 live keyboard-Tab spot check. 🔴 Until deployed, prod still serves the old author url + the undersized targets.


- [ ] **Tune `check-promises.sh` Trigger 2 — descriptive-mention false-fires (Conv 062).** The Conv-062 backtick fix (tolerate `` `/r-end` ``) had a side-effect: a turn that merely *discusses* the close now trips the nudge, because the backticked form I use when describing closing now matches. The existing exclusion only covers "ruling an existing item" phrasings, not "describing an already-captured hopper item." Consider broadening the exclusion (e.g. a turn that names a hopper/board artifact for the deferred item), or accept the noise. Known-but-deferred — the intermediate-message case stays out of scope (operator, Conv 062: the hook handles the current turn only).

- [ ] **Write the Conv-062 DECs at /r-end** (routed here instead of promised — the no-op-promise fix). Three decisions need `DEC-062-N` entries: (1) **pipeline-wiring model** — `/r-post` + `/r-content` scaffold full pipeline frontmatter at creation; posts carry a `stats:` stub filled at *publish* (`/r-post-stats` skips drafts); a graduating idea's backlog row is deleted at creation (single-source); `content-backlog` is the ideas tier only. (2) **Option-A guide-lifecycle shift** — the guide/article dossier `docs/content/<slug>.md` is born at `/r-content` as a `status: drafting` frontmatter stub and *fleshed out* at graduation (`GUIDE-REVIEW` step 17 fills, not creates). (3) **POSSE architecture D1–D5** (`[CONTENT-LIBRARY]` board row). Files touched: `r-post`, `r-content`, `POST-CREATE`, `POST-REVIEW`, `CHANNELS`, `GUIDE-REVIEW`, `CURRENT-TASKS`.

