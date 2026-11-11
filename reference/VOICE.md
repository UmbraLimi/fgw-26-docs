# Site voice & tone — the standard the copy adheres to

> The single voice for every page of frasergorrie.com. Set by the operator, Conv 009. Adhered to by all
> `[SITE-NARRATIVE]` copy and every `[SITE-ASSESS]` "The record" block. (Recorded as `DEC-009-5`; the
> humility rule below added Conv 010, `DEC-010-2`.)

## The voice
Write as **Fraser speaking directly to a prospective client in a first meeting** — first person, plain,
unhurried, no pitch-deck gloss. The reader is a business owner, not an engineer.

## Warmth — the register (chosen Conv 009)
The **lightly-warmed** register: contractions ("I've", "it's"), plain everyday verbs ("figure out", not
"ascertain"), measured but human. Not cold or formal; not hyped or exclamatory. This is the register the
operator picked for About in Conv 009, over a sparer option and a more-performative one.

## Candor — load-bearing
Honest to the point of naming what went wrong. A documented miss is the trust signal, not a weakness to
hide (`DEC-000-6`, `discovery/WORKING-METHOD.md`). The `this-site` **"The record"** block is the
reference example — it states the shipped-broken deploy and the process-heavy first week plainly. Never a
claim the evidence doesn't support; never an implied shipped win that isn't there.

## Do / Don't
- **Do:** short, concrete, specific; lead with the real thing that happened; ground claims so a reader
  could check them; keep the quiet-editorial restraint in the writing too — understated, not loud.
- **Don't:** marketing superlatives ("cutting-edge", "world-class", "seamless"), hype, buzzwords, or the
  AI-default boilerplate cadence; engineer-speak at a business-owner reader.

## Humility — seasoned, not above (operator, Conv 010)
Fraser does **not** claim to stand above the reader, or above others who do this work. Avoid the
"I know …" / "I catch what others miss" / "…before you do" / "what a cheaper X can't do" framing — it
reads as boastful and superior. Write from *"I'm good at this, I'm seasoned, and here's how I can help
you"*: state the help and how it works, not a rank over the client or the field.
- **Don't:** "I know when to…", "I catch what the tests miss", "…catching it before you do", "the part a
  cheaper AI wrapper can't do for you".
- **Do:** name the client's problem and how Fraser helps with it; let grounded, checkable specifics
  carry the credibility instead of a comparative claim.

## Scope
All pages (Home, Method, Phases, Work + every case, About, Contact) and all "The record" **summary**
blocks. **Exempt (Conv 014):** the linked full audit **transcripts** at `/work/<slug>/record` are
verbatim independent-auditor output (third-person, "he"), kept as-is on purpose — the auditor's voice,
not Fraser's, is what makes them read as independent (`DEC-014-1`). The
whole-site pass bringing the existing copy fully into this voice (including the humility rule) was done
Conv 010 — all main pages, the four Work cases, and the footer. The **Phases** page (new Conv 011) was
written to this voice from the start, including the humility rule (`DEC-010-2`).

## Turns of phrase (accreted as we write)
Patterns noticed during content work and **approved by the operator** for the voice — kept separate from
the operator-set core above so provenance stays clear (the core is the standard; these are accretions,
each dated to its conv). CC surfaces a candidate when it spots a good turn of phrase or a deliberate
departure; only approved ones land here. (Mechanism set Conv 040.)

- **Intuition is a throughline theme (operator, Conv 040).** A major theme of Fraser's: help the reader
  build their own intuition, and treat that intuition as the trigger for judgement. The felt "something is
  off" is what tells you to stop and look harder. Write to surface and develop it, never to override it.
  (Thematically this is the upstream of PERSONA's "Judgement is the throughline.")
- **Credit the reader's own instinct; don't validate from above (operator, Conv 040).** Avoid the
  assistant-register "that's the right question to ask" / telling the reader their question is "right" — it
  reads as Claude, and as approving from a position over them. Prefer crediting their judgement: "that's
  your intuition serving you well." (First use: Trust guide P3.)
- **Don't use the word "honest"/"honestly" as prose framing (operator, Conv 040).** Fraser does not use
  "honest" in articles or speech; "the honest question", "the honest signal", "honestly" read as
  assistant-voice and are overused. 🔑 **Distinct from the "Candor" section above:** that governs the
  *trait* (naming what went wrong) and stays in force — this bans the *word* as a rhetorical frame, not the
  candour. (Trust guide: "the honest question" → "the question"; "the honest signal" → "the clearest
  signal".)
- **Reframe a surfaced problem as a welcome ally, not a threat (operator, Conv 040).** A caught-and-reported
  edge case is good news; the danger is the one that stays hidden. The *voice* expression of the persona's
  "empowering, not fear" stance. (Trust guide: "edge cases will turn up once real people start using your
  app. Welcome them as the friends they are.")
- **Demonstrated judgment is teaching; keep the selling at the close (operator, Conv 040).** In a *guide*
  (the teaching/acquisition backbone, see `CHANNELS.md`), a first-person "the gap I'd check first" earns its
  place as *demonstrated judgment* — Fraser's wisdom about what to prioritise is the product. But it is
  **not** a per-item template: a drumbeat of "I'd… I'd…" tips teaching into self-positioning (counter to
  Humility above). Use it sparingly; an item is fine ending on the problem. The explicit "here's how I help
  / get in touch" stays concentrated at the guide's **close** (and in the Deciding guide, which carries the
  soft CTA), never seeded through the teaching body.

## On a "site config file"
The site repo (`fgw-26`) has no brand/voice config today; this file is the durable standard. If a
machine-enforceable voice/brand config in the site repo is wanted, that's a design question for the
whole-site voice pass — to be raised then, not built speculatively.
