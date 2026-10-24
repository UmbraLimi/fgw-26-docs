#!/bin/sh
# capture-turn.sh — UserPromptSubmit hook (fgw, Conv 001).
#
# Captures the operator's half of the conversation verbatim, one JSON line per prompt,
# to $ROOT/.conv-turns.jsonl. /r-end drains this into the conv's dialogue companion
# (docs/convs/.../Conv NNN — dialogue.md) and deletes it. Adapted lean from SPT's
# event-append.sh: kept the UserPromptSubmit trigger, the .conv-current lifecycle gate,
# loud health logging and fail-open; dropped SPT's multi-type event.js Node system —
# fgw captures only operator prompts, so the hook writes JSONL directly via jq.
# Rationale: DECISIONS.md DEC-001-2.
#
# 🔴 Writes ONLY to files. A UserPromptSubmit hook's stdout is injected into context;
# this hook must never print to stdout. Fails OPEN (exit 0 always) so capture trouble
# never blocks a prompt.

set -u

ROOT="${CLAUDE_PROJECT_DIR:-$HOME/projects/fgw-26-docs}"
HEALTH="$ROOT/.scratch/hook-health.log"
mkdir -p "$ROOT/.scratch" 2>/dev/null

log() { printf '%s | capture-turn | %s | %s\n' "$(date '+%Y-%m-%dT%H:%M:%S%z')" "$1" "$2" >> "$HEALTH" 2>/dev/null; }

input=$(cat)

# Lifecycle gate: capture only inside an open conv (matches SPT's gate).
if [ ! -f "$ROOT/.conv-current" ]; then
  log "SKIP" "no .conv-current (no open conv)"
  exit 0
fi
conv=$(tr -d '[:space:]' < "$ROOT/.conv-current" 2>/dev/null)

text=$(printf '%s' "$input" | jq -r '.prompt // empty' 2>/dev/null)
if [ -z "$text" ]; then
  log "SKIP" "empty or unparseable prompt"
  exit 0
fi

# Append one JSON line {ts, conv, text}; jq does the escaping from the raw input object.
if printf '%s' "$input" \
   | jq -c --arg ts "$(date '+%Y-%m-%dT%H:%M:%S%z')" --arg conv "$conv" \
        '{ts: $ts, conv: $conv, text: .prompt}' >> "$ROOT/.conv-turns.jsonl" 2>/dev/null; then
  log "OK" "turn captured (conv $conv)"
else
  log "ERROR" "jq append failed"
fi

exit 0
