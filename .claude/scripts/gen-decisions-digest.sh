#!/bin/sh
# gen-decisions-digest.sh — regenerate DECISIONS-DIGEST.md from DECISIONS.md. (fgw, adapted from fps)
#
# Deterministic projection: one block per `### DEC-NNN-N` entry = its heading + its
# `**Decision:**` field (verbatim, trailing whitespace trimmed). A ⛔ tombstone entry emits
# its heading only (the heading already carries the supersession pointer).
#
# 🔴 Derived artefact — never hand-edit DECISIONS-DIGEST.md; edit DECISIONS.md and regenerate.
# Load THIS file (not the full record) to scan for precedent, then open the cited DEC in the
# full record. Invoked by /r-end when DECISIONS.md changed this conv.
#
# Usage: sh gen-decisions-digest.sh [SRC] [OUT]
# Reports to stderr: total entries, tombstones, and any non-tombstone with an EMPTY gist.
set -eu

SRC="${1:-$HOME/projects/fgw-26-docs/DECISIONS.md}"
OUT="${2:-$HOME/projects/fgw-26-docs/DECISIONS-DIGEST.md}"
TODAY=$(date +%Y-%m-%d)

{
  echo "# Decisions digest — fgw"
  echo ""
  echo "🔴 **Generated — do not edit.** A deterministic projection of \`DECISIONS.md\`: each entry's heading + its \`Decision:\` gist (tombstones = heading only). Regenerate with \`.claude/scripts/gen-decisions-digest.sh\`; \`/r-end\` refreshes it when \`DECISIONS.md\` changed. Load THIS file to scan for precedent, then open the cited \`DEC-NNN-N\` in \`DECISIONS.md\` for the full Decision/Rationale/Consequences."
  echo ""
  echo "_As of $TODAY._"
  echo ""
  echo "---"
  echo ""
} > "$OUT"

awk '
function flush() {
  if (!have) return
  sub(/[[:space:]]+$/, "", dec)
  print head
  if (head !~ /⛔/ && dec != "") { print ""; print dec }
  print ""
  total++
  if (head ~ /⛔/) tombs++
  else if (dec == "") { emptyct++; empty[emptyct]=head }
}
/^### DEC-/ { flush(); head=$0; have=1; cap=0; dec=""; next }
have && /^(- )?\*\*Decision:\*\*/ { line=$0; sub(/^(- )?\*\*Decision:\*\*[ \t]*/, "", line); dec=line; cap=1; next }
have && cap && /^(- )?\*\*(Rationale|Consequences):\*\*/ { cap=0; next }
have && cap { dec = dec "\n" $0; next }
END {
  flush()
  printf("gen-decisions-digest: %d entries (%d tombstones), %d non-tombstone with EMPTY gist\n", total, tombs, emptyct) > "/dev/stderr"
  for (i = 1; i <= emptyct; i++) printf("  EMPTY: %s\n", empty[i]) > "/dev/stderr"
}
' "$SRC" >> "$OUT"
