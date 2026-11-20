# Guide / article creation — the drafting pass (fgw)

How a new piece goes from **idea → first draft**, before the finalize pass (`GUIDE-REVIEW.md`). Codified
Conv 047. The `/r-content` skill composes a piece's full checklist from **this doc → `COLOPHON.md`
(image) → `GUIDE-REVIEW.md` (finalize)**. Drafting references: `PERSONA.md`, `VOICE.md`, `CHANNELS.md`.

Each step: CC does the mechanical part and presents; **the operator rules**.

## The pass (in order)

1. **Slot it.**
   - A **guide** is a **pillar** (`DEC-047-6`, 1:1): name the new pillar, pick its **colour** (for the
     pillar diagram), and extend `pillars.ts` (`Pillar` enum + `PILLAR_META` label / blurb / order) + the
     `/guides/` hub.
   - An **article** picks the **pillar / cornerstone guide it spokes to.**

2. **Get the operator's take.** CC **asks what the piece is about** and draws out the operator's **take** —
   the thesis in his words. A **small, rough take is fine at first**; it grows through the conversation.
   Capture the **personal-experience anecdotes** here too (the from-experience voice — this is where the
   anecdotes the review later checks for originate).
   🔴 **The take is a kept dossier field** (the thesis / why this piece exists) — not a throwaway framing
   chat. It is the *what* the piece argues, and it grows through the pass.

3. **Outline the arc.** CC drafts an **outline that *is* the message's arc** — the beats in order, the
   "Short answer" lede, the H2 questions (FAQ-lift), the close + soft CTA. Operator approves / refines.
   🔴 **The approved outline is kept as the on-arc reference** (a marked comment block with the draft,
   stripped at the pre-flip gate). Its job: during the redline, a rewritten paragraph is checked back
   against it — *"is this still on target for the story?"* — so the prose can change freely without the
   arc drifting.
   🔴 **Name the arc's *emphasis* in one line** (added Conv 049) — **where the guide puts its weight / its
   spine** (e.g. Deciding: *an explicit decision test as the spine*, not self-location). Distinct from the
   take: the take is *what* the piece argues; the emphasis is *what it foregrounds to argue it* — the beat
   everything else hangs off. Kept in the dossier beside the outline, it's the yardstick for *"is this
   still the point?"* as the outline is for *"is this still the arc?"* — and it's what makes two candidate
   arcs comparable (the A/B pick that chose this guide's spine).

4. **First draft from the outline.** On the operator's **go**, CC writes the **first draft from the
   approved outline** — prose per `VOICE.md` / `PERSONA.md`, the entity phrase seated, glossary terms
   (guides). The piece now has a body.

5. **Generate the coordinate view.** After the first draft, CC runs `node scripts/number-content.mjs
   <file>` (from `fgw-26`) and saves it to **`.scratch/<guide>-view.txt`** — the `P#S#` addressing
   substrate the finalize redline keys to (and that any per-paragraph reference keys to). Regenerate it
   whenever the draft's block structure changes (the finalize step 1 redline regenerates it as a matter of
   course). 🔴 **Convention:** `.scratch/<guide>-view.txt` = the coordinate view.
6. **Point-form skeleton → augmentation round-trip → second draft** (`DEC-050-2`). CC boils each
   paragraph of the first draft down to a **point-form skeleton** — `.scratch/<guide>-points.txt`, keyed to
   the coordinate-view `P#` — **terse bullets of the bare essentials (WHAT the paragraph must say)** plus a
   kept one-line **WHY** (its job in the arc), **as terse as possible without losing meaning.** 🔴 **The
   skeleton mirrors the draft — CC does not invent content here.** The loop:
   - **a.** CC writes the faithful skeleton. CC **may** add its own suggested bits or open questions, but
     **only in `[square brackets]`** so the operator can tell them from the distillation.
   - **b.** The operator **augments** — adds the bits he judges missing (unbracketed), and keeps or cuts
     CC's bracketed suggestions (removing the brackets on keepers).
   - **c.** CC writes the **second draft from the resulting point-form notes** — a coherent redraft that now
     carries the operator's essentials, **without CC having guessed them.**
   Why: the operator supplies the "extra bits," so CC's prose never smuggles in content the operator didn't
   choose; boil-down → augment → redraft keeps the draft honest to what he actually wants said.
   🔴 **Conventions:** `.scratch/<guide>-points.txt` = the skeleton; `[...]` = a CC addition awaiting the
   operator's keep/cut.

→ then the **image** (`COLOPHON.md`) and the **finalize pass** (`GUIDE-REVIEW.md`, whose redline checks
the prose back against this outline).

## Handoff
A piece leaves this pass when it has: its **slot** (pillar / guide), a **take**, a named **emphasis**, an
**approved outline** (kept as the arc reference), a **first draft with a body**, its **coordinate view**
(`.scratch/<guide>-view.txt`), and a **second draft** redrafted from the operator-augmented **point-form
skeleton** (`.scratch/<guide>-points.txt`). `GUIDE-REVIEW.md` takes it from there.

Throughout its life the piece's **dossier** — its `r-content` board row — is the home for the **take**, the
**emphasis**, the outline pointer, and every **piece-specific decision** (project/process decisions still
go to `DECISIONS.md`). At sign-off it graduates to a permanent record, `docs/content/<slug>.md`.
