# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop / carry) before `/r-end`.
The durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] **DEC to record at /r-end (Conv 058) — social-post rigor machinery.** Built `POST-CREATE.md` +
  `POST-REVIEW.md` + the `r-post` skill + `_cc/content-backlog.md` (channel-tagged `[all]`/`[LinkedIn]`/`[X]`,
  extensible to Substack / YouTube Shorts). Chose A (build the machinery up front) over lightweight B.
  Process/design decision.
- [ ] **DEC to record at /r-end (Conv 058) — funnel website-only + one-link-per-post.** Dropped the
  Conv-038 LinkedIn → X downstream cross-link (LinkedIn and X are now parallel confirmation layers, each
  linking only to the site). Added the one-outbound-link-per-post social-copy convention (operator: more
  than one link reads salesy). Records as an amendment/supersession of the Conv-038 channel design — check
  the relevant Conv-038 DEC for tombstone-vs-amend when distilling.
- [ ] **DEC to record at close (Conv 058) — `check-promises.sh` trigger 2.** Added a close-deferral
  trigger: the phrase deferring work to the conv close now fires the Stop hook (independently-tunable
  branch; 7 test cases pass). Operator-directed — the session repeatedly used the phrase with no hook
  catch. Known tuning item: a purely descriptive process reference also fires (living regex).
- [ ] **DEC to record at close (Conv 058) — content prose-home split (B) + content-analytics process.**
  Prose lives in a file from draft-time: social posts → `docs/content/posts/<slug>.md` (docs repo);
  guides/articles → `src/content/` (site repo, `draft:true`); the board row is a lightweight dossier/pointer.
  Adopted for posts **and** articles. New standing content-analytics process — per-piece **Outcomes** section
  + `_cc/content-analytics.md` rollup + `[CONTENT-ANALYTICS]` row, riding the 9-conv GSC cadence;
  qualitative-first with **likes tracked as an early-phase readership proxy** (operator). Amended the
  hour-old `POST-CREATE`/`POST-REVIEW`/`r-post` + the `GUIDE-REVIEW` dossier template + CHANNELS measurement.
- [ ] **DEC to record at close (Conv 058) — post draft candidates stored as plain prose (no blockquote/
  markup).** Draft candidates live in `docs/content/posts/<slug>.md` as **plain prose** so the operator can
  copy a block, edit it, and hand it back without stripping markup (CC stays sole editor). Already written
  into `POST-CREATE.md` step 4 so future candidates are set the same way; this line records the convention.
  Precedent: `GUIDE-REVIEW` step 1 / `DEC-054-1` (markup-stripping on pasted rewrites).
- [ ] **DEC to record at close (Conv 058) — no video on social posts (general rule).** Text + at most one
  image; video off by default (quiet-editorial voice, avoid a high-maintenance cadence). Added to CHANNELS
  social copy conventions.
- [ ] **DEC to record at close (Conv 058) — standing authorization: CC drives social via the Chrome bridge.**
  Operator durably authorizes CC to drive **all** social posts + checks (LinkedIn, X) through the Chrome
  bridge; operator keeps Chrome open + logged into X and LinkedIn (separate tabs). Codify in CLAUDE.md
  (Permissions/Tooling). Final irreversible publish click still surfaced for operator review on a first-of-kind.
- [ ] **DEC to record at close (Conv 058) — standing rule: keep staging updated.** After a prod deploy (and
  at /r-end), also run `deploy:staging` so staging mirrors prod. Operator-directed. Codify in CLAUDE.md.
