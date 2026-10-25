#!/bin/sh
# check-ab-options.mutation.test.sh — mutation check for the A/B Stop guard (fgw, Conv 003).
#
# DEC-003-2: a guard is unproven unless its own suite actually catches a deliberate break.
# For each mutation below we copy the guard + check-ab-options.test.sh to a temp dir, apply
# the break to the guard copy, run the suite there, and REQUIRE it to fail (non-zero). A
# mutation that SURVIVES (suite still passes) is a hole in check-ab-options.test.sh and fails
# this check. Each mutation names the real behaviour it attacks.
# Run: sh check-ab-options.mutation.test.sh

HERE=$(dirname "$0")
GUARD="$HERE/check-ab-options.sh"
SUITE="$HERE/check-ab-options.test.sh"
fails=0

mutate() { # $1 name  $2 sed-expr
  t=$(mktemp -d)
  cp "$GUARD" "$t/check-ab-options.sh"
  cp "$SUITE" "$t/check-ab-options.test.sh"
  sed "$2" "$t/check-ab-options.sh" > "$t/mutated" && mv "$t/mutated" "$t/check-ab-options.sh"
  if sh "$t/check-ab-options.test.sh" >/dev/null 2>&1; then
    printf 'SURVIVED | %s  (suite did NOT catch this break)\n' "$1"
    fails=$((fails + 1))
  else
    printf 'caught   | %s\n' "$1"
  fi
  rm -rf "$t"
}

# Guard never blocks — the whole point of the hook. Caught by every exit-2 case.
mutate "guard never blocks (exit 2 -> exit 0)"            's/^exit 2$/exit 0/'
# Loop guard neutered — active=true must still suppress. Caught by the loop-guard case.
mutate "loop guard disabled (active never matches true)"   's/= "true"/= "__never__"/'
# Anchor matched anywhere in a line, not only at line-start — a mid-line prose mention would
# be treated as the ask. Caught by the DEC-005-1 prose-mention cases.
mutate "line-start requirement removed (heads-line -> contains)"  's|"$anchor"\*) found|*"$anchor"*) found|'
# Block never extends past the anchor line — options on following lines would be missed.
# Caught by the "options paragraphs below anchor" compliant case.
mutate "block not extended past anchor line (append neutered)"    's/"\$found" = 1/"$found" = 9/'
# One label suffices — must require BOTH A) and B). Caught by the "only A), no B)" case.
mutate "single label passes (A) && B)  ->  A) || B))"      's/&&/||/'

echo "----"
if [ "$fails" -eq 0 ]; then
  echo "ALL CAUGHT"
else
  echo "$fails SURVIVED"
  exit 1
fi
