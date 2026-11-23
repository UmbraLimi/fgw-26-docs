# Content analytics — outcomes tracking (posts + articles/guides)

> The standing process for tracking how published content performs, so we **learn what resonates** (which
> pillar / angle lands) and steer future content. Created Conv 058 at the operator's direction; board row
> `[CONTENT-ANALYTICS]`.

## Principle — qualitative-first (CHANNELS.md "Measurement")
Leads resist attribution; a serious person arrives already convinced. **Success is qualitative:** right-fit
inbound that references a specific piece. We do **not** chase vanity metrics as the goal.

🔑 **Early-phase exception (operator, Conv 058):** at the *start* of the posting history, before qualitative
signal accumulates, **likes/reactions are tracked** as a weak proxy for "the post was at least seen." Vanity
or not, it points to which posts got read. A weak early signal — revisit (and possibly drop) once richer
qualitative data exists.

## Capture set (small + meaningful — not everything a platform shows)
**Social posts (LinkedIn, X):**
- Likes / reactions *(early-phase readership proxy)*
- Link clicks (to the site)
- Saves / reshares
- Substantive comments (not raw impression/like counts beyond the proxy above)

**Site content (guides, articles):**
- GA4 pageviews + engagement
- GSC impressions / clicks / avg position for the piece's URL
- Top referrers

**Both — the signal that matters most:**
- Qualitative: any inbound / DM / mention that *referenced* the piece — captured **verbatim**.
- A one-line **read**: did the angle / pillar land? more or less of what?

## Where it lives
- **Per piece:** an **Outcomes** section in the piece's durable record — a post's
  `docs/content/posts/<slug>.md`, an article/guide's graduated dossier `docs/content/<slug>.md`.
- **Rollup:** the table below (one row per published piece).

## Cadence + method
🔁 **Rides the 9-conv GSC sweep** (`[GOOGLE-SERVICES]`; next Conv 59) — no separate rhythm. One pass updates
each recent piece's Outcomes section + the rollup. **Method:** GA4 + GSC for site content (linked Conv 035);
LinkedIn / X native post analytics read manually via Chrome with the operator's session (same as GSC). No
new tooling.

## Rollup — published pieces

| Piece | Type | Published | Likes | Clicks | Qualitative / read |
|-------|------|-----------|-------|--------|--------------------|
| `guides-launch` | post · LinkedIn | 2026-11-23 | — | — | pending (Conv-59 sweep) |
