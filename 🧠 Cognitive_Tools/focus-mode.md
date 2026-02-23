# Focus Mode — One Thing at a Time

A shell tool that creates a clean, distraction-free terminal
session for neurodivergent users who need clear task focus.

Built for: dyslexia, ADHD, autism, anxiety — anyone who loses
the thread when there's too much on screen.

---

## The Problem

Standard terminals are noisy.

Your prompt shows the path, the git branch, the time, the exit code.
Your history is full of other things you were doing.
You open a tab to look something up and suddenly you're somewhere else entirely.

Twenty minutes later you can't remember what you were doing.

---

## What Focus Mode Does

- Clears the screen completely — blank slate
- Shows ONE thing: the task you named
- Sets a minimal prompt — `[FOCUS] ›` — no path, no noise
- Increases font size if you're in Kitty (bigger = easier to track)
- Tracks how long you focused
- Logs every session so you can see your patterns

---

## Install

```bash
# Add to your .bashrc or .zshrc
source /path/to/focus-mode.sh

# Or copy the functions directly into your shell config
```

---

## Usage

```bash
# Start a focus session — name your ONE task
focus "write the first paragraph"
focus "fix the login bug"
focus "read chapter 3"

# End the session when done
unfocus

# See your focus history
focus_log
```

---

## What it looks like

When you run `focus "write the intro"`:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  FOCUS SESSION STARTED  14:23

  Task: write the intro

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  One thing. Just this. Nothing else.

  When done: type  unfocus

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

Your prompt becomes: `[FOCUS] › `

Nothing else on screen. Just the task.

---

## Why This Works for Neurodivergent Brains

**For dyslexia:** Less visual clutter = less tracking effort.
The eye knows where to go. The task is the only thing in view.

**For ADHD:** The named task externalises the intention.
It's not in your head (where it will get lost) — it's on the screen.
The prompt reminds you every time you type.

**For anyone:** The session log shows you that you actually did things,
even on days when it doesn't feel like it. That matters.

---

## Customisation

Change the font size in Kitty:
```bash
# In focus-mode.sh, adjust this line:
kitty @ set-font-size 20   # change 20 to your preferred size
```

Change the focus prompt:
```bash
# In focus-mode.sh:
export PS1="[FOCUS] › "    # change to anything you like
```

Log location:
```bash
FOCUS_LOG="${HOME}/.focus-log"   # change path if needed
```
