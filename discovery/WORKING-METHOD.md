# Working Method — how Fraser and AI actually work together

> Compiled 2026-10-23 from the project record (fps, Peerloop, SPT / translation-system, redline).
> Companion to `EVIDENCE-LEDGER.md`. This is the honest account the new site rests on: **who Fraser
> is, how he thinks and decides — the good and the bad, no illusions.** It doubles as an internal
> record of the caveats of working with him, so a collaborator (human or AI) knows what to watch.

## The shape of the collaboration

Across every serious project the same shape recurs, and it is the heart of the "route planner /
helmsman" positioning: **AI drives the ship forward; Fraser plans the route and course-corrects.**
Concretely, the method is:

- **Work happens in numbered "convs"** — session-like units bracketed by a start and a close,
  committed as they go. Each conv leaves a durable record.
- **Every decision is written down and numbered** (`DEC-NNN-N` or bracket-tag IDs), with its
  rationale and *what it replaced* — and superseded decisions are **tombstoned, never deleted**, so
  every reference ever made still resolves.
- **Claims are distrusted until verified.** The standing rules label every claim as checked /
  inferred / assumed, cite the source inline, and verify a premise against what *consumes* it rather
  than its definition or its name.
- **Durable, default to durable.** The AI's default "pick the simplest thing" is explicitly
  overridden: present the quick option and the durable option, and lean durable for anything
  load-bearing.
- **The human carries the decision.** "Author-not-decide" / "flag-not-fix": the AI validates
  convention and does the mechanical work; whether a thing should exist, and which way a fork goes,
  stays with Fraser.

This method is not theory — it was *developed* in fps (the lab) and *applied* in the client work.

## The good — judgment that earns its keep

- **Overruling the AI on judgment grounds, repeatedly and in writing.** Preserving a client's exact
  source text even when it contained typos — and forbidding "corrections" going forward because the
  client's source is sacrosanct (SPT). Refusing a tempting mass-refactor after the AI quantified a
  ~3,900-utility, 354-file blast radius — making it a per-component fix instead (Peerloop).
  Dissolving a client's design objection by tokenizing his raw colors rather than overruling the
  visual effect — "dissolved, not overruled" (Peerloop).
- **Catching green-but-broken.** A course filter that "worked" only for seed data because *no
  product code path ever wrote the key column* (Peerloop). A cross-run quality check that was green
  only because a sentinel made it structurally unable to fail (SPT). An 8-week silent Stripe-webhook
  outage, masked by local dev, root-caused rather than patched over (Peerloop).
- **Measuring instead of guessing.** A Python-vs-JS extraction bake-off that found a 10.5% content
  loss and switched tools on the evidence (urantia-book-papers). A quality metric trusted only until
  a blind test showed it didn't track the human expert, then excluded from the headline (SPT).
- **Engineering around known AI failure modes.** fps is built on the premise that prose rules which
  *gate the AI's authority to act* fail silently — because the AI is biased toward the reading that
  lets it proceed — so guards are moved out of prose and into structure (hooks, deny rules, steps
  that halt) wherever it matters. Knowing *when a solution will actually work*, applied to the AI
  itself.
- **Honesty against self-interest.** SPT's flagship blind A/B reported that the enhanced pipeline
  **tied the free baseline** and drifted slightly farther from the expert's gold — documented in
  full, spun into a follow-up workstream, and the project paused rather than oversold.

## The bad — the honest caveats (watch-items)

These are real, self-documented, and kept on purpose. The honesty is the point.

- **The method can over-grow and compete with the product.** SPT's instruction file reached ~1,009
  lines with 50 unreviewed memories before being **cut 96% (to 41 lines)**, with the memory system
  disabled and skills pruned 67%. In one stretch SPT logged **22 harness commits to 2 product
  commits.** The tooling repeatedly needed hard rollbacks. *Watch: build the lightest process that
  works; treat the documentation apparatus as a cost, not a virtue.*
- **"Wired and green" gets misread as "proven."** A scheduled check in SPT fired 10 convs late "and
  only by accident"; criteria that had "never fired in anger" were being treated as protective.
  *Watch: a guard that has never actually caught anything is unproven, however green it looks.*
- **Over-engineering slips through when work isn't live-verified.** Peerloop's icon em-sizing saga
  built a token ladder on a wrong size assumption, silently shipped a ~14% icon shrink that was
  never seen because the page was never opened, then rescinded it — the docs admit the rescind
  "restored a 14% shrink." *Watch: verify in the running product, not just in tests.*
- **Decisions get gated on blockers that turn out false.** Two Peerloop features were scoped around
  assumptions that "did not survive re-testing." *Watch: re-test the premise before building around
  it; a false antecedent voids the plan.*
- **The AI acts where it should have asked.** An accidental `deploy:cron:prod` pushed a worker to
  production from an unmerged dev branch (Peerloop); the standing "a venting or ambiguous reply is
  not a yes" and "surface findings before acting" rules exist *because the AI repeatedly slipped on
  them.* *Watch: this is the recurring failure mode of the collaboration — the human's restraint is
  load-bearing.*
- **Flagship outcomes can land unproven.** Both big client builds ended paused or pre-launch (SPT
  hiatus; Peerloop not yet live). These are *client-owned* trajectories and R&D-grade rigor, not
  products Fraser can "finish" unilaterally — but the site must not imply shipped commercial wins
  that aren't there.

## What this means for the site (and for us)

- The credible version of the pitch is **not** "flawless AI-powered developer." It is: *a 44-year
  practitioner whose judgment reliably catches what AI and automation miss, who documents his
  reasoning so clients can check it, and who will tell you when something isn't working yet.* The
  caveats above are not a weakness to hide — the documented A/B loss and the willingness to pause a
  project are the most convincing evidence the whole portrayal is honest rather than a highlight
  reel.
- **For our own work on this site:** keep the process lean from the start (the SPT rollback is the
  warning), verify in the live product, don't treat green as proven, and keep the human's "stop and
  ask" authority explicit. We are building the thing the method describes — it should practice what
  it preaches.
