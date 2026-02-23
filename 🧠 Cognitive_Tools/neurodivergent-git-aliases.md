# Git Aliases for Neurodivergent Brains

Git's default commands assume you remember exact syntax under pressure.
These aliases use plain language so you can think about the work,
not the tool.

Add to your `~/.gitconfig` under `[alias]`, or run the setup script below.

---

## The Aliases

```ini
[alias]

    # ── WHERE AM I / WHAT'S HAPPENING ──────────────────

    # "What state is everything in?"
    st = status -sb

    # "Show me a readable history"
    what = log --oneline --graph --decorate --all -20

    # "What branch am I on and what's changed recently?"
    where = branch -vv

    # "What did I just change?"
    show-me = diff --stat HEAD

    # "What's different from main?"
    diff-main = diff main...HEAD --stat

    # ── SAVING WORK ────────────────────────────────────

    # "Save everything with a message"
    save = commit -am

    # "Quick save — stages all changes and commits"
    done = !git add -A && git commit -m

    # "Save without staging (already staged)"
    snap = commit -m

    # "I need to put this aside for a moment"
    stash-it = stash push -m

    # "Bring back what I put aside"
    unstash = stash pop

    # "Show me what I've put aside"
    stashed = stash list

    # ── FIXING MISTAKES ────────────────────────────────

    # "I made a typo in my last commit message"
    fix-message = commit --amend --only

    # "I forgot to include a file in my last commit"
    fix-add = commit --amend --no-edit

    # "Undo my last commit but keep the changes"
    oops = reset HEAD~1 --soft

    # "Undo my last commit and throw the changes away"
    # ⚠️  Destructive — use carefully
    really-oops = reset HEAD~1 --hard

    # "This file is a mess, give me back the saved version"
    restore-file = checkout --

    # ── BRANCHING ──────────────────────────────────────

    # "Start a new piece of work"
    fresh = checkout -b

    # "Switch to a branch"
    go = checkout

    # "Show all branches"
    branches = branch -a

    # "Delete a finished branch"
    clean-branch = branch -d

    # ── SYNCING ────────────────────────────────────────

    # "Get latest from remote"
    pull-latest = pull --rebase

    # "Send my work up"
    push-it = push

    # "First push of a new branch"
    push-new = push -u origin HEAD

    # ── SEARCHING ──────────────────────────────────────

    # "Find a commit that mentions something"
    find = log --all --oneline --grep

    # "Who changed this file and when?"
    blame-it = log --follow -p --

    # ── USEFUL VIEWS ───────────────────────────────────

    # "Show me today's work"
    today = log --oneline --since=midnight --author=$(git config user.email)

    # "Show me this week's work"
    week = log --oneline --since='1 week ago' --author=$(git config user.email)

    # "Clean visual graph of all branches"
    tree = log --graph --oneline --all --decorate
```

---

## Quick Setup Script

Run this to add all aliases at once:

```bash
#!/usr/bin/env bash
# Run this script to install all neurodivergent-friendly git aliases

git config --global alias.st      'status -sb'
git config --global alias.what    'log --oneline --graph --decorate --all -20'
git config --global alias.where   'branch -vv'
git config --global alias.show-me 'diff --stat HEAD'
git config --global alias.diff-main 'diff main...HEAD --stat'

git config --global alias.save    'commit -am'
git config --global alias.snap    'commit -m'
git config --global alias.stash-it 'stash push -m'
git config --global alias.unstash 'stash pop'
git config --global alias.stashed 'stash list'

git config --global alias.fix-message 'commit --amend --only'
git config --global alias.fix-add   'commit --amend --no-edit'
git config --global alias.oops      'reset HEAD~1 --soft'
git config --global alias.restore-file 'checkout --'

git config --global alias.fresh   'checkout -b'
git config --global alias.go      'checkout'
git config --global alias.branches 'branch -a'

git config --global alias.pull-latest 'pull --rebase'
git config --global alias.push-it  'push'
git config --global alias.push-new 'push -u origin HEAD'

git config --global alias.find     'log --all --oneline --grep'
git config --global alias.today    'log --oneline --since=midnight'
git config --global alias.week     'log --oneline --since="1 week ago"'
git config --global alias.tree     'log --graph --oneline --all --decorate'

echo "Git aliases installed."
echo "Try: git what  — to see your history"
echo "Try: git where — to see your branches"
```

---

## Why Plain Language Matters

`git reset HEAD~1 --soft` requires you to hold four things in mind at once:
- what reset does
- what HEAD~1 means
- what --soft does
- whether that's actually what you want

`git oops` requires you to hold one thing: *I made a mistake.*

For brains that do well with natural language and struggle with
arbitrary syntax, this is not a cosmetic improvement.
It is the difference between using git confidently and avoiding it.

---

## Make Your Own

The best aliases are the ones that match *your* vocabulary.
These are a starting point, not a standard.

```bash
# Add your own:
git config --global alias.YOUR_WORD 'the git command it means to you'

# Example:
git config --global alias.send 'push'
git config --global alias.checkpoint 'commit -am'
```

Write down what you wish git commands were called.
Then make them that.
