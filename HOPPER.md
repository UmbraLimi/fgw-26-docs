# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop / carry) before `/r-end`.
The durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] Record the masking exception (Conv 033): Gabriel's testimonial may name Gabriel + CFU (he cleared it) — exception applies to the TESTIMONIAL ONLY. The `translation-platform` case stays de-identified, `discover-jesus`/`discover-the-ub` unchanged, target language never named anywhere. Needs: update the `[CASE-RECORD-SIGNOFF]` masking guard + add a DEC at /r-end.
- [ ] Secondary buttons are almost invisible in BOTH dark and light modes (Conv 033) — need to read much more evidently as a button of secondary importance. Seen on: the "Read the full testimonial" button (home testimonial band), the "See the work" / phase CTAs on home, the "Read the full transcript" button on case-study pages — and likely every `Button variant="secondary"`. Fix the secondary button token/styling globally, not per-page.
- [ ] Orphaned `.sample-badge` CSS + its stale comment in `global.css` (Conv 033): the SAMPLE-badge markup was removed when the mock AI-era testimonials were replaced by Gabriel's real one, so the `.sample-badge` rule is now unused. Optional cleanup.
