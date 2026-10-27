# Narrative source — Gemini synthesis of the Zoom talks

> **What this is.** Prep input for `[SITE-NARRATIVE]` (critical-path Phase 2), captured Conv 008.
> Source: Gemini (NotebookLM) reading ~30 recorded Zoom conversations between Fraser and "tom" — personal
> talks about AI in which their approaches and philosophies surface. Gemini produced (1) an overview of
> Fraser's approach and (2) suggested site text/pages. **This note is a distillation, not the raw files**
> (operator keeps durable copies of those).
>
> 🔴 **Status of everything below: Gemini-synthesis, `[unverified]`.** It is *raw material*, not settled
> fact or copy. Two hard gates before any of it reaches the site:
> 1. **Honesty frame** (`discovery/WORKING-METHOD.md`, `DEC-000-6`) — the credible pitch is *not* the
>    "flawless AI-powered developer." Gemini's draft is exactly that highlight-reel voice; the honest
>    caveats (documented A/B tie/loss, pausing a project, "green ≠ proven") must be folded back in.
> 2. **Verification** — biography and specific claims need operator confirmation (see §5).

## 1. Sharpens the Conv 007 positioning thesis (the "why pay FG" warrant)

The reassurance half of the thesis (why steering AI is a skill worth paying for, vs a buyer going it
alone or hiring a cheaper AI-wrapper) was the load-bearing gap. Gemini's material gives it language:

- **Deterministic core + non-deterministic AI** — isolate AI behind "harnesses, guardrails, deterministic
  verification layers" so system stability is never compromised by AI unpredictability. Specific, strong.
- **Human firmly in the loop / no runaway agents** — active oversight of AI proposals, diffs, logic. Maps
  onto `WORKING-METHOD.md`'s "AI drives the ship forward; Fraser plans the route and course-corrects."
- **80/20 pragmatism** — AI gets 70–80% instantly; human craft owns the critical remaining 20%. Honest
  (not "AI does it all"), and quantified.
- **Context engineering & Markdown memory** (`CLAUDE.md`, `plan.md`, `background.md`) — transparent,
  version-controlled context over opaque vector stores. *This is literally what this project does* — a
  verifiable, authentic proof-point rather than a boast.
- **Intent engineering over prompts/syntax** — names the judgment a cheaper AI-wrapper can't replicate.
- **Right-sized engagement** (founders, mom-and-pop, teams ≤ ~20) — matches the thesis's small-to-medium
  audience exactly.

## 2. Concrete methodology (candidate `/method` content)

- **Straw Man → Tin Man → Iron Man** — a 3-stage prototyping cycle: rapid throwaway exploration →
  structural prototype with basic tests → production-hardened release.
- **3-stage client journey** — Idea & rapid MVP (low-code / "vibe-coding": Lovable, Replit, Bolt) →
  collaborative refinement (critique, edge cases, feasibility) → production engineering (Claude Code +
  strict standards, clean schemas, resilient deploy).
- **Domain glossary enforcement** — lock precise glossaries upfront (e.g. `session` vs `transaction`,
  `student` vs `teacher`) to prevent schema/terminology drift.

## 3. Client-engagement values (trust material)

- Pride of craft over artificial micro-budgets; avoiding fragile "Frankenstein" code; keep the eye on
  overarching architecture.
- **Value-first invoicing** — bill when real, demonstrable utility lands, not for back-end plumbing that
  hasn't yet yielded user-facing value.
- Transparent technical mentorship — guide trade-offs, protect clients from premature launches and bloat.

## 4. Gemini's suggested site shape (draft input only)

- **Pages:** Hero · About · Services (3) · Methodology & Client Commitment.
- **Services (3):** Prototype→Production Engineering · System Architecture & Refactoring · Fractional
  Technical Mentorship.
- Verbatim draft copy is in the appendix below — raw clay for Phase 2, not settled copy.

## 5. ⚠️ Needs verification before publish (honesty frame)

- **Biography `[unverified]`:** Dofasco foundries; field biology / aquatic ecology; early 4GL relational
  tools + Lisp environments; length of career. 🔴 **Number mismatch to reconcile:** `WORKING-METHOD.md`
  says **"44-year practitioner"**; Gemini says "decades / over three decades." Operator to settle.
- About-copy phrasing ("slogging through streams," "blue-collar work ethic," "biologist's eye for
  ecosystem balance") is Gemini's voice — needs operator sign-off.

## 6. ⚠️ Tensions to reconcile in Phase 2

- **Gemini omits the honesty half entirely.** It is pure highlight reel; `WORKING-METHOD.md` is explicit
  that the documented caveats are the *most convincing evidence the portrayal is honest*. Any drafted copy
  must reintroduce them.
- **Voice / headline:** Gemini's hero options are genericer and more hype-adjacent than the current
  scaffold h1 ("I steer; AI drives — and I know when to overrule it"). Direction to pick.
- **Publishability:** no client names appear; only tool-vendor names (fine). Clear to use once biography
  is verified. (Transcript-citation artifacts like `[301–303]` stripped from the appendix.)

---

## Appendix — Gemini's verbatim draft copy (raw clay; rework for honesty + voice)

> Kept verbatim only for the parts worth reacting to in Phase 2. Not endorsed copy. Citation-number
> artifacts removed.

**Hero — headline options**
1. *Craft-Driven Software Engineering for Growing Businesses.*
2. *From Vibe-Coded Prototype to Production-Grade Software.*
3. *Pragmatic Engineering, Honest Value, and AI-Accelerated Delivery.*

**Hero — sub-headline / tagline**
*I help founders and small teams turn rough software concepts into clean, resilient, production-ready
systems.*

**About page (draft)**
*"I'm Fraser Gorrie. My path to software toolmaking runs through heavy industry at Dofasco foundries and
slogging through streams as an aquatic biologist. For over three decades, I've built software tools with a
blue-collar work ethic and a biologist's eye for ecosystem balance.*

*I don't measure success by billable hours or hype. I collaborate directly with founders and business
owners to build software we can both be proud of — clean architectures, transparent value-first billing,
and pragmatic AI integration that keeps human craft firmly at the center."*

**Services (draft)**
1. **Prototype to Production Engineering** — turning low-code / AI-generated MVPs (Replit, Lovable, Bolt)
   into secure, tested, production-grade applications.
2. **System Architecture & Refactoring** — restructuring fragile or bloated codebases into clean, scalable
   systems with strict domain modeling.
3. **Fractional Technical Mentorship** — a trusted technical sounding board to evaluate software decisions,
   manage AI toolsets, and guide product-roadmap choices.

**Methodology & client commitment (draft)**
- **Value-First Invoicing** — invoiced when real, demonstrable utility is delivered, not for raw hours on
  behind-the-scenes plumbing.
- **The "Straw Man" Guarantee** — test and critique ideas rapidly before locking down production code,
  saving time and avoiding costly rewrites.
- **AI with Human Oversight** — harness modern AI for dramatic speed while applying engineering rigor for
  security and dependability.
