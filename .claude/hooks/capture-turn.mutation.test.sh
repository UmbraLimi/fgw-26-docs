#!/bin/sh
# capture-turn.mutation.test.sh — mutation check for the capture hook (fgw, Conv 003, DEC-003-2).
#
# Same discipline as check-ab-options.mutation.test.sh: copy the hook + capture-turn.test.sh to
# a temp dir, apply each deliberate break to the hook copy, run the suite, and REQUIRE it to
# fail. A surviving mutation is a hole in capture-turn.test.sh. Each mutation attacks a real
# behaviour: the .conv-current gate and the empty-prompt skip.
# Run: sh capture-turn.mutation.test.sh

HERE=$(dirname "$0")
GUARD="$HERE/capture-turn.sh"
SUITE="$HERE/capture-turn.test.sh"
fails=0

mutate() { # $1 name  $2 sed-expr
  t=$(mktemp -d)
  cp "$GUARD" "$t/capture-turn.sh"
  cp "$SUITE" "$t/capture-turn.test.sh"
  sed "$2" "$t/capture-turn.sh" > "$t/mutated" && mv "$t/mutated" "$t/capture-turn.sh"
  if sh "$t/capture-turn.test.sh" >/dev/null 2>&1; then
    printf 'SURVIVED | %s  (suite did NOT catch this break)\n' "$1"
    fails=$((fails + 1))
  else
    printf 'caught   | %s\n' "$1"
  fi
  rm -rf "$t"
}

# Gate inverted — capture must happen only inside an open conv. Caught by the gate-absent case.
mutate "conv gate inverted (! -f -> -f)"       's/if \[ ! -f "\$ROOT\/.conv-current" \]/if [ -f "$ROOT\/.conv-current" ]/'
# Empty-prompt skip removed — an empty prompt must not append. Caught by the empty-prompt case.
mutate "empty-prompt skip removed (-z -> -n)"   's/if \[ -z "\$text" \]/if [ -n "$text" ]/'

echo "----"
if [ "$fails" -eq 0 ]; then
  echo "ALL CAUGHT"
else
  echo "$fails SURVIVED"
  exit 1
fi
