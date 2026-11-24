---
name: r-submit-page-to-gsc
description: Submit a new or materially-changed page to Google Search Console so it gets crawled + indexed promptly. Takes the page URL as an argument (full URL or a site-relative path, e.g. "/r-submit-page-to-gsc /guides"). Resubmits the sitemap (when it's a new page), then live-test-first Request-indexes the URL (dodging the Server-connection flake), then logs the push into [GOOGLE-SERVICES] for next-check verification. Call it whenever a page is added OR an existing page is materially edited. Drives GSC via Chrome + the operator's session. Never commits, pushes, or touches the conv marker.
---

# Submit a page to Google (GSC)

Push a new or **materially-changed** page into Google's crawl queue instead of waiting for it to find the
change on its own (which lags days). The companion to the standing `[GOOGLE-SERVICES]` monitor: the monitor
*watches*, this *submits*. Origin: Conv 059 (`[GSC-SUBMIT-SKILL]`) — the launch guides sat "unknown to
Google" for a day because nothing pushed them. **Manual by decision (operator, Conv 059)** — not auto-wired
into any flow; you call it when you want it.

🔴 **The authoritative operating recipe + the Server-connection gotcha live in `[GOOGLE-SERVICES]`
(Operating notes).** Re-read that row's Operating notes before relying on the details below — if the GSC
procedure was refined there, that row wins.

## When to call this
- **A new page went live** (a new guide/article/case/section with its own URL). → sitemap resubmit **+**
  request-index.
- **An existing indexed page was materially edited** — content rewrite, new sections, changed title/meta/
  structured-data, anything worth a fresh crawl (operator, Conv 059). → request-index (sitemap resubmit
  optional; do it only if the URL set / `lastmod` changed).
- **Not for** trivial fixes (a typo, a one-word tweak) — not worth a crawl request or the quota.

## Step 1 — Read the target URL(s) from the argument
The page URL(s) come from the **invocation argument** — e.g. `/r-submit-page-to-gsc /guides`. Accept either:
- a **site-relative path** (`/guides`, `/guides/is-your-ai-built-software-sound`) — normalize to a full URL:
  prefix `https://frasergorrie.com`, ensure a **trailing slash** (the site's canonical form); or
- a **full URL** (`https://frasergorrie.com/guides/`) — use as-is (add the trailing slash if missing).

More than one URL may be passed (space-separated) — handle each. 🔴 **No argument given → ask the operator
which page(s)** (don't guess). 🔴 **Quota ~10/day** per property for Request Indexing — if more than ~10
URLs, prioritize and note the rest.

Ask (if not clear from the request) whether each page is **new** (→ sitemap resubmit in Step 3) or a
**material in-place edit** (→ skip the sitemap, request-index only).

## Step 2 — Open GSC via Chrome
Drive GSC in the operator's logged-in session (standing authorization; Chrome bridge). Invoke the
`claude-in-chrome` skill, load the browser tools, `tabs_context_mcp`, open a **new tab**, navigate to the
property `https://search.google.com/search-console?resource_id=sc-domain:frasergorrie.com`. Chrome-bridge
fails → it's usually the extension logged out; ask the operator to sign in (don't retry blindly).

## Step 3 — Resubmit the sitemap (new page only)
Only when a page was **added** (a new URL exists), not for a pure in-place edit. Sitemaps → enter
`https://frasergorrie.com/sitemap-index.xml` in "Add a new sitemap" → Submit → expect "Sitemap submitted
successfully". This forces a re-read so Google **discovers** the new URL (its last-read lags — Conv-59
lesson: the Nov-23 guides were undiscovered because the last read was Nov 18).

## Step 4 — Request-index the URL (live-test-FIRST)
🔑 **This order is the clean way to dodge the Server-connection gotcha** (`[GOOGLE-SERVICES]`). For each URL:
1. Type the URL into the **Inspect any URL** box (top) → Enter.
2. Click **TEST LIVE URL** → wait (a minute or two). If it flakes ("Page fetch — Failed: Server connection
   error"), re-run (↻) until **"URL is available to Google"** is green. The page is almost certainly
   healthy — confirm with `curl -sI <url>` (expect 200) if unsure; don't mistake the flake for a real fault.
3. From that green state click **REQUEST INDEXING** → expect "URL was added to a priority crawl queue".
4. **Pace the probes** — space multiple URLs a few seconds apart; the flake is transient rate-limiting from
   rapid back-to-back fetches.

(If you clicked Request Indexing cold and it rejected: open **View live test**, re-run until green, request
again.)

## Step 5 — Log the push into `[GOOGLE-SERVICES]`
Add a dated bullet to the **Request-indexing log** in the `[GOOGLE-SERVICES]` row: the date + conv, the
URL(s) pushed (new vs changed), and a `⬜` **follow-up for the next GSC check** to verify each got crawled/
indexed — "that's how we judge if the push worked." This keeps the monitor and the submitter in one ledger.

## Step 6 — Report + clean up
Report what was submitted, the queue confirmations, and that it's logged for the next-check verification.
Close any Chrome tabs this skill opened.

---
- **Not a lifecycle skill** — never commits, pushes, or touches the conv marker. Commit via `/r-commit` /
  `/r-end`.
- **Manual, by decision** — call `/r-submit-page-to-gsc <url-or-path …>` yourself; it is deliberately **not**
  auto-triggered from `r-content` / `r-post` / deploys (operator, Conv 059). Revisit if that churn grows.
- **Sitemap vs. Request Indexing** — sitemap resubmit = *discovery* of a new URL (no quota, durable);
  Request Indexing = *priority crawl* of a specific URL (~10/day, fast). New page → both; material in-place
  edit → request-index only.
