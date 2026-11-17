# Agent discoverability — being found and answerable by AI agents

**Status:** active initiative (opened Conv 035). **Owner:** Fraser. **Home doc:** this file.
**Thesis:** when an agent is tasked to *"find someone like Fraser,"* frasergorrie.com should not merely
be *scraped* — it should **answer**: authoritatively, in structured form, on our terms, with a contact
path we own. We intend to be early in the agent-finding space and to **track its growth** so we adopt
whatever standard wins.

> Claims here are tagged. `[operator, Conv NNN]` = Fraser confirmed. `[checked: …]` = verified this conv.
> `[inferred]` = reasoned, not verified. External-landscape facts are **volatile** — see the watch (§7).

---

## 1. The scenario we are designing for

A client / hiring lead / recruiter delegates to an agent: *"Find an engineer who's built production
LLM/translation systems, works across Astro/Cloudflare, ships with unusual rigor — in North America,
fluent English."* That agent discovers candidates via (a) generative search grounded in crawled pages,
(b) directory/API lookups, (c) a direct site visit it scrapes, and increasingly (d) **agent-native
protocols** where a site exposes queryable tools. In (a)–(c) we are *scraped* — lossy, uncontrolled,
invisible to us. The goal of this initiative is to move us toward (d): **we answer.**

## 2. Readiness layers (cheapest → frontier)

- **L0 — be extracted correctly:** clean structured content + `llms.txt` (largely done). Serves the
  mainstream search-grounded agents, which is ~all real volume today.
- **L1 — declare ourselves machine-readably:** rich JSON-LD `Person` + an `ai-agent.json` manifest at
  `/.well-known/`, cross-referenced from `llms.txt`.
- **L2 — the MCP server:** query tools an agent calls (§6), on the existing Cloudflare Worker.
- **L3 — verified + capture:** Web Bot Auth (RFC 9421 HTTP Message Signatures) to recognize legit
  agents, rate-limit the rest; log agent queries to learn who asks what.

We commit to pursuing L1–L2 and watching L3.

## 3. The `.private` schema model (keystone)

Today the masking rules (`CURRENT-TASKS.md` → `[CASE-RECORD-SIGNOFF]`) live as prose, enforced by
vigilance. We make them **structural**: every `src/data` record splits into public fields + a single
`private` object.

```jsonc
{
  "id": "translation-platform",
  "title": "Translation platform",      // public (de-identified)
  "domain": "localization / LLM",        // public
  "costRange": "…",                      // public, queryable (see §5)
  "private": {
    "client": "The Center for Unity",
    "sourceText": "The Urantia Book",
    "targetLanguage": "…"
  }
}
```

A **single serialization boundary** — `toPublic(record)` strips `.private` — feeds **both** the rendered
site and every MCP tool. **Default-deny:** a surface can only leak gated data by explicitly reaching into
`.private`, which no public path does. This is better than the status quo even if we never ship MCP, and
it is the enforcement the MCP footgun required.

### 3a. Target: 100% structural masking `[operator, Conv 035]`

Two current guards are *relational*, not field-level, and must be made structural rather than left as
residual policy:

- **"No case-study link bridging the named testimonial to the de-identified case."** → Any reference
  from the testimonial record to a case lives under `.private`; no public field renders the bridge.
- **"Target language is never named anywhere."** → The value exists **only** as a `.private` key in
  exactly one record, and is **never** a public field in any record — so it is structurally absent from
  all public output. This holds only if it is also never hardcoded in public prose → see §4.

Reaching 100% depends on §4 (parameterizing prose) so that no gated value survives as inline text.

## 4. Parameterize prose → data `[operator, Conv 035]`

Load-bearing facts currently baked into page **text** move into `src/data` as fields — public or
`.private` as appropriate. Two payoffs: a single source of truth, and **agent-queryable** values.

- **Project cost range** visitors should expect → a **public** `costRange` field → answerable by a
  budget-filtered agent query. (Example the operator named.)
