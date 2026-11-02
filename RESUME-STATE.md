**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 019 was the operator-driven **`/work` page pass**. Cards gained a structured header — project **type**
(type-driven icon + eyebrow label), **status** (right-aligned), and a masked **"Client" pill**; case-study
pages were restructured into a **two-column layout** with a sticky right sidebar holding a **~2:3 mockup
placeholder** + benefit/diagram/tools. The per-case motif was **retired** in favour of a shared type→icon map
(`lib/type-icon`; `caseExtras.icon` removed). Several case titles/summaries were rewritten (incl.
translation-platform card + body, reconciled to a self-improving-pipeline framing). The recurring
data-structure question was settled: **keep the markdown/JSON split, no unified JSON** (`DEC-019-1`). A new
**fps** case was stubbed (placeholder body/extras). `astro check` is green again. **No deploy** — local dev only.

## Next action

🔥 **`[CASE-FPS]` is Conv 020's first work** (operator's call, Conv 019): assess the **fps** project — read
`~/projects/fps-docs` + the `fps-*` repos (⚠️ **read-only — NOT an fgw repo; never commit/push there**) — then
replace the placeholder body + `tools`/`benefit` on the `personal-productivity-app` case, set `mock:false`,
confirm `type`/`status`, decide the real public name/slug (currently `personal-productivity-app`), and whether
it gets a "The record" block + diagram. Reason: operator named it next; it's single-conv and CC-doable now,
while the critical-path rows stay operator-gated (images for `[SITE-PERF]`, client sign-off for `[SITE-NARRATIVE]`).

⚠️ Standing: production has **never** been deployed (all work dev/staging-only); the fps case + the case
mockups are **placeholders** (`[CASE-FPS]`, `[CASE-MOCKUPS]`); home testimonials remain mock/SAMPLE.

## 🔬 Carried findings
_None._
