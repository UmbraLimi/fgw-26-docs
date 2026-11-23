**Conv:** 056 ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 056 **graduated Deciding** — the 3rd and final cornerstone of the first three (cleared steps 15
cross-linking, 16 masking, 13 colophon, 11 rendered read, 17 final → graduate; dossier at
`docs/content/build-it-yourself-or-bring-someone-in.md`). The colophon is the **Bloch *Esox lucius* pike**
(`esox-lucius-bloch`), the set's first hand-coloured plate — it duotoned cleanly. **All three cornerstone
guides (Trust / Steering / Deciding) are now final/graduated.** Separately, `[DOSSIER-FORMAT]` was
**codified** (the 8-section graduated-dossier template → `GUIDE-REVIEW` step 17 + an `r-content` pointer;
two learnings folded into `COLOPHON.md` + step 15) and **retired**. Two early-conv process fixes landed
(`DEC-056-1` A/B-matcher quoting, `DEC-056-2` `r-start` Step 6). The operator decided the **guides-only
launch** (`DEC-056-3`): go live with the 3 guides, suppress the `/guides/` blog section, defer real
articles.

## Next action

🔴 **Phase 2 — the guides-only launch.** Work through, with the operator (the prod deploy confirms before
running):
1. **Amend `[PROD-DEPLOY-BAN]`** — the ban requires "first blog page AND all guide pages finalized"; for a
   guides-only launch the **"first blog page" clause must be amended** (record a follow-on DEC), then lift
   the ban (`PROD_DEPLOY_BANNED = false` in `scripts/assert-prod-deploy-allowed.mjs`). Carried hopper item.
2. **Suppress the blog articles section on `/guides/`** (the "Latest writing" stream) — operator's decision.
   Decide flag-gated hide vs removal (lean: flag-gated, re-enableable). Carried hopper item.
3. **Flip `CONTENT_HOME_LIVE = true`** (`consts.ts`) — reveals nav/footer links, drops `noindex`,
   re-includes `/guides` + `/writing` in the sitemap.
4. **Settle `[BLOG-REDIRECT]`** — `/blog` → `/writing/` 301 (or decide) at flip.
5. **Pre-flip:** Deciding is `✎`-clean; **confirm Trust + Steering are `✎`-clean too** (grep the `✎` token
   across all 3 guides before flip).
6. **Build + prod deploy** (confirm first).
   At flip also: the **FAQ → `/guides/` on-ramp** (carried hopper item — goes in the FAQ's cross-link
   paragraph, not an answer).

**Hopper carries 4 items** (GUIDE-PLANNING forward-link deferral · blog buildout + re-enable · PROD-DEPLOY-BAN
reconcile · FAQ on-ramp) — all Phase-2 work, surfaced at `/r-start`.

## 🔬 Carried findings

_None._ (The outgoing finding was ruled do-now at this conv's `/r-start`; the currency-sweep stale refs were
fixed in place. The 4 hopper items above ride the hopper, not this section.)
