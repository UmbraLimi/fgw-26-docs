# Social post — the finalize pass (fgw)

One repeatable pass to take a social post from **drafted** to **ready-to-publish** — the analog of
`GUIDE-REVIEW.md`, scaled to a short post. Consult `PERSONA.md`, `VOICE.md`, `CHANNELS.md`. **Lean by
intent: a checklist, not a gate.** Each step: CC does the mechanical part and presents; **the operator
rules**. "Checked, clean" is a valid outcome — stated, never silently skipped, and recorded in the dossier.

> **Channel-tagged, one document (`DEC` Conv 058).** `[all]` = runs for every channel; `[LinkedIn]` /
> `[X]` = specific to that channel, shown **inside** the step it belongs to. New channels (Substack,
> YouTube Shorts, …) add their own tag + sub-notes here — don't fork the document. The operator may add
> channel-specific create/review steps over time; the posts per channel are expected to diverge.

## The pass (in order)

**Voice & persona**
1. **Buyer-chord & persona check** `[all]` — strikes the **wonder → unease** chord without fear
   (`PERSONA.md`); leads with usefulness, not credentials; seasoning felt once, not drummed; posture is
   "the work comes to me," never hungry.
2. **Voice check** `[all]` — lightly-warmed register, contractions, plain verbs; **humility** (never above
   the reader or others who do this work); candor without the *word* "honest" as a frame; no marketing
   superlatives / hype / buzzwords (`VOICE.md`).
3. **Buyer-not-builder vernacular** `[all]` — plain language; no coder jargon unless deliberately
   introduced and explained; watch the coder-teaching drift and reframe to the buyer (`PERSONA.md`).

**Tells & cadence**
4. **Signature-phrase / AI-tell audit** `[all]` — CC's verbal tics (`VOICE.md` running list: *lean on* →
   relies on/depends on always; *load-bearing* ~1; *stand behind* ~1). A short post should carry none of
   the always-change tics.
5. **Fragment / complete-sentence check** `[LinkedIn]` `[X]` — prefer complete sentences; one rhetorical
   question is fine, a pile-up of fragments is not (reads as ad copy / an AI-marketing tell, `CHANNELS.md`).
6. **Conjunction & metaphor scan** `[all]` — a short post rarely needs the full guide audits; a quick scan
   for a sentence-initial *And/But/So* pile-up and for clichéd phrasing. Keep the distinctive/unexpected
   metaphors (`VOICE.md`); operator rules the close calls.
7. **Em-dash sanity check** `[all]` 🔴 — surface **every** em-dash for a conscious ruling (CLAUDE.md;
   an AI tell, sharpest on social). Mandatory before publish.

**Safety**
8. **Masking check** `[all]` — any project reference is confirmed **not client-identifiable**: no real
   client / source / target, nothing that bridges to a de-identified case (`[CASE-RECORD-SIGNOFF]`, 🔴).

**Funnel**
9. **CTA restraint & link mechanics** —
   - `[all]` — the CTA is **soft** and the posture selective; the explicit "get in touch" stays light.
     🔴 **One outbound link per post, to the site** (more than one reads as salesy, operator Conv 058);
     never a sideways link to another channel.
   - `[LinkedIn]` — the single link points to the site (serious contact).
   - `[X]` — attach the visual as **media** (no link card renders); the single link points to the site.

**Gate**
10. **Approval gate** `[all]` 🔴 — post copy goes live **only after the operator approves it**
    (`DEC-024-1` / `DEC-037-6`): CC drafts → operator approves → publish. On publish, record status + date
    in `_cc/content-backlog.md` and graduate the dossier (below).

## Graduate the post file
The post file `docs/content/posts/<slug>.md` already exists (created at draft-time, `POST-CREATE.md` step 4).
On publish: flip `status: published`, fill `published:` with the date, confirm the file carries the **final
copy** + the finalize-pass outcomes (incl. em-dash + masking rulings), and **retire the board row** (the post
analog of a guide's graduated dossier). The **Outcomes** section (analytics) is filled later at the
content-analytics sweep — method + capture set in `_cc/content-analytics.md` (rides the 9-conv GSC cadence;
board row `[CONTENT-ANALYTICS]`). Also move the post's backlog line to **✅ Published**.
