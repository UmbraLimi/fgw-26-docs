#!/bin/sh
# conv-state.sh — the single source of the conv-state check. (fgw, adapted from fps Conv 004)
#
# Prints the state word AND the two inputs it was derived from. A state word with no
# evidence under it cannot be checked — that is the failure this guards against.
#
# Two independent signals, answering different questions:
#   .conv-current  — "is a conv open on THIS machine?"  (untracked, never travels)
#   git-derived    — "did the previous conv close?"
#
# Two details are load-bearing and must not be "tidied":
#   1. The heartbeat is matched against the SUBJECT FIELD ONLY (`--format='%H %s'` piped
#      to grep). git's own `--grep` anchors ^/$ per line, not at the message start, so it
#      would match a body line too.
#   2. Closure is tested over <heartbeat>..<ref> with a line-anchored `^Type: end-of-conv$`.
#      Unanchored, a body merely QUOTING the trailer reads as a close.
#
# Usage:  conv-state.sh [ref]     ref defaults to HEAD.

D="$HOME/projects/fgw-26-docs"
REF="${1:-HEAD}"

hb=$(git -C "$D" log "$REF" --format='%H %s' \
     | grep -m1 -E '^[0-9a-f]{40} Conv [0-9]{3} start — ' \
     | cut -d' ' -f1)

if [ -z "$hb" ]; then
  s="NO HEARTBEAT"
  hbl="(none found)"
else
  hbl=$(git -C "$D" log -1 --format='%h %s' "$hb")
  if git -C "$D" log "$hb".."$REF" --grep='^Type: end-of-conv$' --format=%H | grep -q .; then
    s=CLOSED
  else
    s=OPEN
  fi
fi

cc=$(cat "$D/.conv-current" 2>/dev/null || echo "(absent)")

printf '%s\n  heartbeat: %s\n  .conv-current: %s\n' "$s" "$hbl" "$cc"
