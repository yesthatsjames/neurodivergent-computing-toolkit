#!/bin/bash
# ===================================================================
# DYSLEXIA-FRIENDLY BASH ENHANCEMENTS
# Source this from your .bashrc
# ===================================================================

# ===================================================================
# HISTORY ENHANCEMENTS - Essential for reducing retyping
# ===================================================================

# Massive history (never lose a command)
export HISTSIZE=50000
export HISTFILESIZE=50000
export HISTFILE=~/.bash_history_extended

# Avoid duplicates
export HISTCONTROL=ignoreboth:erasedups

# Timestamp history (helpful for reviewing)
export HISTTIMEFORMAT="%F %T "

# Append to history immediately (don't lose commands)
shopt -s histappend
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Enable recursive globbing
shopt -s globstar

# Autocorrect minor spelling errors in cd
shopt -s cdspell
shopt -s dirspell

# ===================================================================
# PATH SETUP
# ===================================================================

# Add local bin for custom tools
export PATH="$HOME/.local/bin:$PATH"

# ===================================================================
# VISUAL SETTINGS - Easier to read
# ===================================================================

# Enable color support
export CLICOLOR=1
export TERM=xterm-256color

# Less pager settings (for man pages, etc.)
export LESS='-R -F -X -i -M -W -z-4'
# -R: colors
# -F: quit if one screen
# -X: don't clear screen
# -i: case-insensitive search
# -M: verbose prompt
# -W: highlight unread
# -z-4: keep 4 lines when scrolling

# Use bat for man pages (syntax highlighting!)
if command -v bat &> /dev/null || command -v batcat &> /dev/null; then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    export MANROFFOPT="-c"
fi

# ===================================================================
# FZF - FUZZY FINDER (AMAZING for finding commands/files)
# ===================================================================

if command -v fzf &> /dev/null; then
    # Source fzf keybindings
    [ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && \
        source /usr/share/doc/fzf/examples/key-bindings.bash

    [ -f /usr/share/doc/fzf/examples/completion.bash ] && \
        source /usr/share/doc/fzf/examples/completion.bash

    # Warm, comfortable colors for fzf
    export FZF_DEFAULT_OPTS="
        --color=fg:#f5deb3,bg:#1c1410,hl:#ff8c00
        --color=fg+:#ffffff,bg+:#2b1d16,hl+:#ffb84a
        --color=info:#d4b5a0,prompt:#ff8c00,pointer:#ff8c00
        --color=marker:#9acd32,spinner:#ff8c00,header:#5fd7c8
        --height 60%
        --layout=reverse
        --border=rounded
        --preview-window=:wrap
        --bind='ctrl-/:toggle-preview'
        --prompt='🔍 '
        --pointer='▶'
        --marker='✓'
    "

    # Use fd for faster file finding
    if command -v fd &> /dev/null || command -v fdfind &> /dev/null; then
        export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
        export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
    fi

    # Keybindings:
    # Ctrl+R - search command history (VERY useful!)
    # Ctrl+T - find files
    # Alt+C - cd into directory
fi

# ===================================================================
# AUTOCOMPLETE ENHANCEMENTS
# ===================================================================

# Case-insensitive autocomplete (helpful for dyslexia)
bind 'set completion-ignore-case on'

# Treat hyphens and underscores as equivalent
bind 'set completion-map-case on'

# Show all autocomplete results immediately
bind 'set show-all-if-ambiguous on'

# Color autocomplete results
bind 'set colored-stats on'
bind 'set visible-stats on'
bind 'set mark-symlinked-directories on'

# Complete after one tab instead of two
bind 'set show-all-if-unmodified on'

# Add trailing slash to directory completions
bind 'set mark-directories on'

# Immediately show completions
bind 'set page-completions off'

# Use up/down to search history based on what you've typed
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# ===================================================================
# HELPFUL ALIASES - Clear, descriptive names
# ===================================================================

# Modern replacements (colorful, easier to read)
if command -v eza &> /dev/null; then
    alias ls='eza --icons --group-directories-first'
    alias ll='eza -la --icons --group-directories-first --git'
    alias lt='eza --tree --level=2 --icons'
    alias ltree='eza --tree --icons'
elif command -v exa &> /dev/null; then
    alias ls='exa --icons --group-directories-first'
    alias ll='exa -la --icons --group-directories-first --git'
    alias lt='exa --tree --level=2 --icons'
    alias ltree='exa --tree --icons'
else
    alias ll='ls -lahF --color=auto'
    alias ls='ls --color=auto'
fi

# bat is cat with syntax highlighting
if command -v bat &> /dev/null || command -v batcat &> /dev/null; then
    alias cat='bat --paging=never --style=plain'
    alias catt='bat --paging=always'  # cat with full styling
else
    alias cat='cat -n'  # at least add line numbers
fi

# Navigation helpers (reduce typing!)
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -- -='cd -'  # Go to previous directory

# Safety aliases (confirm before destructive operations)
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Readable df and du
alias df='df -h'
alias du='du -h'

# Grep with color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Process management
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'  # ps with grep
alias htop='htop --sort-key=PERCENT_CPU'  # sorted by CPU

# Network
alias ports='netstat -tulanp'
alias ping='ping -c 5'  # Limit ping to 5 packets

# Git shortcuts (helpful for learning)
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate --all'
alias gd='git diff'
alias gco='git checkout'

# Directory listing
alias tree='tree -C'  # Colorful tree
alias lsd='ls -d */'  # List only directories

# Quick edit important files
alias bashrc='${EDITOR:-nano} ~/.bashrc'
alias kittyconf='${EDITOR:-nano} ~/.config/kitty/kitty.conf'

# Show PATH in readable format
alias path='echo -e ${PATH//:/\\n}'

# ===================================================================
# HELPFUL FUNCTIONS
# ===================================================================

# Make and cd into directory
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extract any archive
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"    ;;
            *.tar.gz)    tar xzf "$1"    ;;
            *.bz2)       bunzip2 "$1"    ;;
            *.rar)       unrar x "$1"    ;;
            *.gz)        gunzip "$1"     ;;
            *.tar)       tar xf "$1"     ;;
            *.tbz2)      tar xjf "$1"    ;;
            *.tgz)       tar xzf "$1"    ;;
            *.zip)       unzip "$1"      ;;
            *.Z)         uncompress "$1" ;;
            *.7z)        7z x "$1"       ;;
            *)          echo "'$1' cannot be extracted" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Find file by name
