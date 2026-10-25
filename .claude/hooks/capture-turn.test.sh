#!/bin/sh
# capture-turn.test.sh — behaviour tests for the UserPromptSubmit capture hook (fgw, Conv 003).
#
# Drives capture-turn.sh with crafted JSON on stdin and a sandboxed CLAUDE_PROJECT_DIR,
# asserting its side effects: one {ts,conv,text} line appended ONLY inside an open conv; skip
# when the .conv-current gate is absent or the prompt is empty; never write to stdout (a
# UserPromptSubmit hook's stdout enters context); always exit 0 (fail-open). Pure logic, no CC.
# Run: sh capture-turn.test.sh

HERE=$(dirname "$0")
HOOK="$HERE/capture-turn.sh"
fails=0
ok()  { printf 'ok   | %s\n' "$1"; }
bad() { printf 'FAIL | %s  (%s)\n' "$1" "$2"; fails=$((fails + 1)); }

# A) open conv + valid prompt -> exactly one correct line, no stdout, exit 0
T=$(mktemp -d); echo 042 > "$T/.conv-current"
out=$(printf '%s' '{"prompt":"hello world"}' | CLAUDE_PROJECT_DIR="$T" sh "$HOOK"); rc=$?
if   [ "$rc" -ne 0 ];                         then bad "open conv: valid prompt" "exit $rc, want 0"
elif [ -n "$out" ];                           then bad "open conv: valid prompt" "wrote to stdout: $out"
elif [ ! -f "$T/.conv-turns.jsonl" ];         then bad "open conv: valid prompt" "no jsonl written"
elif [ "$(wc -l < "$T/.conv-turns.jsonl" | tr -d ' ')" != "1" ]; then bad "open conv: valid prompt" "expected exactly 1 line"
elif ! jq -e '.text=="hello world" and .conv=="042"' "$T/.conv-turns.jsonl" >/dev/null 2>&1; then bad "open conv: valid prompt" "wrong text/conv in line"
else ok "open conv: valid prompt -> one line"
fi
rm -rf "$T"

# B) gate absent -> nothing captured, exit 0
T=$(mktemp -d)
printf '%s' '{"prompt":"hi"}' | CLAUDE_PROJECT_DIR="$T" sh "$HOOK"; rc=$?
if   [ "$rc" -ne 0 ];                 then bad "no open conv: gate blocks" "exit $rc, want 0"
elif [ -f "$T/.conv-turns.jsonl" ];   then bad "no open conv: gate blocks" "jsonl written despite no .conv-current"
else ok "no open conv: nothing captured"
fi
rm -rf "$T"

# C) open conv + empty prompt -> nothing captured
T=$(mktemp -d); echo 042 > "$T/.conv-current"
printf '%s' '{"prompt":""}' | CLAUDE_PROJECT_DIR="$T" sh "$HOOK"
if [ -f "$T/.conv-turns.jsonl" ]; then bad "empty prompt: skipped" "jsonl written for empty prompt"
else ok "empty prompt: nothing captured"
fi
rm -rf "$T"

# D) malformed stdin -> fail-open (exit 0), nothing captured
T=$(mktemp -d); echo 042 > "$T/.conv-current"
printf '%s' 'not json at all' | CLAUDE_PROJECT_DIR="$T" sh "$HOOK"; rc=$?
if   [ "$rc" -ne 0 ];               then bad "malformed stdin: fail-open" "exit $rc, want 0"
elif [ -f "$T/.conv-turns.jsonl" ]; then bad "malformed stdin: fail-open" "jsonl written for non-json"
else ok "malformed stdin: fail-open, nothing captured"
fi
rm -rf "$T"

echo "----"
if [ "$fails" -eq 0 ]; then echo "ALL PASS"; else echo "$fails FAILED"; exit 1; fi
