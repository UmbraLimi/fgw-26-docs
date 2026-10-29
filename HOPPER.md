# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do now / drop) before `/r-end`. The
durable record of what was done is the conv record + the board, never a line left here.

## Open

<!-- Conv 012 — operator idea-dump (B); walking 1-at-a-time in order 1,2,4,5,6,7,8.
     Item 3 (print+annotate) ruled by operator: dropped as a standalone, its intent
     folds into the method — read each page live, make text changes where warranted. -->
- [ ] (1) More images/graphics on Work + case-history pages
- [ ] (2) Icons in certain paragraphs/sections
- [ ] (4) Logo + favicon — create more appropriate ones
- [ ] (5) DONE (form built, Conv 012) — but OPERATOR-OWED before it sends on
      staging/prod: (a) put the real Resend key + addresses in .dev.vars locally
      and via `wrangler secret put RESEND_API_KEY|EMAIL_TO|EMAIL_FROM`
      (+ `--env staging`); (b) verify the sender domain in Resend; (c) Turnstile
      is the planned pre-launch spam hardening (needs site+secret keys).
- [ ] (6) Testimonials + client list
- [ ] (7) "Tools" (clarify: a tools page? stack? tools FG uses?)
- [ ] (8) Redo LinkedIn and X (clarify: links/icons, or the profiles themselves)
- [ ] Node floor friction (recurred Conv 012): a fresh Bash shell still comes up on
      Node 22.19.0 despite DEC-011-3's nvm-default fix; `npm run typecheck` (astro
      check) isn't guarded by check-node.mjs so it fails until a manual `nvm use 24`.
      Consider a repo .nvmrc + guarding typecheck, or diagnose why the shell defaults to 22.
- [ ] Operator context for case studies + testimonials (items 1 & 6): FG writes
      software for clients under NDAs and verbal agreements to keep their work
      private. So testimonials and case studies are modified to explain only the
      generalities of the work and to remove the client. That said, there IS value
      to the reader in knowing the KINDS of work FG does, the difficulties, and
      other generic aspects. Honour this when viewing/editing testimonials + cases.

