# Commit message format — `fgw-1`

The format `/r-commit` and `/r-end` use. Provisional — to be exercised and refined once the lifecycle
runs for real (Conv 001+). Each repo (`fgw-26-docs`, `fgw-26`) gets its **own** message describing its
**own** changes; they share only the conv number and `Machine:`.

```
Conv NNN: imperative subject under 72 chars

### <Section>
- bullet authored from the diff, not from memory

Stats: <optional — files/insertions, or a one-line summary>
Conv: NNN
Machine: <machine name>
Format: fgw-1

Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>
```

**Rules most often got wrong:**
- **Subject:** `Conv NNN: imperative title`, under 72 chars.
- **Only H3 sections that have content.** Never an empty `### Header`.
- **`### Doc Changes` exclusion list** — no bullet whose only content is `docs/convs/**`, `RESUME-STATE.md`,
  `CURRENT-TASKS.md`, `HOPPER.md`, or `CONV-COUNTER`. Those are bookkeeping; a bullet naming them buries
  the real content.
- **`Type: end-of-conv`** appears **only** on the `/r-end` closing commit — it pairs with the `/r-start`
  heartbeat to bracket the conv. Omit it on every `/r-commit`.
- **No blank lines inside an H3's bullets or inside the trailer block.**
- 🔴 **Stage by name, never `git add -A`.** A conv commit contains only what CC changed this conv.
- 🔴 **A commit message must never assert settlement the work does not have.** Mid-investigation or
  about-to-be-revised work may be committed — the subject must say so.

**Heartbeat commit** (`/r-start`, `fgw-26-docs` only, subject-only, no body/trailers):
```
Conv NNN start — MACHINE
```
🔴 The `Conv NNN start — ` subject is load-bearing — `conv-state.sh` matches it. Do not reword it.
