# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop) before `/r-end`. The
durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] Run Lighthouse tests for the home page
- [ ] Turnstile adds a Cloudflare widget on the contact form — hide / prevent it from showing
- [ ] Live apex sends no `Strict-Transport-Security` (HSTS) header — consider enabling HSTS (Cloudflare SSL/TLS → Edge Certificates, or worker header). Security hardening, low priority. Observed Conv 032 post-cutover.
- [ ] Confirm GA4 realtime actually registers hits: during Conv 032 browser verification every `g/collect` beacon fired with correct `tid`/`en=page_view`/URL but returned **HTTP 503** from the test browser (same `cid` across all — looks like a local blocker/DNS filter on `google-analytics.com`, not a site fault). Re-check GA realtime from a clean browser/device (or with any blocker off) to confirm real visitors are counted. — ✅ RESOLVED Conv 032: operator confirmed near-realtime users show in GA4; 503 was local to the first machine (a different computer sees the site + GA fine). Clear at /r-hopper.
- [ ] Images show their top ~30% as a solid band (brown — presumably the background colour showing through) instead of the image. Live site, Conv 032. Likely an aspect-ratio / object-fit / `<Picture>` dimension issue from the PERF work. Investigate.
- [ ] No redirects set up from the old site's pages — legacy URLs that changed will 404 on the new site. Set up redirects (legacy path → new path) before/soon after launch. Conv 032.
- [ ] Harden the deploy guard (`scripts/assert-worker.mjs`) to also assert the flattened `routes` match the target env — Conv 032 near-miss: a staging deploy inherited the prod top-level `routes` and briefly stole `frasergorrie.com` from prod (apex served staging ~minutes). Fixed by `routes: []` in `env.staging`, but a guard would catch a regression. Consider failing the deploy if staging config contains any prod route / custom domain.
- [ ] Pre-existing lint debt surfaced by `npm run verify` Conv 032 (deploy only runs `build`, so lint never gated): `src/pages/api/_contact.test.ts:172` unused `_omit`; also unused eslint-disable directives in generated `worker-configuration.d.ts`. Not introduced this conv. Clean up + decide whether lint should gate deploys.
