# CURRENT-TASKS — fgw

**This file is the durable board state — CURRENT work only.** Keyed by `[CODE]` mnemonic (the sole
stable id; readable, hyphenated). One file, all sections (`DEC-000-4`); format from `fps-docs`
(`DEC-007-1`).

🔴 **Done work is not archived here (`DEC-000-7`, lean).** When a task completes, its row is deleted and
it drops to the one-line **✅ Completed tags** list at the bottom — the full record lives in the commit
messages, `DECISIONS.md` (`DEC-NNN-N`), and the per-conv records in `docs/convs/`. The board shows what
is **live**, not what is finished.

> **The board vs. the hopper.** [`HOPPER.md`](HOPPER.md) is spin-off capture — subject to scrutiny, not a
> commitment. A row here is a commitment. Hopper items are ruled at `/r-hopper` / `/r-end`.

---

## 🔥 Ordered

> 🎉 **Launch milestone done** — `[SITE-GO-LIVE]` ✅ Conv 032; the Conv-007 critical path is complete.
> **Post-launch presence thread** (added Conv 035): `[SOCIAL-MAKEOVER]` is now **✅ done** (LinkedIn Conv 036,
> X.com Conv 037). The two rows below remain: the standing **GSC monitor**, and the **posting plan** (now
> unblocked by the makeovers). Order as the operator listed them. **Added Conv 048:**
> `[DOSSIER-FORMAT]` leads the section (content-process; operator placed it ordered).