- Any gated value that appears inline today → a `.private` field, removed from prose (prerequisite for
  §3a's 100% goal).
- Candidate public params to extract: cost range, engagement model, availability, capability tags.

## 5. The answerable public profile (discoverability filters)

The curated public facts a tasked agent filters on. These are **public** (outside `.private`) and map to
both schema.org `Person` and the MCP `evaluate_fit` tool:

| Fact | Value | schema.org | MCP filter |
|---|---|---|---|
| Location / serves | Ontario, **Canada**; serves **North America / Canada** `[operator, Conv 035]` | `homeLocation` / `address` (CA-ON) | `region: ["North America","Canada"]` |
| Language | **English — native / fluent** `[operator, Conv 035]` | `knowsLanguage: ["en"]` | `language: "en"` |
| Timezone | **Eastern Time**, `America/Toronto` (UTC−5/−4) `[operator, Conv 035]` | `additionalProperty` tz | `timezone: "America/Toronto"` |
| Experience depth | **44 years** in software `[discovery/BIO-VERIFIED.md]` | `description` | `experience_years` |
| Cost range | from §4 `costRange` | `PriceSpecification` (approx.) | `budget` |

🔴 **Publishability guards still apply** (`discovery/BIO-VERIFIED.md`): no Dofasco-as-work-experience,
no "Lisp," verified-bio facts only. The public profile must not out-claim the verified record.

## 6. MCP architecture

A **remote MCP server on the existing Cloudflare Worker** `[inferred — Cloudflare has remote-MCP /
Agents support; confirm at build]`. Fed by `toPublic(src/data)` (§3). Tools:

- `get_profile()` → identity, focus, availability, the §5 filters.
- `search_experience(capability)` → matching projects + evidence.
- **`evaluate_fit(requirements[])` → `{ match, confidence, evidence, relevant_projects }`** — the
  keystone tool; it answers the tasking agent's literal question and lands us on its shortlist.
- `get_case(id)` → `toPublic` case detail (masking enforced by §3).
- `request_contact(purpose, from)` → vetted hand-off to the existing contact pipeline; **human-in-the-
  loop** (notify Fraser), rate-limited, never auto-anything.

Read tools public (we *want* agents to read them); the contact tool is the only abuse surface.

## 7. Discovery strategy + the growth watch

A perfect MCP server is inert if tasked agents can't find it. So:

- **Publish to the official MCP Registry** — `registry.modelcontextprotocol.io`, via the `mcp-publisher`
  CLI + a `server.json`, DNS-verified namespace; several directories auto-ingest from it.
  `[checked: web search, Conv 035]`
- **Then third-party directories:** Glama, Smithery (now a plain directory since its hosted proxy
  retired 31 Oct 2026), PulseMCP (ingests the registry; submissions intermittently paused), mcp.so,
  mcp.directory, GitHub's MCP registry. `[checked: web search, Conv 035 — counts/status volatile]`
- **Plus** the `ai-agent.json` manifest, JSON-LD `Person`, and `llms.txt` cross-reference (L1).

### `[AGENT-DISCOVERY-WATCH]` — periodic landscape briefing `[operator, Conv 035]`

A standing track: a periodic briefing on the evolving space — standards (WebMCP, `ai-agent.json`, Web
Bot Auth), registries/directories (new entrants, submission status, ingestion), and **what filters
agents actually query on** — so we support whatever emerges. **Mechanism `[operator, Conv 035]`:** manual
cadence (no scheduled cloud agent) — **run every 10 convs, starting Conv 045** (→ 045, 055, 065, …). The
refresh updates the snapshot below and reports deltas.

**Surfacing mechanism — built `[operator, Conv 035]`.** The port was briefly deferred, then reversed the
same conv: the **second** periodic task (`[GOOGLE-SERVICES]`, every 3 convs) appeared, meeting the
pre-set trigger for building the shared mechanism. We ported the fps inline-trigger pattern into
`/r-start`: a `Cadence checks` block in the pre-computed context does mechanical arithmetic on
`CONV-COUNTER`, and Step 6 surfaces each line verbatim (DUE → the conv's recommended action; the trigger
only surfaces, never runs). Two triggers live there now — `[AGENT-DISCOVERY-WATCH]` due when `n % 10 == 5
&& n ≥ 45`, `[GOOGLE-SERVICES]` due when `n % 3 == 2 && n ≥ 38`. A general `PERIODIC` registry stays the
refactor to reach for only if cadence tasks proliferate. (`DEC-035-4`; adopted from fps
`DEC-145-1`/`DEC-151-2`.)

#### Landscape snapshot — Conv 045 `[checked: web search, Conv 045 — all external facts volatile, secondary-sourced]`

Deltas vs the Conv-035 snapshot below. **Net:** transport/verification (Web Bot Auth, WebMCP-in-browser)
is consolidating faster than the **manifest layer**, which is still forking — directly relevant to our L1
bet on `ai-agent.json`.

- **WebMCP** — now a W3C **Draft Community Group Report** (Web ML CG), **not** on the Standards Track; a
  draft charter for a new **Agentic Web Working Group** names it as starting input (chairs/dates TBD).
  **Chrome origin trial from Chrome 149** (Edge 150 following); API renamed `navigator.modelContext` →
  `document.modelContext` (still churning). Still overkill for a static portfolio; watch.
- **Web Bot Auth (our L3)** — biggest mover, was "watch," now shipping. **Cloudflare folded it into
  Verified Bots** (Free/Pro live, expanding to Business/Enterprise); public keys at
  `/.well-known/http-message-signatures-directory`; since **1 Jul 2026 Cloudflare separates identity from
  access** (verified ≠ allowed). Other verifiers: AWS WAF, Akamai, HUMAN, Vercel. IETF WG chartered early
  2026, BCP targeted Aug 2026 but **no adopted WG docs as of mid-Aug** (individual drafts). A signature
  identifies the *operator*, not the principal.
- **MCP registry + directories** — registry still canonical upstream (`server.json` → downstream ingest)
  but **still "preview, no durability guarantees"** (June 2026). Counts grew and still disagree wildly:
  Glama ~96k–113k; **PulseMCP ~21.6k, not taking submissions**; **Smithery acquired by Arcade** (~5 Aug
  2026, paid subs refunded) — consistent with the Conv-035 note that its hosted proxy retired, now a plain
  directory. New entrant **Unyly** ingests the registry.
- **`ai-agent.json`** (our L1 plan names it) — Aiia spec published **28 Mar 2026**, but the namespace is
  **fragmented**: three draft specs claim `/.well-known/agent.json`; it reads as an **also-ran** next to
  A2A's **AgentCard** (more institutional backing) and Wildcard's OpenAPI-based `agents.json`. A **W3C AIVS
  proposal (May 2026)** frames a unifying `agent.json` as a *superset* of MCP `server.json` + A2A card +
  `ai-agent.json`. The manifest layer has **not** converged on a winner.
- **Agent-readiness adoption** (Cloudflare Radar) — still **~4%** of sites declare AI prefs; MCP cards grew
  from "<15 sites" to **0.31% of ~110k domains** (~340) mid-Aug, and **0.43%→1.17% among tech domains** by
  end-Sep. Minority position, less extreme than Conv 035.
- **Lighthouse** — confirmed **13.3 (7 May 2026)** Agentic Browsing category: accessibility tree, WebMCP
  tools, layout stability, `llms.txt`; pass/fail ratio (no 0–100); **CLI/JSON only**, not DevTools/PSI.
- **NLWeb** (new, not in Conv 035) — Microsoft/O'Reilly open protocol; **every NLWeb instance also acts as
  an MCP server**; Cloudflare added native support via AutoRAG. Adoption **pilot-stage/stalled** (reference
  impl no tagged release, ~flat since June 2026); analysts forecast 2–3 yrs to real adoption.

#### Landscape snapshot — Conv 035 `[checked: web search, Conv 035]`

- **WebMCP** (Google) — early preview Feb 2026; agentic-web direction at I/O. Overkill for a static
  portfolio now; watch.
- **`ai-agent.json`** (Aiia spec, ~Mar 2026) — `/.well-known/ai-agent.json` manifest.
- **Agent-readiness is thin:** Cloudflare Radar (Apr 2026) — ~4% of sites declare AI prefs; <15 of
  200k use MCP cards. Being early here is a genuine minority position.
- **Lighthouse** agentic category on by default since 13.3.0 (May 2026) — useful baseline scanner.
- **MCP registry** is the canonical publish target; directory counts range wildly by source (Glama
  cited at 21k–111k) — treat all counts as indicative.

## 8. Decisions (recorded Conv 035 — `DEC-035-2` data model, `DEC-035-3` pursue-initiative, `DEC-035-4` cadence mechanism)

- **`.private` schema convention:** gated data lives under a per-record `.private` key; a single
  `toPublic()` boundary strips it; it is the one enforcement point for site + MCP. Target 100%
  structural masking (§3a). Supersedes prose-only enforcement of `[CASE-RECORD-SIGNOFF]` (that row
  becomes the human-readable policy; the schema is the mechanism).
- **Parameterize load-bearing prose into `src/data`** (§4) — single source of truth + agent-queryable;
  prerequisite for 100% masking.
- **Pursue agent-discoverability as a tracked initiative** with this file as home.
- **Port the fps inline-trigger cadence mechanism into `/r-start`** (§7): two triggers —
  `[GOOGLE-SERVICES]` every 3 convs from 038, `[AGENT-DISCOVERY-WATCH]` every 10 from 045 — surfaced
  verbatim at Step 6. Built this conv once the second periodic task appeared (supersedes the earlier
  same-conv deferral). Adopted from fps `DEC-145-1`/`DEC-151-2`.

## 9. Proposed board rows (to rule at /r-hopper)

- `[DATA-PRIVATE-SCHEMA]` — reorganize `src/data` with `.private` + a `toPublic()` boundary (keystone;
  do first).
- `[SITE-PARAMETERIZE]` — move prose facts (cost range, etc.) into data.
- `[AGENT-PROFILE]` — public `Person`/profile + JSON-LD + `ai-agent.json`, carrying the §5 facts.
- `[AGENT-MCP]` — remote MCP server on the Worker (§6).
- `[AGENT-DIRECTORY-LISTINGS]` — publish to the MCP registry + directories (§7).
- `[AGENT-DISCOVERY-WATCH]` — the periodic briefing (§7); **every 10 convs from Conv 045**
  (`[operator, Conv 035]`), surfaced automatically by the `/r-start` cadence mechanism (§7, built Conv
  035) — no hand-maintained marker needed.

## 10. Action-plan assessment — Conv 045 `[operator-directed assessment, Conv 045]`

First assessment of the §9 menu against a refreshed landscape (§7 Conv-045 snapshot). **Decision
(operator, Conv 045): start nothing now — the initiative stays dark behind the content-home flip; revisit
the whole plan at the next watch (Conv 055).** Board handle: `[AGENT-INITIATIVE]` (📋 Unordered).

**Two gates bear on every row:** `[PROD-DEPLOY-BAN]` (no prod deploy until the content-home flip) and the
declared current priority (Steering/Deciding redlines → flip). Per-row disposition:

- **`[DATA-PRIVATE-SCHEMA]`** — the **only** row with zero external-standard dependency: an internal
  `src/data` refactor, authorable now (deploy comes later, so the ban doesn't block *building* it), and
  **better-than-status-quo masking even if MCP never ships** (§3). Prerequisite for everything
  agent-facing. *Not started this conv* — deferred to the Conv-055 re-weigh.
- **`[SITE-PARAMETERIZE]`** — depends on the schema above; authorable now, same deploy caveat; lower
  standalone urgency.
- **`[AGENT-PROFILE]`** — split: the JSON-LD `Person` half is safe + SEO/GEO-valuable and **already
  overlaps `[SITE-STRUCTURED-DATA]`** on the board; the **`ai-agent.json` half is now risky** — the
  manifest namespace has **not** converged (`ai-agent.json` an also-ran vs A2A AgentCard; three specs
  contest `/.well-known/agent.json`). 🔴 The L1 commitment to `ai-agent.json` (§2/§5/§9) must be
  **revisited before any `[AGENT-PROFILE]` work**, not inherited silently.
- **`[AGENT-MCP]`** — directionally the right transport bet (MCP is consolidating; every NLWeb instance is
  an MCP server), but needs the `.private` boundary first, **requires a prod deploy (banned)**, and targets
  a registry still in "preview, no durability guarantees." Not now.
- **`[AGENT-DIRECTORY-LISTINGS]`** — nothing to list until `[AGENT-MCP]` exists. Blocked.
- **Web Bot Auth (L3)** — jumped from "watch" to shipping (Cloudflare Verified Bots), but only useful once
  there's an MCP surface worth protecting + agent traffic to distinguish. No surface yet → not actionable.

**Net:** exactly one action (`[DATA-PRIVATE-SCHEMA]`) is both unblocked and standard-risk-free; everything
agent-facing is behind the deploy ban, sequenced behind that refactor, or betting on an unconverged
manifest layer. All of it competes with the content-home flip. Hence: defer, revisit at Conv 055.
