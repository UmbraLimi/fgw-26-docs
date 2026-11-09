# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop / carry) before `/r-end`.
The durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] Email auth fix (verified Conv 035): DKIM `resend._domainkey` ✓, but **DMARC is `p=none`** (monitor-only) and **no apex SPF** TXT. Raise DMARC to at least `p=quarantine` and add/confirm SPF — a Cloudflare DNS change, deliverability-sensitive, so do it deliberately (verify Resend alignment first). (Conv 035)
- [ ] Renew `security.txt` `Expires` on/before **2027-11-08** (RFC 9116 — the file is invalid once it lapses). `public/.well-known/security.txt` in fgw-26. (Conv 035)
- [ ] GEO answer-structuring: TL;DR / direct-answer blocks under key H2s, consistent entity naming (low effort; vendor "30–40% citation gain" figures unverified). Best folded into later content work (`[POSTING-PLAN]` / blog). (Conv 035, carried)