ff() {
    find . -type f -iname "*$1*"
}

# Find directory by name (named fdir to avoid shadowing fd/fdfind binary)
fdir() {
    find . -type d -iname "*$1*"
}

# Search file contents
search() {
    grep -r -i "$1" .
}

# Show definition of a command
whatdoes() {
    type "$1"
    which "$1"
    man "$1" 2>/dev/null | head -n 20
}

# ===================================================================
# STARSHIP PROMPT (if installed)
# ===================================================================

if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
else
    # Fallback: Enhanced PS1 with git branch
    # Orange user@host, green path, orange $
    parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    }

    export PS1='\[\033[0;33m\]\u@\h\[\033[00m\]:\[\033[0;32m\]\w\[\033[0;33m\]$(parse_git_branch)\[\033[00m\]\$ '
fi

# ===================================================================
# WELCOME MESSAGE
# ===================================================================

# Only show on interactive shells
if [[ $- == *i* ]]; then
    echo ""
    echo -e "\033[0;33m╔══════════════════════════════════════╗\033[0m"
    echo -e "\033[0;33m║  Dyslexia-Friendly Terminal Ready! ║\033[0m"
    echo -e "\033[0;33m╚══════════════════════════════════════╝\033[0m"
    echo ""
    echo -e "Tips:"
    echo -e "  \033[0;32m•\033[0m Ctrl+R - Search command history"
    echo -e "  \033[0;32m•\033[0m Tab - Autocomplete"
    echo -e "  \033[0;32m•\033[0m Up/Down arrows - Navigate history"
    echo -e "  \033[0;32m•\033[0m Type 'help-commands' for more tips"
    echo ""
fi

# ===================================================================
# HELP COMMAND
# ===================================================================

help-commands() {
    echo ""
    echo -e "\033[0;33m=== Helpful Commands ===\033[0m"
    echo ""
    echo -e "\033[0;32mNavigation:\033[0m"
    echo "  ll          - List files with details"
    echo "  lt          - Show directory tree"
    echo "  ..          - Go up one directory"
    echo "  -           - Go to previous directory"
    echo "  mkcd <dir>  - Create and enter directory"
    echo ""
    echo -e "\033[0;32mFile Operations:\033[0m"
    echo "  cat <file>  - View file with syntax highlighting"
    echo "  ff <name>   - Find file by name"
    echo "  search <text> - Search in all files"
    echo "  extract <archive> - Extract any archive"
    echo ""
    echo -e "\033[0;32mGit:\033[0m"
    echo "  gs   - git status"
    echo "  ga   - git add"
    echo "  gc   - git commit"
    echo "  gl   - git log (pretty)"
    echo ""
    echo -e "\033[0;32mHistory:\033[0m"
    echo "  Ctrl+R  - Search command history"
    echo "  !!      - Repeat last command"
    echo "  !$      - Last argument of previous command"
    echo ""
    echo -e "\033[0;32mTools:\033[0m"
    echo "  htop    - System monitor"
    echo "  ncdu    - Disk usage analyzer"
    echo "  tldr    - Simplified man pages"
    echo ""
}

# Make help available
alias help='help-commands'

# ===================================================================
# EDITOR SETUP
# ===================================================================

# Set default editor (fallback chain)
if command -v nvim &> /dev/null; then
    export EDITOR='nvim'
    export VISUAL='nvim'
elif command -v vim &> /dev/null; then
    export EDITOR='vim'
    export VISUAL='vim'
else
    export EDITOR='nano'
    export VISUAL='nano'
fi

echo "✓ Dyslexia-friendly enhancements loaded!"