### [DOSSIER-FORMAT] · promoted Conv 048 · codify the richer graduated-dossier format into the process
📐 **From the Steering graduation (Conv 048).** `docs/content/steer-ai-to-build-what-you-mean.md`
introduced a fuller dossier than Trust's retroactive record — a **per-step finalize record** (§5), a real
**piece-decision home** (§6), plus **how-it-was-made** and **interlinks** sections. It worked well; the
operator wants Deciding "more rigorous still".
**Task:** bake this shape into the process so it's the standard, not reconstructed each graduation —
decide where it lives: `GUIDE-REVIEW.md` **step 15** (what "graduate" writes) and/or the **`r-content`**
dossier template (what the live board row accrues). The Steering dossier is the worked reference.
Ideally landed **before Deciding graduates** (Deciding starts next conv; its graduation is a few steps
out, so no rush to start). (Promoted Conv 048 from the hopper.)
🎯 **Conv 052 — now the active capture point for pipeline learnings** (operator: "the pipeline is the
product; the guide is the occasion"). As Deciding finishes, fold every *how-any-guide-is-made/reviewed*
learning from the Trust→Steering→Deciding runs into the pipeline docs (`GUIDE-CREATE` / `GUIDE-REVIEW` /
method), never leaving it in a single piece's dossier, and **drive this row to close before Deciding
graduates**. The split that keeps it honest: piece-specific calls → the dossier; process calls → the
pipeline docs. ✅ Folded Conv 052: the **aside-length check** (`GUIDE-REVIEW` steps 4/10); the
**breadcrumb/intent-not-prose** principle for the points round-trip (`GUIDE-CREATE` step 6).
✅ Folded Conv 053: the **heading FAQ/GEO-liftability scrutiny** — read each H2 cold, out of the page, and
seat the subject if the lift goes vague (`GUIDE-REVIEW` step 5, `DEC-053-1`; worked example = Deciding §4 retitle).

### [GUIDE-DECIDING] · added Conv 049 · "Should you build it all yourself, or bring someone in to help?" (3rd cornerstone)
📄 The **Deciding** cornerstone guide — the 3rd and last of the first three. A draft predated `/r-content`;
dossier scaffolded Conv 049 (compared doc-derived "B" vs rigorous retrofit "A"; **operator chose A**).
slug `build-it-yourself-or-bring-someone-in` · pillar `deciding` · order 3 · `draft: true` · dark behind
`CONTENT_HOME_LIVE` + `[PROD-DEPLOY-BAN]`.

**Take (A, rigorous):** the call isn't a feeling, it's a **test you can run on each part** — *do I
understand what it does?* × *does my business depend on it?* The quadrant tells you keep / learn / watch /
bring-someone-in. AI raised the floor (self-build goes further than you'd expect) but pushed the
load-bearing parts to the end, where an explicit test beats a gut call. A clear test is *more* empowering
than "trust your unease" — it names which part and why.

**Outline / approved arc (A — seat as the on-arc comment block at redline step 1):**
1. **Short answer** — reworded off "honestly": build yourself as far as you can *stand behind*; bring
   someone in for the specific part your business leans on that you can't verify or fix.
2. **Home-repair analogy** — kept, tied to the test ("open the wall" = a load-bearing part you can't judge).
3. **H2 "Hasn't AI made bringing someone in unnecessary?"** — floor-not-ceiling; hard parts moved to the end.
4. **H2 "How do I test each part?"** — 🆕 rigorous core: an **Eisenhower-style 2×2**, *understanding*
   (can I judge/fix it?) × *dependence* (does my business lean on it?), **shown as a matrix in the guide**
   (operator, Conv 049). Four cells: **Keep** (understand/low-dep), **Own it** (understand/high-dep),
   **Leave it or learn it** (black-box/low-dep), **Bring someone in — or learn it** (black-box/high-dep =
   the one cell that forces a call; sub-fork: delegate vs grow-past-the-limit). Promotes the test buried
   in the draft's keep/restart §. 🔧 Matrix render = a later design call (static table or inline SVG,
   legible both themes; simpler than `[PILLAR-DIAGRAM]`'s interactive build).
   🖼️ **Matrix figure BUILT Conv 053 (`DEC-053-2`):** styled HTML business panel (`.decision-matrix` in
   `global.css` + raw `<figure>` in the guide) — sans font, green/red stop-go cells, named axes
   (Understanding × Risk), two-line scenario+question title, equal rows, theme-adaptive. Cell/axis wording
   still PROVISIONAL (final pass). Stills: `.scratch/deciding-matrix-v5-{light,dark}.jpg`.
5. **H2 "Where am I on the path, really?"** — the three places, framed as *where the test sends you*. → `/phases/`.
6. **H2 "What do I keep, and what do I start over?"** — keep simple+understood, rebuild tangled+load-bearing;
   the start-over trap (gaps = unasked questions) — now a consequence of §4, not a separate idea.
7. **H2 "When is it genuinely time to bring someone in?"** — the specific unverifiable business-critical
   part; two signals seated as **intuition** (the unease that won't go away — Trust/Steering throughline)
   + the mechanical signal (can't-change-without-breaking). → the work I do + soft CTA `/contact/`.
🔴 **A is an arc change** (promote the 2×2, re-sequence cause→consequence), so redline step 1 reconciles
the existing draft body to this arc — not a prose-only pass.

🔲 **Matrix — working spec (Conv 049; all wording PROVISIONAL — operator finalizes at the final pass):**
- **Title/question above the matrix:** *"Should I bring someone in to help (me)?"*
- **Cell labels — decision-led (A):** *No — carry on* · *No — you've got it* · *No — it doesn't matter* ·
  **Yes — bring someone in, or learn it** (each cell answers the title-question).
- **Colour:** the three "No / keep going yourself" cells one **calm** tone; the "Yes / get help" cell a
  distinct **warm** tone (legible in both themes).
- **Axis explanations = small figure text BELOW the matrix** (not just terse axis labels):
  - **Columns (X):** frame as **"risk to you if something goes wrong"** (stakes). "Dependence" is the same
    idea but *vaguer* — lean to the risk framing.
  - **Rows (Y):** **"your understanding of how the entire system works."**

**Checklist (lifecycle order, live from the docs Conv 049):**
Creation (`GUIDE-CREATE.md`):
- [x] Slot — pillar `deciding` in `pillars.ts`; **colour set Conv 051** (`--pillar-deciding: light-dark(#8a4e9e,#a06ec0)` plum; `PILLAR_META.color`). All 3 live pillars coloured + validated (dataviz, both modes); feeds `[PILLAR-DIAGRAM]`
- [x] Take drawn out (A) · [x] Outline/arc approved (A) · [x] `✎ ARC` on-arc block seated in the draft (Conv 049, `31ae6a9`)
- [x] First draft exists · [x] **body reconciled to the approved A-arc — whole-draft rewrite committed + pushed Conv 049** (fgw-26 `31ae6a9`, 18:55)
- [x] **Coordinate view generated (Conv 050, GUIDE-CREATE step 5)** — `.scratch/deciding-view.txt` (`number-content.mjs`, 28 blocks).
- [x] **Point-form skeleton + augmentation round-trip (Conv 050–052, GUIDE-CREATE step 6, `DEC-050-2`)** — faithful skeleton (Conv 050); **operator augmentation pass DONE Conv 052** (P2 capacity drop, P3 naive framing, P5 pure-gold + candor relocation, P8 lead-in B, P18 sharpening, P22 heading C, P23 third option, P24 rewrite) + CC's four arc reinforcements seeded.
- [x] **Second draft written from the augmented points (Conv 052, GUIDE-CREATE step 6c)** — whole-draft pass, build-clean, still `draft:true`/dark. Carries all operator edits + the four arc reinforcements (progression, "seen this path," growth throughline, journey-metaphor) + the P3→P6 naive→judgment callback + the keep/rebuild/hand-off three-way. On-arc comment refreshed (item 6 + Conv-052 refinements). ⬜ **Next: operator's whole-piece read (GUIDE-REVIEW step 1).**
Finalize (`GUIDE-REVIEW.md`, in order):
- [x] 1 Coordinate-view redline — **COMPLETE, whole guide P1→P32 (Conv 053 §1–§4; Conv 054 §4-grids→§8 close)**. Conv-053: §1–§4 redlined + the §4 matrix figure built (`DEC-053-2`). Conv-054: the two grid-interpretation paras (P14/P15); **new §7 section added** — "Can I really learn enough on my own when I reach my limit?" (the self-path arm of the danger-cell fork, loose-binding to `/phases/`; P16 trimmed to hand off); §5 reworked (P17 retitled "Which phase of building with AI am I in?", P18 phases/unembraced-straw-man, P19 merged, P22 straw/tin/steel bridge + places→phases fix); §6 grid-anchor + "another question" ordinal fix; "the test" bound to its §4 home (P9); P31 "experience"→"intuition"; §8 close rewritten (solid software, "then I'm happy", CTA). Guide now **32 blocks**; `.scratch/deciding-view.txt` current. (DEC for the new §7 section + the loose-binding call → `/r-end`.)
- [x] 2 "It" pass (default it = your AI-built software) — **Conv 054: clean.** Default "it" = the build holds throughout; only fix was P15 "the impact it's had" → "the impact that change has had" (named the AI's change; killed an AI/suggestion/part three-way). P27 learning/part "it" cluster + P30 "settle it" judged below the bar, left.
- [x] 3 Anecdote check — **Conv 054: no concrete anecdote, by decision (operator).** A success-story ("a client asked me to look, it worked out well") reads self-serving next to the CTA in the conversion cornerstone — against the persona (credibility by proof, not self-praise). The from-experience *register* carries it instead ("I've sat with people at each of these", "that's the work I do, people bring me software…"). **P32 `✎ ANECDOTE` placeholder removed.** (If ever revisited, the only non-self-serving form is a *teaching* anecdote — mechanism, not outcome.)
- [x] 4 Glossary (3–5 terms) — **done Conv 055** (operator). 4 terms in the draft frontmatter: *AI-built software*, *Load-bearing*, *Black box*, *Bring someone in* (within 3–5, definitions present). The **aside-length visual check** defers to **step 11** (needs the rendered page + the pending colophon image; already tracked there).
- [x] 5 Headings (H2 = NL questions; FAQ-lift nouns) — **done Conv 055.** Cold-read all 6 H2s. **#4 reseated** via the §6 whole-section rewrite → "When my build stalls, do I push on, start over, or get help?" (see decision below). **#5 reseated** → "Can I really learn **the hard part** myself when I reach my limit?" (seated the object; aligns §7's "the part that stops you"). **Left as-is:** #1 ("Hasn't AI made bringing someone in unnecessary?" — "AI" seats it; bookends #6), #3 ("Which phase of building with AI am I in?" — "building with AI" seats it), #6 ("When is it genuinely time to bring someone in?" — answer seats it; bookends #1). #2 already seats ("…parts of my AI-built software…"). All seats used **varied, non-entity** words — no new "AI-built software" added (step-6 over-seeding guard).
- [x] 6 Entity naming + over-seeding audit — **done Conv 055.** Trimmed shipping "AI-built software" from **5 → 3** (kept the three highest-signal seats: glossary definition, H2 #2 "How do I find the parts of my AI-built software I'm unsure of?", matrix caption — definition + liftable heading + standalone figure). **Varied 2** (the stuffed §3→§4 cluster around the H2): §3 "part of your AI-built software" → "part of what you built"; §4 lead-in "Look at your AI-built software" → "Look at your build". Step 5 added none (guard held). The §6-title over-seeding park is moot — §6 was rewritten (no entity in the new heading). (`✎ ARC` comment instance strips at the pre-flip gate — not shipping.)
- [ ] 7 Conjunction audit
- [ ] 8 Metaphor audit (home-repair structural metaphor as a unit)
- [x] 9 Signature-phrase / AI-tell audit (added Conv 054) — **done Conv 054.** Rulings (now logged in `VOICE.md`): **"leans on"** always-change → "relies on" ×3 body + glossary def (snippet's deferred to step 14); **"stand behind"** cut 4→1 (kept P2 thesis; P6→"vouch for", P7→recast "that line moves", P28→"be sure of"); **"load-bearing"** kept (1 body use at P16 earns it; ~1/guide allowed); **"reach"** varied the P27/P28 proximity ("reach that bar"→"get to that bar"), kept the growth-throughline "your reach". Alternatives lists accrue in `VOICE.md`.
- [ ] 10 Pull quote (one)
- [ ] 11 Rendered read (incl. the step-4 **aside-length** visual check — scroll desktop, confirm sticky image+glossary fit). ⚠️ **+ §5 stage-markers revisit (deferred Conv 054):** the bold *Early on / Further along / Further still* (P19/P20/P21) read as a *sequence* but don't cleanly map to discrete "phases" (vs the H2 "Which phase…" + P18 "first/second/third"); *"Early on (in what?)"* mildly unanchored. Reconcile progression-feel vs phase-labels reading it in context — keep all three markers consistent whichever way.
- [ ] 12 Em-dash sanity check
- [ ] 13 Colophon selection + fitting — **Deciding image lead: Bloch *Esox lucius* pike** / freshwater-fish pool (`COLOPHON.md`, `[CONTENT-ART]`)
- [ ] 14 Card + SEO/GEO snippet match (final)
- [ ] 15 Cross-linking (added Conv 054) — wire the finished guide into the site link graph: `/faq/` entries link to it, sibling-guide interlinks, forward-links. 🔗 **3-cornerstone interlink pass fires here** (Deciding is the last of the three): Steering already links Trust+Deciding; add Deciding→Trust+Steering reciprocals; fold in the `[GUIDE-PLANNING]` forward-link from Steering's planning para (Conv 047 origin). ⚠️ **One-time retrofit (operator, Conv 054):** this pass must reach back into the already-graduated **Trust and Steering** to add their reciprocal links — they finalized before this step existed, so they won't get it from their own reviews.
- [ ] 16 Masking check
- [ ] 17 Final whole-page review → declare final → graduate to `docs/content/build-it-yourself-or-bring-someone-in.md`, retire row

**Decisions (piece-specific, accrue here):**
- **Conv 049:** adopted arc **A** (2×2-test spine, re-sequenced) over B (keep-draft-arc). The 2×2 was latent
  in the draft (§ "do I understand… does my business lean on it"); A promotes it to the spine.
- **Conv 049:** the decision test is an **Eisenhower-style 2×2** (understanding × dependence), and it is
  **rendered as a visible matrix in the guide** (operator). Only the black-box × high-dependence cell
  forces a call; the other three are "you're fine."
- **Conv 049:** that danger cell carries a **third route — learn it / grow past the limit** (operator,
  "most definitely"), not just bring-someone-in — echoing Trust's "know your limits, and grow past them."
  Delegate vs invest-to-learn is the sub-fork (stakes / runway).
- **Conv 049:** matrix cell labels are **decision-led (A)** — each answers the matrix title-question
  *"Should I bring someone in to help (me)?"* with No/Yes + nuance; colour groups the three No/keep-going
  cells vs the one Yes/get-help cell. Axis explanations go in small figure text below (X = "risk if it goes
  wrong", vaguer as "dependence"; Y = "your understanding of how the whole system works"). All wording
  provisional — operator finalizes at the final pass. (See 🔲 Matrix working spec above.)
- **Conv 049:** matrix cells are **software-filled**, with home-repair as a **prose echo** (operator chose
  A over a home-repair-filled matrix). Working fills: *Keep* = a copy tweak / settings toggle; *Own it* =
  your core workflow logic; *Leave it or learn it* = an animation lib you didn't write; *Bring someone in
  or learn it* = auth / payments / data handling. Home-repair echo lands on the danger cell in prose
  ("the wiring behind the wall").
- **Conv 052 (snippet, in light of the title):** reworked the SEO/GEO snippet — old opener *"Most of a
  build is now yours to do with AI…"* presupposed a leftover portion you always hand off, contradicting P5
  ("for plenty of projects you may need no one"). New (option B): *"Build as much as you can with AI; for
  many projects you may need no one. Bring someone in only for a part your business leans on that you can't
  check or fix."* Answer-first + GEO-liftable; makes help conditional. Description left as-is (already fits).
- **Conv 052 (keep/rebuild section, P22–24):** added a **third choice** — the section was keep-vs-rebuild
  (two-way), now **keep / rebuild-yourself / hand off** (operator). This reconciles a gap with the matrix:
  the tangled + load-bearing + can't-judge parts are the danger cell's "bring someone in," so "rebuild it
  yourself" alone contradicted the spine. Heading retitled (C): *"What do I keep, and what should I start
  over?"* → **"What do I keep, rebuild, or hand off?"** (names all three; FAQ-liftable). **P24 rewritten**
  to carry the hand-off: rebuild the parts you understand, hand off / get a read on the can't-judge part —
  the start-over trap (gaps = unasked questions) becomes the case for option three, while agency is kept on
  the parts you own. Seeded at P23/P24 in the local-only points file.
- **Conv 052 (matrix presentation):** the 2×2 appears **once, filled, immediately after the P8 lead-in**
  (grid-count A) — answers live in the cells; P13–15 prose *interprets* (examples + home-repair echo), it
  does not restate the cell verdicts. Rejected: empty-frame-first-then-filled-payoff (two figures, staged
  but textbook-y) and empty-frame-only (loses the filled grid as a scannable, GEO-liftable artifact). The
  P8 lead-in (B) stands because the adjacent grid is filled. Decides the figure build.
- **Conv 052 (title):** retitled *"Should you build it yourself or bring someone in?"* →
  **"Should you build it all yourself, or bring someone in to help?"** The old title read as a *before-you-
  start* fork (build vs hire); the decision actually arrives per-part, well after you've begun. "all"
  reframes it to *how far you take it* (matches the Short answer's "as far as you can stand behind"); "to
  help" signals partial, specific-part assistance (matches the glossary + P28). Slug/description/snippet
  unchanged (already aligned); H1 + meta title only.
- **Conv 052 (points round-trip, P3→P6 arc):** P3's capability framing ("too much for you," "past your
  abilities," "a skill you can develop") is an **intentional naive setup, not drift** (operator) — it's the
  would-be AI developer's POV at the *start* ("am I up to this?"), which **P6 then corrects** to the
  judgment/"stand behind" framing ("not about your capability — about whether a part outgrew what you can
  stand behind"). It walks the reader's own solo journey (beginning → partway through) and shows we know it's
  coming. 🔧 P6 must land an **explicit callback** to the naive framing when redrafted (seeded in the points
  file). Note: this is distinct from the P2 drop — P2 cut capacity from the *test-axis preview*; P3 keeps it
  as the *reader's naive entry point*.
- **Conv 052 (arc reinforcement, operator-approved):** the reader's-own-journey arc (start → partway →
  further, walked alone, we show we understand it) gets **four reinforcements seeded for the second draft**
  (in the local-only `deciding-points.txt` ARC REINFORCEMENT block + inline P17/P15/P27/P28 pointers):
  **#1** write §"Where am I on the path" (P17–P21) as a *progression*, not a menu of three types (+ stage
  markers P18–P20); **#2** one quiet "I've watched many people walk this path" beat (P17, echo at the P28
  close); **#3** growth throughline linking P3 "a skill you can develop" → P15 "grow past the limit" → P27
  "your experience talking" (payoff: reader ends more able to make the call); **#4** journey-metaphor
  consistency across P2/P16/P21/P28. ⚠️ Seeds live only in the gitignored points file until the second draft.
- **Conv 052 (P5, candor relocation):** dropped the candor beat ("I'd rather tell you that than sell you a
  service you don't need") from P5's opening concession and **relocated it near the close/CTA** (seeded at
  P28, operator) — it reads better once the reader understands the arc, and makes the soft CTA non-pushy. P5
  keeps the empowerment concession ("you may never need anyone"; "pure gold / in the zone"). Seed lives in
  the local-only points file.
- **Conv 052 (points round-trip, P2):** dropped the **capacity** angle ("too much for you") from the Short
  answer. The test the guide delivers measures only **understanding × risk**; capacity is a different kind
  of call (a resource/delegate decision, not a judgment one) and reads as minor here — so the opener now
  previews the same two axes the test uses. Capacity's residue stays where it already lives: P15's runway
  sub-fork and P20's "hand off the out-of-depth sections."
- **Conv 053 (§1–§3 redline):** Short answer → "build **as much of it** yourself as you can stand behind"
  (object stated once, no double-"it"); home-repair "**ambitious** jobs" + kept the self-empowerment beat;
  §3/P5 kept "pure gold / in the zone / Keep going!". **§3 (P6) floor/ceiling metaphor RETIRED** for plain
  "entry barrier lowered, the hard parts moved to the end" (the metaphor read as unclear; ✎ ARC updated).
  **New §3-close paragraph** — "your reach keeps growing as you develop with AI" (growth-throughline §3
  node), framed as *what you can stand behind* expanding (not "more capable"), to stay on P6's spine.
- **Conv 053 (§4 retitle):** "How do I test each part?" → **"How do I find the parts of my AI-built software
  I'm unsure of?"** — doubt-framed (reader already senses an area of doubt) + entity seated so the FAQ-lift
  reads standalone (generalised into `GUIDE-REVIEW` step 5, `DEC-053-1`). P9 lead-in kept (pluralised "those
  parts"), given two bullets **Understanding / Risk** mapping to the matrix axes.
- **Conv 053 (matrix build + wording):** rendered as a standalone business figure (`DEC-053-2`); axes named
  **Understanding × Risk** (X-title "Risk if you get it wrong" spans its columns; short "Low/High Risk"
  labels); two-line title ("I am worried about one part of my AI-built software" / "Should I bring someone in
  to help?") so it stands alone; cells = *Keep going* / *You've got it* / *But keep an eye on it* / *Bring
  someone in, or learn it*; bottom axis-caption dropped (redundant with named axes). All matrix wording
  **PROVISIONAL** until the final pass.
- **Conv 054 (§7 self-path section added):** a new H2 "Can I really learn enough on my own when I reach my
  limit?" seated before §8 — the self-path arm of the danger-cell fork (learn-it-yourself), given its own
  room; P16 trimmed to introduce-and-hand-off. **Loose binding to `/phases/` (A over tight-mirror B /
  middle C):** the guide stays the solo reader's *lived* progression (who often doesn't cleanly restart),
  while `/phases/` owns the disciplined straw/tin/steel fresh-start method; P22 bridges to it ("line up with
  the straw man / tin man / steel man … how I work through them myself"). The "unembraced straw man" (kept
  building without ever calling it a first attempt) woven into P19.
- **Conv 054 (no concrete anecdote):** the `✎ ANECDOTE` placeholder removed — a success-story reads
  self-serving next to the CTA in the conversion cornerstone (persona: credibility by proof, not
  self-praise); the from-experience *register* carries it. If ever revisited, only a *teaching* anecdote
  (mechanism, not outcome) fits.
- **Conv 054 (§6 title deferred):** "What do I keep, rebuild, or hand off?" left un-retitled — the per-part
  "Which parts…" seat would have added a 7th "AI-built software"-adjacent keyphrase (over-seeding watch).
  The body already reads per-part; title liftability + over-seeding both revisit at step 6.
- **Conv 054 ("the test" bound):** the promised "simple test" (P2) was delivered in §4 but never named
  there; bound in P9 ("The test is simple.") so the P24/P27 "the test" references resolve.
- **Conv 054 (signature-phrase pass, `DEC-054-2`):** "leans on" → "relies on" (always-change tic); "stand
  behind" cut 4→1 (kept the P2 thesis; P6 "vouch for" / P7 recast / P28 "be sure of"); "load-bearing" kept
  (1 earned use); "reach" proximity varied. Mechanism + lists in `VOICE.md`.
- **Conv 055 (§6 whole-section rewrite + heading, operator-directed):** the section was reframed. Old
  frame (keep / rebuild / hand off, with "starting over is a trap") **contradicted the straw→tin→steel
  method (§5/§7)**, which advocates restarting. New frame: §4's grid has flagged the *risky black-box*
  parts; §6 decides what to do about a **stalled** one, three moves — **push on** (hopeless, you're
  already stalled) / **start over** (legit, it's what straw→tin→steel is for, but no sure thing — a blind
  self-redo inherits the same unasked-question gaps) / **get help** (fresh eyes, fresh ideas). Heading → **"When my build stalls, do I push on, start over, or get help?"** (supersedes the
  interim "…keep, rebuild, or get help on?"; matches the new triad + sibling single-question shape; seats
  via "my build"; retires the Conv-054 over-seeding park). Em-dash-free; "relies on" (not "leans on"); no
  new "stand behind"/"be sure of" (avoided echoing §7's closer). **§6 CTA dropped** (operator, Conv 055) —
  it lives only in §8, which already carries it ("that's the work I do… get in touch"); resolves the §6/§8
  CTA redundancy. **Straw/tin/steel not named in §6** — the reframing alone kills the old contradiction;
  the method stays named at §7's `/phases/` bridge. **Block count unchanged (2 paras);** view regenerated
  (202 lines; §6 = P23 heading, P24 S1–S6, P25 S1–S8). S3 + S6–S8 smoothed Conv 055 (operator flagged
  awkward); S6 keeps the "put them to the AI" beat, active voice.

**Published:** _pending — dark behind the flip + `[PROD-DEPLOY-BAN]`._
🔗 On finish: the **3-cornerstone interlink** fires at review **step 15** (Cross-linking; `DEC-054-3`) — Trust/Steering/Deciding + the
`[GUIDE-PLANNING]` forward-link).

### [GOOGLE-SERVICES] · added Conv 035 · standing GSC monitor (initial alignment ✅ Conv 035)
✅ **Initial alignment done Conv 035** (via Chrome, operator's GSC session): submitted the correct
`sitemap-index.xml` (Success, 22 URLs); removed the broken legacy `sitemap.xml`; requested homepage
re-crawl; confirmed verified ownership / valid robots / HTTPS / **no manual actions** / AI "Include";
linked **GA4 ↔ Search Console**. Two owners (`EsoxAmericanusVermiculatus` + Fraser) + their two DNS
verification tokens confirmed legit by the operator — left untouched.
🔁 **Standing check — every 9 convs (changed Conv 050 from every-3; next Conv 59; Conv-50 check skipped — prior check effectively current):** review Search Console for (a) any new
concerns/errors raised, and (b) how far the crawl/indexing of the 22 URLs has progressed. Keep this row
open; CC drives via Chrome with the operator's GSC session. ⏰ Surfaced automatically at `/r-start` by the
cadence mechanism (`DEC-035-4`, built Conv 035).
🔴 **Method — operator-set Conv 044 (do this EVERY check, not just a health scan):** on the Pages report
switch the filter to **All submitted pages** (drops the self-healing old-path 301 ghosts — do **not**
re-report them each time), treat **Nov 9** as the crawl floor (sitemap submitted Nov 8, so only Nov-9+
crawls count as real), and report **exactly which real pages have been crawled and when**, **which have
issues**, and **what to do** about each. The operator reads bare GSC as "a confusing mess" — the job is
to filter it down to a current-pages answer, not to relay GSC's mixed all-known-pages view.
✅ **Conv 41 check (cadence):** no new concerns — manual actions none, security none, HTTPS clean, sitemap
Success (22 discovered, read Nov 10). Indexing early but healthy: of the 22 real pages only **3 indexed**
(`/`, `/work/`, `/privacy/`); the core pages (`/about/`, `/method/`, `/phases/`, `/contact/`, `/faq/`,
`/history/`, `/testimonials/`, work cases) are discovered-but-not-yet-crawled (expected lag, new
low-authority site). Old-site paths (`/services/`, `/ai-coaching/`, `/how-i-work/`, `/terms/`) linger as
stale "indexed" entries that now 301 (verified live) — self-heal on re-crawl. GSC "All known pages"
filter chevron is non-functional (GSC-side glitch). Next cadence ~Conv 44.
🔴 **Conv 44 check (cadence) — filtered to submitted pages (operator-directed; `DEC` at /r-end):** no new
concerns (manual actions none, security none, sitemap `sitemap-index.xml` Success, re-read Nov 13, 22
discovered). **Real-page indexing has NOT materially moved since Conv 41** — the all-known count rose 3→7
but all four new "indexed" entries are old-path 301 ghosts (`/services/ /ai-coaching/ /how-i-work/ /terms/`,
live-verified 301→`/work/ /work/ /method/ /privacy/`, serving no old content — harmless, self-healing).
**Filtered to the 22 submitted pages: 3 indexed, 19 not (2 reasons).**
- **Indexed (3):** `/` (Nov 9), `/work/` (Nov 9), `/privacy/` (Nov 8) — same 3 as Conv 41.
- **Crawled, not indexed (1):** `/testimonials/` — last crawled **Sep 28** (stale, *pre-submission*; Google
  declined, not re-fetched since). The one real "issue" page.
- **Discovered, never crawled (18, all Last-crawled N/A):** 6 core (`/about/ /contact/ /faq/ /history/
  /method/ /phases/`) + 12 work (`/work/` cases + `/record` for discover-jesus, discover-the-ub,
  learning-marketplace, personal-productivity-app, redline, this-site, translation-platform).
**What to do (operator's call):** the 18 have been *discovered via sitemap but never crawled* — normal
crawl-budget lag for a new low-authority site; the lever is **URL Inspection → Request indexing** on the
priority pages (`/about/ /method/ /phases/ /contact/` first) to push them into the crawl queue, + re-request
`/testimonials/` to force a fresh post-submission crawl. (Not done this check — pending operator direction.)
The "All submitted pages" filter works fine now (the Conv-41 chevron glitch didn't recur). Next cadence ~Conv 47.
🔁 **Request-indexing log (operator-directed Conv 044 — track each push + whether it took):** manual
URL-Inspection → Request indexing pushes a URL into a priority crawl queue (quota ~10/day; re-submitting
doesn't change queue position). **At every future check, verify whether the pages below actually got
crawled/indexed after their request — that's how we judge if the push worked.**
- **2026-11-16 (Conv 044):** requested `/about/`, `/method/`, `/phases/`, `/contact/` (core, never-crawled)
  + re-requested `/testimonials/` (was Crawled-not-indexed, Sep 28, Google declined). All 5 accepted into
  the priority queue. ⬜ *Next GSC check (now Conv 59, cadence → every-9 `DEC-050-1`): check which of these 5
  moved to Indexed / got a fresh crawl date — pending since the request (the Conv-47 and Conv-50 checks were skipped).*
⚠️ **Gotcha (Conv 044, resolved in-session):** Request-indexing runs a live fetch first; it can flake with
**"Page fetch — Failed: Server connection error" → request rejected** even when the page is perfectly
healthy (verified `/method/` served HTTP 200 / 20KB via curl at the same moment). **Fix:** re-run the live
test (↻) until it goes green, then Request indexing. Likely transient rate-limiting from rapid back-to-back
live probes — space them out. Don't mistake this for a real page problem.

### [POSTING-PLAN] · added Conv 035 · run the X + LinkedIn posting cadence (plan ✅ Conv 038)
✅ **Plan stood up Conv 038** — the full channel/funnel strategy lives in `reference/CHANNELS.md` (funnel,
channel roles, cadence, pillars, sourcing/workflow, content home, copy conventions). Buyer-facing **X pinned
post** done (Conv 038). 🔁 **Standing work:** run the **biweekly LinkedIn** cadence (opportunistic X echo),
drafting per the pillars — CC drafts → operator approves → publish (write-once-then-distribute). Leans on
`[SITE-CONTENT-HOME]` (the blog/guides posts point to).
📎 **GEO answer-structuring (folded in Conv 036):** as content gets built, structure it so generative
engines can lift clean answers — TL;DR / direct-answer blocks under key H2s, consistent entity naming
(a content-shaping guideline; vendor "30–40% citation gain" figures unverified).

---

## 📋 Unordered

### [PROD-DEPLOY-BAN] · added Conv 039 · production deploys banned until content home is finalized
🔴 **Operator directive (Conv 039):** no **production** deploy until the **first blog page** and **all
guide pages** (`[SITE-CONTENT-HOME]`) are finalized. **Staging deploys as usual** (`npm run deploy:staging`
is unaffected). **Enforced technically, fail-closed:** `scripts/assert-prod-deploy-allowed.mjs` runs first
in the `deploy` script and exits non-zero while the ban stands; `deploy:staging` does not call it.
**To lift:** set `PROD_DEPLOY_BANNED = false` in that script once the content is finalized + approved, and
record the lift here. (`DEC-039-2`.)

### [BLOG-REDIRECT] · added Conv 039 · decide what old-site `/blog` links should do
The provisional `'/blog': '/'` 301 (added Conv 032 for the old fg site's `/blog` URL) was **dropped in
Conv 039** (`[SITE-CONTENT-HOME]`). The article stream then landed at **`/writing/`**, not `/blog/`
(Conv 039 rename — section URL matches its name), so **`/blog` is now a free, unhandled path**: old-site
inbound `/blog` links would 404. **Decide before/at flip:** (a) add a `'/blog': '/writing/'` 301 so those
old links reach the new articles home — **leaning (a)**, it's the natural successor; or (b) leave `/blog`
to 404 (acceptable if the old `/blog` had little inbound value); or (c) 301 `/blog` → home. Do this at
flip (when `/writing/` goes live), not while dark. Supersedes the redirect sub-point in the flip-live
hopper item.

### [CASE-RECORD-SIGNOFF] · promoted Conv 014 · sign-off ✅ Conv 030 (row stays for the standing masking guard)
✅ Sign-off complete (operator + clients checked both `/record` artifacts, no changes).
🔴 **Standing masking guard (why the row stays) — current as of Conv 034 (`DEC-034-1`):** the AI-era
testimonials are **live** (`showAiTestimonials = true`; `DEC-029-5`). **Gabriel's** testimonial runs under a
deliberate **testimonial-only naming exception**: it names **Gabriel + the Center for Unity** — he gave a
real, signed-off quote and cleared being named. The exception reaches no further than the testimonial text;
everything else the mask protects still holds:
- the `translation-platform` **case** stays de-identified (`DEC-023-3`) — no client, no source text, no target language on it;
- **no case-study link** sits on the testimonial — nothing may bridge the named quote to the de-identified case;
- the **target language is never named** anywhere;
- `discover-jesus` / `discover-the-ub` are unchanged.
**Brian** (marketplace) is unconstrained.
🔴 **Restore mechanism (if a real, signed-off testimonial later arrives):** add it to
`src/data/testimonials.json` and set `showAiTestimonials = true` in `index.astro` + `testimonials.astro`
to restore the suppressed sections + two-group lede (`DEC-029-5`); the masking guard above applies before
it renders. (Moved here Conv 032 from the retired `[SITE-GO-LIVE]` row.)
🔴 **Case → project mapping (lives here, never in the `fgw-26` site source):** `translation-platform` =
the translation-system/SPT engagement — client **The Center for Unity**, source text the **Urantia Book**
(the *same* client named publicly in the two Urantia cases, which is what the masking guard protects);
`learning-marketplace` = the **Peerloop** engagement.

### [SITE-TOOLS] · parked Conv 012
A dedicated tools page/surface — **parked.** The operator's summative tools statement already ships on
home (the "Tooling" section); a standalone page didn't earn its place ("not sure it will stand the test of
time; individual projects give a taste"). Seeded by the per-case **Built with** chips. Revisit only if a
fuller tools surface earns it.

### [SITE-TRAILING-SLASH-LINKS] · added Conv 037 · stop internal links bouncing through the trailing-slash 307
**Decision made Conv 037 (operator):** keep the **trailing-slash** URL form (the site is already built,
canonicalised, and GSC-indexed on it — the smaller ripple; `DEC` at /r-end) and fix the **internal links**,
which are written *without* slashes (`href="/about"`) while pages serve at `/about/`, so every direct nav
hits a 307 → `/about/`. Google says trailing-slash vs not is a consistency/taste call, neither better.
**Scope (enumerated Conv 037 — ~42 links / 13 files):**
- **33 static `href="/page"` literals** (+ `/`): `Footer.astro` ×8, `index.astro` ×5 (incl.
  `/testimonials#gabriel-rymberg` → `/testimonials/#…`), `history.astro` ×3, `testimonials.astro` ×3,
  `work/index.astro` ×3, `work/[slug].astro` ×3, `about.astro` ×2, `method.astro` ×2, `faq.astro` ×2,
  `phases.astro` ×1, `privacy.astro` ×1.
- **5 nav links** — `Nav.astro` `links` array (`/work` `/method` `/phases` `/about` `/contact`).
  ⚠️ **Re-count before doing (Conv 039):** the nav/footer changed — Nav dropped "Home" and added `/guides/`
  (already slashed); Footer added `/guides/` `/writing/` `/phases/` (already slashed) and the Guides/Writing
  links are flag-gated. The Conv-037 enumeration above predates this; re-derive the exact non-slashed-link
  list when this row is worked.
- **3 dynamic case links** — `/work/${id}`, `/work/${id}/record`, record→case back-link.
- **1 markdown cross-link** — `content/work/discover-the-ub.md` (`/work/discover-jesus`).
- **Leave alone:** assets (favicons, og-image), `mailto:`, external live URLs, auto-gen canonical, root `/`,
  `/llms.txt` (Conv 033 already slash-correct). `Nav.astro` `isCurrent` uses `startsWith` → stays correct.
- **After edits:** rebuild + prod redeploy + **verify by crawling internal links for any remaining 307s**.
- ⚠️ **Standing habit once done:** every *new* internal link must include the trailing slash (consider a
  lint rule / a link helper so it doesn't regress).
**Benefit is minor** (removes one ~tens-of-ms redirect hop on direct loads; ClientRouter already does many
navs client-side) — hence boarded, not rushed.

### [SITE-HSTS] · promoted Conv 033 · security hardening, low priority
The live apex sends no `Strict-Transport-Security` header. HSTS would close the window where an on-path
attacker (same network as the visitor) intercepts the *first* plain-HTTP request and SSL-strips it before
the HTTP→HTTPS redirect. (Promoted Conv 033 from the hopper.)
**Likelihood: low for this site.** Static marketing site — no login, no sessions, no accounts; the only
user data in motion is a contact-form name/email/message, already sent over HTTPS. The attack needs an
attacker already positioned as MITM on the visitor's network and only touches the unprotected first
request; browsers increasingly default to HTTPS-first. The gain is marginal hardening — HSTS's real value
is for authenticated / sensitive-transaction sites, which this is not.
🔴 **If enabled, do it deliberately (hard to reverse):** start with a short `max-age` (~1 day), **no**
`includeSubDomains` / `preload` initially, ramp up only once confident — a browser that has cached a long
`max-age` stays pinned to HTTPS for that whole window even if HTTPS later breaks, with no HTTP fallback.
Routes: Cloudflare dashboard → SSL/TLS → Edge Certificates → HSTS (operator action), or a worker response
header (code).

### [SITE-CSP] · promoted Conv 035 · Content-Security-Policy (security hardening)
Add a **hash-based** CSP (static site → hashes, not nonces) + `frame-ancestors` (keep `X-Frame-Options`
for old browsers). Roll out **report-only first**, then enforce. Closes most XSS + clickjacking. Set via
the Cloudflare Worker response headers — same home as `[SITE-HSTS]`, so likely do them together.
(Promoted Conv 035 from the web-2026 research hopper.)

### [SITE-STRUCTURED-DATA] · promoted Conv 035 · JSON-LD structured data (SEO + GEO)
Add/expand JSON-LD: `Person` / `Organization` / `WebSite` + per-project `CreativeWork` + breadcrumbs, via
`@graph` with cross-ref `@id`s; validate with Rich Results Test. 🔗 **Overlaps `[AGENT-PROFILE]`**
(`AGENT-DISCOVERABILITY.md` §9 — the public `Person` profile with geo/lang/tz) — likely merge or sequence
together. (Promoted Conv 035.)
📎 **Geography reconcile — ✅ done Conv 037:** `areaServed` updated to `["United States","Canada","Europe"]`
(`Layout.astro`), matching the Conv-037 "US, Canada and Europe" copy edits. (The broader JSON-LD expansion
above is still the open work.)
📎 **Content authorship carrier (Conv 041 policy, `DEC-041-2`):** content pieces are **byline-less
on-page** by decision, so the author signal is carried **here** — add `author` (`Person`, → `/about/`) to the
per-post `Article`/`CreativeWork` JSON-LD, plus `datePublished`/`dateModified` from the blog `pubDate`/
`updatedDate` fields (added Conv 041). This is the agreed home for attribution; don't add a visible byline.
✅ **Per-piece JSON-LD built Conv 043 (`DEC-043-3`):** `Article` (guides, undated) + `BlogPosting` (blog,
dated) + `BreadcrumbList` + `FAQPage` (Q&A **auto-extracted** from each page's `?`-ending H2s; a lead-in
answer that opens on a colon reads on to the next H2 so the lift is complete, with no reshaping of the
prose). Built as a reusable `components/ArticleJsonLd.astro` + `lib/articleJsonLd.ts`, emitted in the
detail-page `slot="head"`. `author`/`publisher` reuse the site `#fraser`/`#meristics` nodes by `@id`
(satisfies the carrier above). **Remaining:** the broader site-wide expansion (`WebSite`, per-project
`CreativeWork`); point the author `@id`'s `url` at `/about/` (currently home — minor); external Rich-Results
validation at flip (guides are dark/noindex on localhost, so a crawler can't reach them yet).

### [SITE-CONTENT-HOME] · added Conv 038 · build the guides + blog content surface in fgw-26
✅ **Dark scaffold built Conv 039** (`fgw-26`), gated by `CONTENT_HOME_LIVE` (noindex + off-nav +
sitemap-excluded until flip; shown in `astro dev`). `guides` collection (undated cornerstones) + a
`pillar` join on the `blog` collection; pages: hub **`/guides/`** (leads with the 3 cornerstones + a
"Latest writing" stream), `/guides/<slug>/`, **`/writing/`** (the dated article stream, renamed from
`/blog/`), `/writing/<slug>/` (up-links to its guide). Nav "Guides" + footer "Guides"/"Writing" links,
gated the same way.
🧭 **IA settled Conv 039 (`DEC-039-*`):** "Guides" for cornerstones, "Writing" for articles;
`/guides/` + `/writing/` single-purpose, bound by cross-links (not a mixed index); `/blog/` retired →
`[BLOG-REDIRECT]`.
✍️ **Draft content (Conv 039, all `draft: true`, pending operator redline):** 3 cornerstone guide drafts
(Trust / Steering / Deciding) + one throwaway sample article. **Remaining:** finalise the first article +
all three guides (CC drafts → operator approves), then **flip live** (🚀 steps below). 🔴 Prod deploys
banned until finalised (`[PROD-DEPLOY-BAN]`).
🚀 **Flip-live steps (folded from hopper, Conv 041):** when the first real cornerstone guide is approved,
set **`CONTENT_HOME_LIVE = true`** (`consts.ts`) and deploy. That one flag drives everything: reveals the
nav + footer content-home links (gated `CONTENT_HOME_LIVE || DEV`, Conv 039), drops the `noindex`, and
re-includes `/guides` + `/writing` in the sitemap — no per-file nav edits at flip. The old `/blog` →
`/writing/` 301 is tracked by `[BLOG-REDIRECT]`; per-piece JSON-LD is **built** (Conv 043, `DEC-043-3`; see `[SITE-STRUCTURED-DATA]`).
🔴 **Pre-flip gate (Conv 043, from hopper; broadened Conv 049):** strip the **`✎`-family** author/planning
markers — `✎ OPTIONAL` (author insertions), `✎ ANECDOTE` (anecdote placeholders), `✎ ARC` (the on-arc
outline block, Conv 049) — from the guide drafts before flipping; invisible on-page but they **ship in page
source**. Greppable by the single **`✎`** token (catches all three) — don't grep only `✎ OPTIONAL`.
🔗 Per-piece JSON-LD **built Conv 043** (`DEC-043-3`) in the `slot="head"` hook (`Article`/`BlogPosting` +
`FAQPage` + breadcrumbs); see `[SITE-STRUCTURED-DATA]`.
✍️ **Trust guide heavily redlined + tone-reviewed Conv 040** (`is-your-ai-built-software-sound.md`, still
`draft:true`/dark): operator-directed content pass (intuition throughline, edge-cases framing, human-nature
testing → automated checks, a new **"Know your limits, and grow past them"** section, home-repair +
collaborative-close fixes) then a whole-guide tone/presentation review — new **glossary feature**
(`DEC-040-3`: guides-schema `glossary` field + small muted end-of-page block, 4 terms), an **"it" pass**
(default "it" = your AI-built software, non-software "it"s named), **"I"/conjunction/metaphor balancing**
(headings → "you"). Built via the new **`scripts/number-content.mjs`** `P#S#` coordinate-view tool
(`DEC-040-1`).
✍️ **Trust guide: rendered-read pass Conv 041** — operator read the whole guide as it renders; **11 edits
applied** (lede recast as a hook carrying the "AI-built software" keyphrase, opening tightened so the "get
burned" question lands, "prompt"→"the directions you gave it", edge-case "them" disambiguation closing on
"hurt you", "recognizable kinds", notebook questions pluralized, "When does checking it yourself end?"
heading + two-part test). Reads finished-for-now; **operator has not yet declared it final**. Same conv
added the **content-media policy** (`DEC-041-2`: byline-less → JSON-LD author; `pubDate` + optional
`updatedDate`; optional `image()` hero as on-page adornment, og decoupled) and the **prose-link styling
unification** (`DEC-041-1`: `--link` token, `.prose a`↔`.text-link`, dropped underlines — fixes a
light-mode content-link that was invisible). **Remaining (Conv 042):** Trust prose **declared final** and
its illustration wired (`[CONTENT-ART]`); **Steering/Deciding guides + the sample article still unredlined**
(and still need their images); then flip live (🚀 above).
✍️ **Conv 043 — Steering first pass + card tone + SEO/GEO structure (prose NOT approved).** Steering guide
**first editorial pass** (light; flow preserved): tightened the close opener, added the intuition
throughline, a **4-term glossary**, and the title's last word `mean`→`need` (body/slug reconciliation
**carried** in the hopper). All three **guide cards retoned** to one evoke-and-stop register; **card copy
decoupled from the SEO/GEO snippet** (`DEC-043-2`: new `snippet` field feeds meta/og/twitter, card keeps the
evocative `description`), a `snippet` authored per guide, and the **blog** given the same decoupling. **Per-
piece JSON-LD built** (`DEC-043-3`). Content-art **image layout finalized** (`DEC-043-1`: two-column sticky
aside, dark thin border, fixed 320px below 1024) and the **hub cards equalized** to one height. **Entity
naming:** "AI-built software" seated in Steering + Deciding (`DEC-043-4`, F1; F2/F3 rejected, Trust frozen).
Author-insertion `✎ OPTIONAL` markers left in the Steering draft (pre-flip gate above). **Still open:**
Steering + Deciding prose redlines (unapproved; + their images), the real first article, the **conjunction +
metaphor voice audits** on Steering.
✍️ **Conv 044 — Steering title reverted `need`→`mean` (`DEC-044-1`).** The Conv-043 `mean`→`need` title
change was undone: operator's call that **"need" (the *discovery* gap** — the thing you'll actually use and
that fits, but can't pre-specify even to yourself) is a **separate future guide**, while Steering's thrust
is **"mean" (the *transmission* gap** — intent you hold but didn't voice; the AI can't read your mind).
Title/description/snippet back to "mean"; body + slug were already "mean", so no redirect/cross-link change.
The carried need/mean hopper item is **resolved**; a new hopper capture seeds the "need" guide. Everything
else above stays open (Steering/Deciding redlines + images, first article, conjunction+metaphor audits).
✍️ **Conv 045 — Steering redline: title/opening/steer-section + intuition beat (prose still NOT approved).**
Title last word `mean`→`meant` (`DEC-045-2`); card `description` + SERP `snippet` retuned (planning-vs-steering
thesis); bridging **pull-quote** at the planning→steering seam; **Short answer** recast (steering + discernment
+ agency); **Paras 2/3** reworked (seat "AI-built software" entity, past-build→present-discovery tense, italic
coinage *becoming a worthy companion to AI*, "a skill you can learn"); **P7** closer ("where your judgement
must take over"); **Decide** bullet → "spell it out" + record + generalization; **Watch for confident
nonsense** reframed around **intuition** (Steering's first literal use; close = "ask the AI… name what you
only sensed"); new **"Don't I just need a better plan?"** section foreshadowing the future **PLANNING guide**
(`DEC-045-3`, folds in need/discovery); **H2 nouns** seated for FAQ-lift (H1 "AI-built software", H4 "the
AI"); **record-keeping + intuition anecdotes** added (new `✎ ANECDOTE` required token, `DEC-045-4`; intuition
anecdote masking-generalized to "a big client project"). 🔴 **Resume next conv at H2 "Does steering it well
mean I don't need anyone?"** (operator floated "…anyone's **help**?"). **Still open:** conjunction + metaphor
voice audits, the "Does steering well…" close + the Deciding redline, images (`[CONTENT-ART]`).
🔴 **Deciding redline — carried voice catch (folded from hopper Conv 047; caught Conv 043):** in the
rigorous Deciding redline, reword the ~3 uses of "honest/honestly" as a prose frame ("finding that point
honestly", "honestly, yes", "Two honest signals") — VOICE bans the word as a framing word (Conv 040).
✍️ **Conv 048 — Steering FINALIZED + graduated.** Ran the full `GUIDE-REVIEW` finalize pass (steps 2–15);
operator **declared it final**; the piece graduated to `docs/content/steer-ai-to-build-what-you-mean.md`
(richer dossier format → new `[DOSSIER-FORMAT]` row) and the `[GUIDE-STEERING]` board row retired. Key
edits: "it" pass (default = the AI), the P8 forty-years aside, the P24 confident-nonsense inversion fix, the
P25 retrace rewrite, **P31 masking-generalized** (dropped the screen-sharing specifics), snippet seats
"AI-built software". The **metaphor audit resolved the carried P29-S3 note — kept both** ("sensing" =
diagnosis / "feeling your way" = choosing, a pair not a repeat). Zero em-dashes. **Hub `/guides/` cards now
carry the square art as a 64px lower-right corner tile** (Trust + Steering; Deciding bare until imaged).
**Cornerstones now: 2 of 3 prose-final (Trust ✅, Steering ✅); Deciding remaining.** Still dark behind the
flip + `[PROD-DEPLOY-BAN]`.

### [GUIDE-PLANNING] · promoted Conv 046 · write the PLANNING guide (folds in the need/discovery gap)
A new cornerstone-style guide (promoted from the hopper Conv 046; origin: Conv 044 need/mean split
`DEC-044-1` + Conv 045 planning fold-in `DEC-045-3`). **Thesis:** you can't fully pre-specify complex
custom software up front — the AI fills the gaps on its own, so plan *good-enough* (outcomes + solid
starting points, not a perfect PRD), then steer. **Discovery-gap strand:** you can't pre-specify what
you'll actually use; it stays partly unvoiced even to you and surfaces as you build and react ("no, not
that") — the skill is **recognition, not articulation**. **Seeds** already in the Steering draft (the
notebook, "sits wrong with you") belong here. Steering **foreshadows** it (the "Don't I just need a
better plan?" section, `DEC-045-3`). 🔗 **On ship:** wire the forward-link from Steering's planning
paragraph to this guide. Part of the `[SITE-CONTENT-HOME]` content set — same dark/draft → flip gating +
`[PROD-DEPLOY-BAN]`.

### [PILLAR-ROADMAP] · promoted Conv 047 · the evergreen guide-pillar pipeline (guide = pillar, `DEC-047-6`)
The pipeline of cornerstone **guide-pillars** beyond the first three (Trusting ✅ dossier, Steering ✅
dossier (graduated Conv 048), Deciding ⬜). Each new guide **IS a pillar**: extend `pillars.ts` (`Pillar` enum +
`PILLAR_META` label / blurb / order / **colour**) + a `/guides/` hub slot, then run create→image→finalize
(`/r-content` scaffolds the dossier).
🔤 **Pillar labels are gerunds** (operator, Conv 047 — matches Trusting / Steering / Deciding; the label is
the user-facing gerund, the internal `pillars.ts` key stays a short slug).
**Pipeline (Conv 047):**
- **Planning** — already a row, `[GUIDE-PLANNING]` (need / discovery + planning gap).
- **Documenting** — keeping track of what you did, why you did it, what you learned; tasks and processing.
- **Creating Skills** — writing them, using them, extending them.
- **Creating Subagents** — when to use them.
- **Testing** — scope TBD.
- **Reviewing** — when a project gets big enough that you can't remember how it all works.
- **Rewriting** — knowing when to rewrite what you've already built.
Each gets a **colour** (feeds `[PILLAR-DIAGRAM]`). Promote a topic to its own active row (via `/r-content`)
as it's started. All dark/draft → flip gating + `[PROD-DEPLOY-BAN]`.
🎨 **Pillar-colour system built Conv 051 (`DEC-051-2`):** muted full-spectrum categorical colours, each a
`--pillar-<key>` fill token + `--pillar-<key>-strong` text-safe variant (light-dark pairs) exposed via
`PILLAR_META.color`/`.colorStrong`; validated for colourblind-separation (dataviz). **First 3 live**
(trust terracotta / steering teal / deciding plum). Each new pillar adds its own validated pair as it ships.

### [PILLAR-DIAGRAM] · promoted Conv 047 · interactive pillar map (coloured circles + hoverable connections)
An interactive diagram of the pillar set that shows a user how the pillars relate: coloured **circles =
pillars**, clickable → the pillar's guide; **lines = interrelations**, hoverable to reveal how the two
pillars connect. **Needs:** (1) ✅ **a colour per pillar — done for the 3 live pillars Conv 051**
(`DEC-051-2`; the diagram reuses `PILLAR_META.color` → `--pillar-<key>`, already validated both themes);
later pillars add theirs as they ship; (2) the **pairwise "how they relate"
content** — a one-line connection per linked pair (a content task); (3) the **interactive build** — inline
SVG + JS (clickable circles, hoverable lines), on the `/guides/` hub or a dedicated page, legible in both
themes. Operator-planned; benefits from the pillar colours being set first.

### [CONTENT-ART] · promoted Conv 042 · guide/article illustration programme
🎨 **Approach settled Conv 042** (full reasoning + recipes: `_cc/content-art-and-copyright.md`): per-guide/
article imagery from **public-domain natural-history line engravings** (not photos, not AI — a naturalist's
plate already does the diagnostic interpretation that tracing a photo can't), cleaned as a raster engraving,
a **square detail tile** in-page + a **full-plate colophon** at the foot (species name + PD credit). No
light/dark theming (fixed background). O'Reilly is loose inspiration only — a trade-dress watch-item
(software + woodcut animals is their niche); copyright is clean (same PD well, the original plate not their
redraw).
🏗️ **Built Conv 042:** the `images` content collection + central Zod schema (co-located `provenance.json`
per `src/content/images/<id>/`, one source → many kept treatments, folder = id); first image
**`conus-marmoreus-lister`** (Lister *Conus marmoreus*, PD) with `square` + `colophon` treatments + source;
`guides` schema `image` ref; **Trust guide wired + rendering** (verified in dev). Storage = single-repo
co-located (`DEC-042-2`; rejected the docs/site split — cross-repo duplication outweighs a leaner build).
🔜 **Remaining:** image for the **Deciding** guide (Steering ✅ `stella-marina-linck` Conv 047 — its square
tile now also marks the Steering `/guides/` hub card, Conv 048); articles as they land; more
treatments/alternates as chosen; operator selects further subjects (own PD photos possible later). Part of
what the `[SITE-CONTENT-HOME]` flip counts as "finalized".

### [IMAGE-PROVENANCE] · promoted Conv 042 · provenance + treatment + usage for ALL site images
🏗️ **Foundation built Conv 042** — the `images` content collection + central Zod schema (co-located
`provenance.json` per `src/content/images/<id>/`; see `[CONTENT-ART]` + `_cc/content-art-and-copyright.md`).
This row extends it site-wide.
🎯 **Goal:** *every* image on the site carries provenance + treatment history — not only the new guide/
article art but existing assets (work-case mockups/screenshots, diagrams, og-image, headshot, etc.).
🔧 **Three needs:**
- **A trigger / guard** so the ledger can't silently fall behind. Today it's manual discipline; the schema
  validates *structure* but nothing fails the build when an image asset has **no** provenance entry. Want a
  check (build step / pre-commit / `/r-end`) that flags any image not accounted for in a provenance record.
- **Backfill** existing site images into the model (one-time audit + entries).
- **Usage cross-reference** — a reliable way to know *where each image is used* (which pages). The per-
  treatment `usedOn` field is a manual start (drifts); better to derive/validate usage from content at
  build. Decide: hand-maintained `usedOn` vs a generated image→page map.
🔭 Design-heavy; sequence after the `[CONTENT-ART]` images are flowing.

### [SITE-CONSENT] · promoted Conv 035 · GA4 analytics consent decision (privacy/legal)
GA4 sets cookies → EU visitors likely need consent (cookieless ≠ consent-free; fingerprinting is the weak
point). Decide: a consent gate vs. switching to a genuinely cookieless analytics. A load-bearing
privacy/legal call, not a quick fix. (Promoted Conv 035.)

### [SITE-WCAG22] · promoted Conv 035 · WCAG 2.2 delta re-audit
Re-audit against the WCAG 2.2 deltas on top of the Conv-030 AA pass: focus-not-obscured (2.4.11),
target-size 24px (2.5.8), dragging alternatives (2.5.7). (Promoted Conv 035.)

### [EMAIL-AUTH] · promoted Conv 036 · DMARC/SPF hardening (deliverability + anti-spoof)
Email auth is partially set up: DKIM `resend._domainkey` verified ✓ (Conv 035), but **DMARC is `p=none`**
(monitor-only — spoofed mail is neither quarantined nor rejected) and there is **no apex SPF** TXT record.
Raise DMARC to at least `p=quarantine` and add/confirm SPF. 🔴 **Deliverability-sensitive, do it
deliberately (hard to reverse cleanly):** verify Resend's SPF/DKIM alignment *first* — tightening DMARC
before SPF+DKIM align on the From domain can start bouncing legitimate mail. A Cloudflare DNS change.
(Promoted Conv 036 from the hopper; verified Conv 035.)

### [SECURITY-TXT-RENEW] · promoted Conv 036 · renew security.txt Expires before 2027-11-08
`public/.well-known/security.txt` in fgw-26 (RFC 9116) carries `Expires: 2027-11-08`. **Not actionable
now** — the file stays valid until that date, at which point it flips to invalid (compliant scanners then
ignore the disclosure contact). No decay in between; it's a dated reminder, not live work. **Do before the
date:** bump `Expires` further out (and re-confirm the contact). (Promoted Conv 036 from the hopper.)

### [AGENT-INITIATIVE] · added Conv 045 · standing agent-discoverability action plan — re-weighed each `[AGENT-DISCOVERY-WATCH]`; act-point ~Conv 75–85
🧭 **Standing row (`[operator, Conv 055]`):** the living action plan for the agent-discoverability
initiative, **refreshed every `[AGENT-DISCOVERY-WATCH]`** (not a one-shot deferral). Each watch reconciles
its findings into this row; the full per-watch assessment ledger lives in `AGENT-DISCOVERABILITY.md` §10.
**Act-point ~20–30 convs out (~Conv 75–85, operator Conv 055)** — until then we hold and keep the read current.
🔁 **Conv 055 re-weigh (held — not acting yet):** gates unchanged (`[PROD-DEPLOY-BAN]` binds; Deciding → flip
stays the priority). When acting begins, the live candidates are the **Tier 1 keystone
`[DATA-PRIVATE-SCHEMA]`** (internal `src/data` refactor, ban-independent, prerequisite for everything
agent-facing) and the **Tier 3 manifest re-pin** (below). Build-now-ship-later vs blocked split: §10
Conv-055 assessment.
🔴 **Open caveat — the manifest bet is now the losing horse:** the Conv-055 watch confirms A2A **AgentCard**
(`/.well-known/agent-card.json`, signed cards v1.0) pulled ahead while **`ai-agent.json` faded**. Our L1
commitment to `ai-agent.json` (`AGENT-DISCOVERABILITY.md` §2/§5/§9) stays on-record as our stated bet
**until re-pinned** — it must not be inherited silently into any `[AGENT-PROFILE]` work. Re-pinning is a
ban-free docs edit, held per the act-horizon above.
✅ **Conv 045 (origin):** first watch + assessment (`DEC-045-1`); operator decided **start nothing now**;
candidate rows in §9, dispositions in §10. Next re-weigh: the **Conv 65** watch.

## ⏸️ Parked

_None._

---

## ✅ Completed (tags — full records in commits / `DECISIONS.md` / `docs/convs/`)

- **Conv 054:** **Deciding redline finished (step 1) + new §7 + review-process additions** (content +
  process; `[GUIDE-DECIDING]` stays open). Block-by-block redline completed **P1→P32**: added **§7 "Can I
  really learn enough on my own when I reach my limit?"** (the self-path arm, loose-bound to `/phases/`; P16
  trimmed to hand off), reworked §5 (P17 → "Which phase of building with AI am I in?", P18 phases +
  unembraced-straw-man, P19 merged, P22 straw/tin/steel bridge + places→phases), bound **"the test"** to §4
  (P9), rewrote the §8 close ("then I'm happy", solid software). Finalize **step 2 (it-pass, clean bar P15)**
  + **step 3 (anecdote — dropped: self-serving at the CTA)** done. **Process:** two new `GUIDE-REVIEW` steps —
  **9 signature-phrase / AI-tell audit** (`DEC-054-2`, + the `VOICE.md` alternatives mechanism; applied:
  leans on→relies on, stand behind 4→1) and **15 cross-linking** (`DEC-054-3`, folds the 3-cornerstone
  interlink + the one-time Trust/Steering retrofit); the **markup-stripping rule** → step 1 (`DEC-054-1`).
  Hopper cleared (6 ruled). Two commits + this close.
- **Conv 053:** **Deciding §1–§4 redline + the §4 decision-matrix figure** (content; `[GUIDE-DECIDING]`
  stays open). Block-by-block redline of the second draft: Short answer ("as much of it yourself as you can
  stand behind"), home-repair para, the empowerment beat, **§3 reworked off the floor/ceiling metaphor** into
  plain entry-barrier framing + a **new "your reach keeps growing" paragraph** (growth throughline, §3 node),
  **§4 retitled** doubt-framed + entity-seated ("How do I find the parts of my AI-built software I'm unsure
  of?"), §4 lead-in recast with Understanding/Risk bullets. **Matrix** (`DEC-053-2`): the §4 2×2 rebuilt from
  a markdown table into a standalone styled-HTML **business figure** — `--font-sans`, green/red stop-go cells
  with coloured verdicts, named axes (Understanding × Risk), two-line scenario+question title, equal rows,
  theme-adaptive; built + screenshotted both themes (`.scratch/deciding-matrix-v6-light.jpg`). **Process:**
  heading FAQ/GEO-liftability scrutiny folded into `GUIDE-REVIEW` step 5 (`DEC-053-1`). Hopper: 1 carried
  (interlink).
- **Conv 052:** **Deciding guide — points round-trip + second draft** (content; `[GUIDE-DECIDING]` stays
  open). Operator's augmentation pass through `deciding-points.txt` (P2 capacity drop, P3 naive framing, P5
  pure-gold + candor relocation, P8 lead-in, P18 sharpening, P22 heading → "What do I keep, rebuild, or hand
  off?", P23 third option, P24 rewrite) + CC's four arc reinforcements; **second draft written** (whole-draft
  pass, build-clean, dark; GUIDE-CREATE step 6c) → awaiting operator whole-piece read. Title + SEO/GEO snippet
  reworked (title read as a before-you-start fork; snippet presupposed help). **Site/design:** sticky-together
  guide aside — image + glossary pin as one unit, `display:contents` on mobile (`DEC-052-2`); **colophon year**
  added to the image `source` schema + caption (`DEC-052-3`). **Process:** lint-hopper rule (`DEC-052-1`) + the
  one pre-existing eslint error fixed; the points round-trip is a breadcrumb/intent layer, not prose
  (`DEC-052-4`). Hopper: 1 done (lint), 1 carried (interlink).
- **Conv 051:** **Pillar identity colours + cornerstone card/guide-page colour UI** (no content-guide row
  shipped; design + process). **Colour system** (`DEC-051-2`): muted full-spectrum categorical colours
  (trust terracotta / steering teal / deciding plum), `--pillar-*` fill + `--pillar-*-strong` text tokens
  (light-dark pairs), `PILLAR_META.color`/`.colorStrong`, validated via dataviz both themes — closes the
  `[GUIDE-DECIDING]` Slot/colour item + advances `[PILLAR-ROADMAP]`/`[PILLAR-DIAGRAM]`. **Hub card**
  (`DEC-051-3`): 12px pillar left stripe (inset), stack breakpoint `sm`→`lg` (3-up ≥1024), art tile 2×
  (128px) below 1024 with the description wrapping in a left gutter, tile dropped to `bottom-4`. **Guide
  page** (`DEC-051-4`): 12px pillar bar beside the lede (the bold colour hit) + pillar-coloured eyebrow
  label; the subtle eyebrow-rule approach rejected. **Process:** retired `raised`/`flagged` from the
  go-list (`DEC-051-1`; `check-routing.sh` + CLAUDE.md, now 5 forms); reworked
  `/r-start` so carried findings are ruled one at a time, de-bundled from Step 6 (`DEC-051-5`). All site
  work dark behind the content-home flip + `[PROD-DEPLOY-BAN]`. Hopper: 1 done (r-start fix), 1 carried.
- **Conv 050:** **`/rfe` force-end verified + content-process method extended** (no board row shipped; recovery
  + process). Confirmed the Conv-049 `/rfe` force-end worked **end-to-end** (clean `/r-start`, no HALT, no
  work lost, conv history saved + jsonl drained clean, pushed clean); paid its deferred debt — distilled the
  Conv-049 decisions (`DEC-049-1..4`) + regenerated the digest; corrected the handoff's false "Deciding
  untouched" (the arc-A whole-draft rewrite `31ae6a9` was committed Conv 049). **GSC cadence** every-3 →
  **every-9** (`DEC-050-1`; Conv-50 check skipped, next Conv 59). **Content creation** gained **step 5
  coordinate view** + **step 6 point-form augmentation round-trip** (`DEC-050-2`): CC distills each paragraph
  faithfully → operator augments the bits (unbracketed; CC's own go in `[brackets]`) → CC writes the second
  draft; `*-view.txt` / `*-points.txt` conventions. Deciding is first through it — `deciding-view.txt` +
  faithful `deciding-points.txt` done, awaiting operator augmentation → second draft. Hopper: 1 done, 1 carried.
- **Conv 048:** **Steering guide finalized + graduated** — `[GUIDE-STEERING]` row retired. Ran the full
  `GUIDE-REVIEW` finalize pass (steps 2–15): default "it" = the AI (P20/P24 edits); P8 forty-years aside
  added; glossary/headings/entity/conjunctions clean; metaphor audit kept all (P29-S3 sense-vs-choose pair);
  pull-quote confirmed at P17; rendered-read fixes (P24 confident-nonsense inversion, P25 corner/rewrite);
  zero em-dashes; snippet reworked to seat "AI-built software"; **P31 masking-generalized** (dropped the
  video/screen-sharing + session recording/replay that sat adjacent to the learning-marketplace/Peerloop
  case); `✎` markers stripped; **declared final**. **Graduated** to
  `docs/content/steer-ai-to-build-what-you-mean.md` under a **richer dossier format** (per-step finalize
  record + piece-decision home; `DEC` at /r-end). Still dark behind the content-home flip +
  `[PROD-DEPLOY-BAN]`.
- **Conv 047:** **Content-piece lifecycle built + Steering closing redline & image** (plus routing-guard
  rework + drain fix). **Tooling:** `/r-end` dialogue-drain scoped so one conv's turns can't bleed into the
  next (`DEC-047-1`); **routing guard reworked** to a go-list review-signal + lapse-catcher hook (`DEC-047-2`
  — 9 `-ing`/`-ed` trigger words, the `🔎 Review` line, no git gate). **Content lifecycle:** new
  `reference/GUIDE-CREATE.md` (drafting pass) + `GUIDE-REVIEW.md` expanded to 15 steps (anecdote, pull-quote,
  colophon, metadata, masking, final review; on-arc check) + `COLOPHON.md` learnings; the **`r-content`
  skill** composes a per-piece **dossier**/checklist from the three docs live (`DEC-047-3`/`-5`/`-7`);
  **guide = pillar** (`DEC-047-6` — gerund labels, 10-pillar roadmap); the dossier **graduates** to
  `docs/content/<slug>.md` at sign-off (`DEC-047-8`). Retrofitted **Trusting** (graduated dossier) +
  **Steering** (`[GUIDE-STEERING]` in-flight dossier). **Steering:** closing section redlined (heading
  "…anyone's help?", claim/anecdote/takeaway split, best-customer close) + the **Linck sea-star image**
  (firm duotone tile + cropped duotone colophon + bounded-box colophon sizing standard). New rows
  `[GUIDE-STEERING]` · `[PILLAR-ROADMAP]` · `[PILLAR-DIAGRAM]`. GSC cadence skipped (done Conv 44). Hopper:
  2 verified-dropped + 2 content-ruled (earlier), then 2 promoted / 1 institutionalized / 1 carried.
- **Conv 046:** **Routing-guard enforcement + reference-repo trust-prompt fix** (no content-guide rows
  changed). Strengthened the CLAUDE.md Surfacing rule so routing/disposition vocabulary must be backed by
  a real artifact edit the same turn and a live caveat goes to the hopper — "surfaced inline" barred for
  an unresolved one (`DEC-046-1`, refines `DEC-008-2`); built + registered **`check-routing.sh`** Stop
  hook enforcing it (blocks exit 2 when a disposition phrase appears with a clean board), all five logic
  paths verified. Moved the **fg + frasergorrie** read-only reference repos to
  `permissions.additionalDirectories` + slimmed the `fgw` alias to `--add-dir ../fgw-26` (`DEC-046-2`) —
  stops the per-folder workspace-trust prompt `--add-dir` began showing in CC v2.1.325; verify next launch
  (carried). Promoted **`[GUIDE-PLANNING]`** (the need/discovery guide) from the hopper. Hopper: 1
  promoted, 1 dropped, 4 carried.
- **Conv 045:** **Steering redline — title/opening/steer-section + intuition beat** (`[SITE-CONTENT-HOME]`
  stays — prose unapproved, guide still dark/draft) and **agent-discoverability assessed + deferred**
  (`[AGENT-INITIATIVE]`, `DEC-045-1`: start nothing, revisit Conv 055). Steering: title last word
  `mean`→`meant` (`DEC-045-2`); card/snippet retuned; bridging pull-quote; Short answer + Paras 2/3 reworked
  (seat "AI-built software" entity, tense fix, italic coinage, "a skill you can learn"); P7 closer; Decide +
  confident-nonsense bullets (latter reframed around **intuition**, Steering's first literal use); new
  **"Don't I just need a better plan?"** section foreshadowing the **PLANNING guide** (`DEC-045-3`, folds in
  need/discovery); H2 nouns seated for FAQ-lift (H1/H4); record-keeping + intuition anecdotes (new
  `✎ ANECDOTE` token, `DEC-045-4`). Hopper: 4 carried.
- **Conv 044:** **`[GOOGLE-SERVICES]` Conv-44 GSC check + indexing push** (row stays — standing monitor) and
  **Steering need→mean revert** (`[SITE-CONTENT-HOME]` stays — prose unapproved). GSC filtered to submitted
  pages (operator-directed): **3/22 real pages indexed — the same 3 as Conv 41** (`/`, `/work/`, `/privacy/`);
  18 discovered-never-crawled + 1 crawled-not-indexed (`/testimonials/`); the all-known 3→7 rise was
  old-URL 301 ghosts (live-verified harmless). Health clean (manual actions/security none, sitemap Success,
  re-read Nov 13). **Pulled the lever:** manual Request-indexing on 4 core pages (`/about/ /method/ /phases/
  /contact/`) + re-request `/testimonials/` — all queued; logged for Conv-47 follow-up. Standing-check method
  expanded (`DEC-044-2`: submitted-pages filter + Nov-9 crawl floor + which-crawled-when + issues). Steering
  title reverted `need`→`mean` (`DEC-044-1`: "need"/discovery = a separate future guide). Hopper: 2 carried
  (Deciding "honest" reword, new "need"-guide idea).
- **Conv 043:** **`[SITE-CONTENT-HOME]` SEO/GEO structure + Steering first pass** (rows stay — guide prose
  unapproved). Content-art **image layout finalized** (`DEC-043-1`: two-column sticky aside, dark thin
  border, fixed 320px below 1024); hub cards retoned to one evoke-and-stop register + equalized to one
  height. **Card/snippet decoupling** (`DEC-043-2`): new `snippet` field feeds search/GEO meta while the
  card keeps the evocative `description`; authored per guide + extended to the blog. **Per-piece JSON-LD
  built** (`DEC-043-3`): `Article`/`BlogPosting` + `BreadcrumbList` + `FAQPage` with Q&A auto-extracted from
  on-page `?`-H2s (lead-in answers completed to the next H2), reusing the site `#fraser`/`#meristics` nodes;
  `ArticleJsonLd.astro` + `lib/articleJsonLd.ts`. **Entity naming** (`DEC-043-4`): "AI-built software"
  seated in Steering + Deciding (F1; F2/F3 rejected, Trust frozen). Steering **first editorial pass** +
  4-term glossary + `mean`→`need` title. Hopper: 1 promoted (flip-gate: strip `✎ OPTIONAL` markers), 2
  carried (Deciding "honest" reword, Steering need/mean).
- **Conv 042:** **`[CONTENT-ART]` + `[IMAGE-PROVENANCE]` foundation built** (new rows; programme ongoing).
  Settled the guide/article illustration approach (`DEC-042-1`): public-domain natural-history **line
  engravings** (not photos/AI — a naturalist's plate already does the diagnostic interpretation that tracing
  a photo can't), cleaned as a raster engraving, a **square detail tile** in-page + a **full-plate colophon**
  (species name + PD credit); text handled by cropping; gentle cleanup (a flat-field washed detail away,
  rejected); O'Reilly copyright clean, trade-dress a managed watch-item. Built the **image-provenance
  architecture** (`DEC-042-2`): `images` content collection + one central Zod schema, co-located
  `provenance.json` per `src/content/images/<id>/` (one source → many kept treatments; folder = id);
  single-repo co-located (rejected the docs/site split). First image **`conus-marmoreus-lister`** (Lister
  *Conus marmoreus*, PD) — `source` + `square` + `colophon`; `guides` `image` ref; **Trust guide wired +
  rendering** (verified in dev). Hopper: 2 promoted (`[CONTENT-ART]`, `[IMAGE-PROVENANCE]`), 1 dropped.
- **Conv 041:** **Trust rendered-read redline + prose-link + content-media policy + GSC check** (rows stay
  — content + flip pending). Operator read the Trust guide as a rendered page; **11 content edits** applied
  (hook lede with keyphrase, tightened opening, "prompt"→"directions you gave it", edge-case "them"
  disambiguation, "recognizable kinds", "When does checking end?" two-part test). **`DEC-041-1` prose-link
  styling unification** (`--link` token; `.prose a`↔`.text-link` → semibold, no underline; fixed a
  light-mode content link that was invisible against `--ink`). **`DEC-041-2` content-media policy**
  (byline-less → JSON-LD author; `pubDate` + optional `updatedDate`; optional `image()` hero as on-page
  adornment, og decoupled) — implemented + verified (blog schema, `writing/[slug]` render, `.prose img`).
  **`[GOOGLE-SERVICES]` cadence check** (Conv 41): no new concerns; 3/22 real pages indexed, rest
  discovered-and-queued (expected lag), old-path URLs self-healing. Hopper cleared (3 items: Trust read done,
  content-media ruled, flip steps folded to board).
- **Conv 040:** **`[SITE-CONTENT-HOME]` Trust guide redlined + glossary feature** (row stays — content +
  flip pending). Heavy operator-directed redline of `is-your-ai-built-software-sound.md` (`draft:true`/
  dark): intuition throughline, edge-cases framing, human-nature testing → automated checks, new **"Know
  your limits, and grow past them"** section, home-repair + collaborative-close fixes; then a whole-guide
  **tone/presentation review** — **glossary feature** (`DEC-040-3`), an **"it" pass** (default "it" = your
  AI-built software; non-software "it"s named), and **"I"/conjunction/metaphor balancing** (headings →
  "you"). Built the **`scripts/number-content.mjs`** `P#S#` coordinate-view tool (`DEC-040-1`). Governance:
  editing working-mode + audience-drift/for-builders capture (`DEC-040-2`, `_cc/for-builders-tidbits.md`),
  conjunction + metaphor voice rules (`DEC-040-4`), intuition theme, `VOICE.md`/`PERSONA.md` accretions.
- **Conv 039:** **`[SITE-CONTENT-HOME]` dark scaffold built + IA settled** (row stays — content + flip
  pending). Hub-and-spoke content home in `fgw-26`, gated dark by `CONTENT_HOME_LIVE` (`DEC-039-1`): `guides`
  collection + `pillar` join on `blog`; hub `/guides/`, `/guides/<slug>/`, `/writing/` (renamed from
  `/blog/`), `/writing/<slug>/`; nav "Guides" + footer "Guides"/"Writing" — all gated `CONTENT_HOME_LIVE ||
  DEV` (`DEC-039-4`, flag-gate pattern retiring the dev-preview juggling). **IA** (`DEC-039-3`): "Guides"/
  "Writing" labels, single-purpose `/guides/`+`/writing/` bound by cross-links, `/blog/` retired →
  `[BLOG-REDIRECT]`. **Draft content** (all `draft:true`): 3 cornerstone guides (Trust/Steering/Deciding) +
  1 throwaway article — pending redline. New rows **`[PROD-DEPLOY-BAN]`** (`DEC-039-2`, fail-closed guard;
  staging exempt) + **`[BLOG-REDIRECT]`**. Interface polish: nav trimmed ("Home" dropped, logo covers it;
  `DEC-039-5`), Phases added to footer, **sticky footer** (short-page fix), footer "corrected"→"steered"
  (matches og-image), `/writing/` back-link + eyebrow-collision fixed. Verified in dev via Chrome.
- **Conv 038:** **`[POSTING-PLAN]` stood up** — built `reference/CHANNELS.md` (funnel: WoM + inbound-discovery
  entries; LinkedIn/X/Website roles; biweekly cadence; Trust/Steering/Deciding pillars; sourcing + CC-drafts
  workflow; **guides+blog** content home; em-dash sanity-check + complete-sentences copy conventions). New row
  `[SITE-CONTENT-HOME]`. **X pinned post** written → posted → pinned (Straw Man → `/phases`). **OG share card**
  rebuilt to name the subject, then augmented (MSc eyebrow mark, "Over 40 years", "Built with AI / Steered by
  me", circular headshot) with a durable HTML source — prod-deployed, pin re-imaged. Editor model reaffirmed
  (CC sole editor, per-project; `DEC-038-*`). No X Premium. GSC cadence check skipped (operator). Detail in
  `_cc/x-makeover.md` + `_cc/assets/og-image.html`.
- **Conv 037:** **X.com makeover** (`[SOCIAL-MAKEOVER]` X half → row **completed**, both halves done) ✅ —
  profile reworked **live** to the educating-front-door direction: name "Fraser Gorrie, MSc 🇨🇦", concise new
  bio, new warm-dark brand header (re-rendered at 1500×500, replacing the "2 Paths" sales banner); pinned-post
  deferred to `[POSTING-PLAN]`. Detail in `_cc/x-makeover.md`. Plus: **4 site-copy/structured-data edits
  deployed & verified live** (geography "US, Canada and Europe" in `history`/`llms.txt`/`areaServed`; About
  "unreliable tool" → "powerful tool"; `DEC`s at /r-end). **Meristics LinkedIn Company Page deactivated**
  (stranded by the makeover). GSC "Alternate page / canonical" alert investigated — **benign/stale old-site
  URL, no action**. Verified the Conv-036 LinkedIn profile still live. New row `[SITE-TRAILING-SLASH-LINKS]`
  (keep slashes, align internal links — boarded, not done). ⚠️ Operator still to send Gabriel the LinkedIn rec.
- **Conv 036:** **LinkedIn makeover** (`[SOCIAL-MAKEOVER]` LinkedIn half) ✅ — whole profile reworked **live**
  to the "educating front door" direction (`DEC-036-1`) for a **buyer** audience (`DEC-036-2`): new banner,
  headline, About ("worthy companion to AI"), Experience (Software developer · Fraser Gorrie ·
  Self-employed, with the Gabriel testimonial image + clickable `/testimonials` link as permanent media),
  pinned Top-3 capability skills; Services/Projects/Licenses removed; Calendly dropped; Featured =
  testimonials link + kept posts. Built **`reference/PERSONA.md`** (persona + audience, standing reference;
  `DEC-036-3`, now cited in `CLAUDE.md`). Hopper: 3 carried items ruled (→ `[EMAIL-AUTH]`,
  `[SECURITY-TXT-RENEW]`, GEO folded into `[POSTING-PLAN]`). ⚠️ Operator to send Gabriel the recommendation
  request.
- **Conv 035:** Secondary-button fix (3:1 border + translucent hover, `DEC-035-1`) — **deployed** (cleared
  the pending Conv-033/34 deploy to staging + prod). `[GOOGLE-SERVICES]` initial GSC alignment (correct
  `sitemap-index.xml`, broken legacy sitemap removed, homepage re-crawl, **GA4 ↔ Search Console linked**) —
  row kept as a standing monitor. `security.txt` (RFC 9116) added. Built the `/r-start` **cadence
  mechanism** (`DEC-035-4`, fps port). Opened the **agent-discoverability** initiative
  (`AGENT-DISCOVERABILITY.md`, `DEC-035-2`/`-3`). Web-2026 research → 4 new 📋 rows (`[SITE-CSP]` /
  `[SITE-STRUCTURED-DATA]` / `[SITE-CONSENT]` / `[SITE-WCAG22]`) + 3 carried hopper items.
- **Conv 034:** `[SITE-HEADER-TITLE]` ✅ — the page title now reveals in the sticky header once the H1
  scrolls off: inline beside the brand at ≥1024px, a full-width second row inside the header below that
  (keeps the horizontal nav down to 768px). Eyebrow styling (uppercase ember), `IntersectionObserver`
  re-bound across ClientRouter swaps, brand forced no-wrap, anchor `scroll-padding` bumped for the
  two-row header; home omits it. Plus hopper do-nows: masking exception recorded (`DEC-034-1`),
  orphaned `.sample-badge` CSS removed.
- **Conv 033:** Turnstile → "interaction-only" (hidden unless challenged; **deployed**) · robots.txt made
  single-source (disabled Cloudflare Bot Preference Sync; `Google-Extended` allow restored) · `/llms.txt`
  canonical trailing-slash links · **Gabriel Rymberg testimonial published** (home mask-safe pull-quote +
  full named quote on `/testimonials`, `#gabriel-rymberg` deep-link, AI-era section restored) — committed,
  **not yet deployed** · anchor `scroll-padding-top` fix · lede de-identification wording. (Hopper do-nows
  + fixes, not board rows.)
- **Conv 032:** `[SITE-GO-LIVE]` ✅ — DNS cutover complete; `frasergorrie.com` serves fgw-26 (apex custom
  domain + `www` route, MX/email left intact). Plus hopper do-nows (not board rows): contact-form
  ClientRouter submit fix, image brown-band fix, 6 old-URL 301 redirects, deploy-routes guard, lint debt.
- **Conv 031:** `[SITE-ANALYTICS]` · `[SITE-SOCIAL]` · `[SITE-PERF]` · `[SITE-OG-IMAGE]` · `[SITE-NARRATIVE]`
  (signed off) · `[CONTACT-TURNSTILE]` · `[SITE-GO-LIVE]` step 1 · `[CASE-MOCKUPS]` lightbox.
- **Earlier:** `[SITE-A11Y]` / `[CASE-RECORD-SIGNOFF]`* / `[NODE-FLOOR]` ✅ Conv 030 · `[SITE-CONSISTENCY]`
  ✅ 029 · `[CASE-MOCKUPS]` / `[CASE-DIAGRAMS]` / `[CASE-RECORD-REFRESH]` ✅ 025 · `[SITE-AI-SEO]` ✅ 016 ·
  `[SITE-SEO]` / `[SITE-CROSSLINK]` ✅ 015 · `[SITE-CONTACT]` / `[SITE-TESTIMONIALS]` / `[SITE-FAQ]` /
  `[SITE-HISTORY]` ✅ 013 · `[SITE-VISUAL]` ✅ 010 · `[SITE-PHASES]` ✅ 011 · `[SITE-ASSESS]` ✅ 009 ·
  `[SITE-DEPLOY-STAGING]` ✅ 008 · `[SITE-TEST-SETUP]` ✅ 006.
  (*`[CASE-RECORD-SIGNOFF]` row persists above for its standing masking guard.)
