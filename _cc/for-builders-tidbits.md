# For-builders tidbits — capture bin

> **What this is.** A holding place for **coder/builder-aimed** advice that surfaces while writing
> **buyer-facing** content and gets reframed or cut to keep that content on-audience. Instead of dropping
> it, we save it here. (Created Conv 040 at the operator's direction.)
>
> **Why keep it.** Fraser occasionally wants to write a **rare, separate "for builders" article** — advice
> for people using AI to build software. It (a) showcases his teaching propensity, and (b) the more
> technical material is itself instructive to **buyers** who want to understand the difference between
> themselves and professional builders of software. This doc is the raw material for that piece.
>
> **How it fills.** When CC catches audience-drift in buyer copy (teaching coders instead of buyers), it
> reframes the copy for the buyer **and** drops the coder-angled version here with provenance. Raw capture
> — shaped later when/if the article is written. See `reference/PERSONA.md` ("teaches coders too, a side
> channel") and `reference/VOICE.md`.

## Tidbits

### Edge cases: predictable vs. unpredictable (from the Trust guide, Conv 040)
Cut from `is-your-ai-built-software-sound.md` when the passage was reframed for buyers (the buyer version
teaches the *standard to expect*; this coder version assigns the reader the build task). Original
coder-framed dictation:

> What we're talking about are **edge cases**: the things users might do. Some edge cases are predictable,
> some are not. Your job is to maximize the first and minimize the second. What's left, you catch and
> report gracefully, so you can fix and update your app for the unknowns that inevitably turn up once it
> goes live.

Note (operator, Conv 040): there are really only **two** cases — predictable and unpredictable. "What's
left" is just the unpredictable restated; catch-and-report is the correct *handling* of the unpredictable
ones, not a third category.

### Graceful handling: catch, log, report (from the Trust guide, Conv 040)
Reframed out of P7S3: the buyer version keeps only the outcome ("it tells you plainly that something went
wrong rather than failing silently"); the coder vernacular ("logs them for future work") was removed. The
builder mechanics, kept here:

> For the unpredictable edge cases you can't foresee, the build should catch them, **log** them for future
> work, then report the issue plainly rather than failing silently — so the genuine unknowns that surface
> after launch are recorded and fixable, not lost.

(Vernacular is the tell: "logging" is coder-speak; the buyer copy carries the same idea in plain words.)

### Test data that grows with each edge case (from the Trust guide, Conv 040)
Intended as the "what I'd do" ending for the load/over-time gap (P13); the coder framing (building test
data, "bullet-proof") was parked and the buyer ending became "put it under real load with many times the
people and data it's seen." Original:

> Creating comprehensive testing data that improves with each new edge case you find is the key to making
> your app bullet-proof.

Note (operator, Conv 040): a genuine builder practice (accumulate a growing regression suite from found
edge cases). For buyers it over-reaches on two counts: it's a build task they don't perform, and
"bullet-proof" overpromises (nothing is; "dependable" is the honest ceiling per `VOICE.md` candor).

### Automated testing at scale: thousands of tests per release (from the Trust guide, Conv 040)
Worked into P13S4 as a "what I'd do." Buyer version keeps the idea in plain words ("automated checks:
tests that run themselves the same way every time… thousands of them running on every change"); the coder
specifics were parked. Original:

> I'd add automated testing. It's not unusual to have 5000 tests run before a feature or a fix gets
> launched.

Note (operator, Conv 040): the vernacular tells — "automated testing," a hard count ("5000 tests"),
"feature / fix / launched" (CI/release-speak). Automation is the real answer to the human-nature testing
gap (machines don't tire); buyers get that in plain language, builders get the concrete practice here.
