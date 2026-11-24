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
🔁 **The GSC sweep (`[GOOGLE-SERVICES]`; next Conv 68) is the batch moment; *which* posts get captured is
driven by their per-post dated markers (Tracking horizon below), not "every sweep".** **Method:** GA4 + GSC
for site content (linked Conv 035); LinkedIn / X native post analytics read manually via Chrome with the
operator's session (same as GSC). No new tooling.

## Tracking horizon — how long a piece stays tracked (operator-ruled Conv 059)
Horizons are **per-channel wall-clock windows** matching how long each platform actually distributes a post
— **not conv-count** (convs don't map to days). Rationale: LinkedIn has a weeks-long tail (median post ~90%
of 30-day impressions by day 8–9, still growing to day 30 — Contentin 427-post study); X is effectively done
in a day (impression half-life ~80 min; ~95% of tweets get no meaningful impressions after 24h).

| Channel | Active window | Capture plan |
|---|---|---|
| **LinkedIn** | ~2 weeks | **final read at ~pub + 14 days** (load-bearing); optional early read ~day 2–3 for trajectory; a ~day-30 glance only for a strong performer |
| **X** | ~48 hours | **one read at ~pub + 2 days** (numbers are final by then), then settle |

🔧 **Mechanism — dated capture-due markers.** When a post publishes, drop a dated `⬜` capture-due marker in
its record (`docs/content/posts/<slug>.md` Outcomes) — e.g. "LinkedIn final read due ~2026-12-07". Execute it
at the **nearest GSC sweep on/after that date** (or sooner if convenient). Mirrors the `[GOOGLE-SERVICES]`
request-indexing `⬜` follow-up pattern.
⚪ **Settle.** After the final read, mark the rollup row `settled (Conv NN / date)`, keep the final numbers +
one-line read, stop tracking.
🔑 **Qualitative / inbound: no horizon** — any inbound that *references* a piece is logged verbatim whenever
it arrives, active or settled. That's the signal that matters; re-open a settled piece only on a notable
event. The horizon governs only the likes/impressions proxy.

## Rollup — published pieces

| Piece | Type | Published | Likes | Clicks | Qualitative / read |
|-------|------|-----------|-------|--------|--------------------|
| `guides-launch` | post · LinkedIn | 2026-11-23 | 1 | n/s¹ | Conv 059 (1d in): 50 impr / 31 reached, 0 comments·reposts·saves, 2 profile views — too early to read · ⬜ **final read due ~2026-12-07** |

¹ **n/s = not surfaced** — LinkedIn's post analytics shows no link-clicks metric for this post. Clicks to `/guides/` would have to come from GA4 referral traffic (not yet pulled).
