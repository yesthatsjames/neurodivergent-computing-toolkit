#!/usr/bin/env bash
# focus-mode.sh — Neurodivergent Focus Mode for the Terminal
# Reduces visual noise, sets a clear single task, tracks time
# Designed for dyslexic / ADHD / neurodivergent terminal users
#
# Usage:
#   source focus-mode.sh           # load the functions
#   focus "write the intro"        # start a focus session
#   unfocus                        # end the session, see summary

FOCUS_TASK=""
FOCUS_START=""
FOCUS_LOG="${HOME}/.focus-log"

focus() {
    if [[ -z "$1" ]]; then
        echo "What are you focusing on? Usage: focus \"task description\""
        return 1
    fi

    FOCUS_TASK="$*"
    FOCUS_START=$(date +%s)
    local START_TIME
    START_TIME=$(date "+%H:%M")

    # Clear the screen — reduce visual noise
    clear

    # Simple, high-contrast banner — no clutter
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "  FOCUS SESSION STARTED  $START_TIME"
    echo ""
    echo "  Task: $FOCUS_TASK"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "  One thing. Just this. Nothing else."
    echo ""
    echo "  When done: type  unfocus"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""

    # Set a minimal, distraction-free prompt
    # Shows only the task name — no path, no git, no noise
    export PS1_FOCUS_BACKUP="$PS1"
    export PS1="[FOCUS] › "

    # Increase font size if in Kitty
    if [[ "$TERM" == "xterm-kitty" ]]; then
        kitty @ set-font-size 20 2>/dev/null || true
    fi
}

unfocus() {
    if [[ -z "$FOCUS_TASK" ]]; then
        echo "No active focus session."
        return 1
    fi

    local END_TIME
    END_TIME=$(date +%s)
    local DURATION=$(( (END_TIME - FOCUS_START) / 60 ))

    # Restore prompt
    if [[ -n "$PS1_FOCUS_BACKUP" ]]; then
        export PS1="$PS1_FOCUS_BACKUP"
        unset PS1_FOCUS_BACKUP
    fi

    # Restore font size if in Kitty
    if [[ "$TERM" == "xterm-kitty" ]]; then
        kitty @ set-font-size 0 2>/dev/null || true
    fi

    # Log the session
    echo "$(date '+%Y-%m-%d %H:%M') | ${DURATION}m | $FOCUS_TASK" >> "$FOCUS_LOG"

    # Show summary
    clear
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "  FOCUS SESSION COMPLETE"
    echo ""
    echo "  Task:     $FOCUS_TASK"
    echo "  Duration: ${DURATION} minutes"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "  Take a break. You earned it."
    echo ""

    # Reset
    FOCUS_TASK=""
    FOCUS_START=""
}

focus_log() {
    if [[ ! -f "$FOCUS_LOG" ]]; then
        echo "No focus sessions logged yet."
        return
    fi
    echo ""
    echo "━━━ FOCUS LOG ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    # Show last 10, most recent first
    tail -10 "$FOCUS_LOG" | tac
    echo ""
    local TOTAL
    TOTAL=$(awk -F'|' '{sum += $2} END {printf "%d", sum}' "$FOCUS_LOG" 2>/dev/null || echo "0")
    echo "  Total focused time logged: ${TOTAL} minutes"
    echo ""
}

# If sourced, show quick help
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Focus mode loaded."
    echo "  focus \"your task\"   — start a session"
    echo "  unfocus             — end the session"
    echo "  focus_log           — see your history"
fi
