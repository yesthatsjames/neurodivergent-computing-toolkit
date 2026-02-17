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
if [ -n "$BASH_VERSION" ]; then
    shopt -s histappend
    PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
    shopt -s globstar
    shopt -s cdspell
    shopt -s dirspell
elif [ -n "$ZSH_VERSION" ]; then
    setopt APPEND_HISTORY INC_APPEND_HISTORY
    setopt EXTENDED_GLOB
    setopt CORRECT
fi

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

if [ -n "$BASH_VERSION" ]; then
    # Case-insensitive autocomplete (helpful for dyslexia)
    bind 'set completion-ignore-case on'
    bind 'set completion-map-case on'
    bind 'set show-all-if-ambiguous on'
    bind 'set colored-stats on'
    bind 'set visible-stats on'
    bind 'set mark-symlinked-directories on'
    bind 'set show-all-if-unmodified on'
    bind 'set mark-directories on'
    bind 'set page-completions off'
    # Up/down search history based on what you've typed
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
elif [ -n "$ZSH_VERSION" ]; then
    # Zsh equivalents
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}'
    setopt MENU_COMPLETE AUTO_LIST
    # Up/down search history based on what you've typed
    autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
    zle -N up-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "^[[A" up-line-or-beginning-search
    bindkey "^[[B" down-line-or-beginning-search
fi

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
    if [ -n "$ZSH_VERSION" ]; then
        eval "$(starship init zsh)"
    else
        eval "$(starship init bash)"
    fi
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

    # =================================================================
    # TIP POOLS - one from each category shown at startup
    # =================================================================

    _basics=(
        "Ctrl+R       Search your command history with fuzzy finder"
        "Tab          Autocomplete commands, paths, filenames"
        "Tab Tab      Show ALL possible completions"
        "Up/Down      Scroll through history (type first, then arrow to filter)"
        "Ctrl+L       Clear screen (scrollback stays, just tidies up)"
        "Ctrl+C       Kill whatever is running right now"
        "Ctrl+D       Exit the terminal (same as typing 'exit')"
        "Ctrl+Z       Pause a program. Type 'fg' to resume it"
        "!!           Re-run the last command you typed"
        "sudo !!      Re-run last command but as root (forgot sudo?)"
        "cd -         Go back to wherever you just were"
        "cd           No args = go straight home"
        "ls           List files  |  ll  List with full details"
        "cat <file>   Show file contents (with syntax highlighting)"
        "man <cmd>    Manual page  |  tldr <cmd>  Short version"
    )

    _shortcuts=(
        "Ctrl+A / Ctrl+E         Jump to start / end of line"
        "Ctrl+W                  Delete word backwards"
        "Alt+D                   Delete word forwards"
        "Ctrl+U                  Delete everything before cursor"
        "Ctrl+K                  Delete everything after cursor"
        "Ctrl+Y                  Paste back what Ctrl+U/K/W deleted"
        "Alt+.                   Insert last argument of previous command"
        "Ctrl+T  Find files      |  Alt+C  Jump into a directory"
        "Ctrl+Shift+=  Zoom in   |  Ctrl+Shift+-  Zoom out"
        "Ctrl+Shift+Backspace    Reset font to default size"
        "Ctrl+Shift+F11          Fullscreen toggle"
        "Ctrl+Shift+U            Unicode character picker"
        "Ctrl+Shift+Delete       Clear screen AND scrollback"
        "Ctrl+Shift+F            Search scrollback (find old output)"
        "!$ = last arg  |  !^ = first arg  |  !* = all args"
    )

    _kitty=(
        "Ctrl+Shift+T            Open new tab (keeps your directory)"
        "Ctrl+Shift+Q            Close current tab"
        "Ctrl+Shift+Right/Left   Switch between tabs"
        "Ctrl+Shift+Enter        Split window (side by side!)"
        "Ctrl+Shift+] / [        Cycle through split windows"
        "Ctrl+Shift+Z            Toggle zoom on current split"
        "Ctrl+Shift+A then M     Make terminal MORE transparent"
        "Ctrl+Shift+A then L     Make terminal LESS transparent"
        "Ctrl+Shift+A then 1     Fully opaque (no transparency)"
        "Ctrl+Shift+A then D     Reset transparency to default"
        "Ctrl+Shift+F2           Open kitty.conf in your editor"
        "Ctrl+Shift+Escape       Kitty debug shell (try: ls)"
        "kitty +kitten themes    Browse and switch color themes"
        "kitty +kitten diff      Visual side-by-side file diff"
        "kitty +kitten ssh <host>  SSH with full kitty features"
    )

    _advanced=(
        "cmd1 | cmd2             Pipe output of cmd1 into cmd2"
        "cmd > file.txt          Send output to file (overwrites)"
        "cmd >> file.txt         Append output to file (keeps old)"
        "cmd 2>&1                Merge error output with normal output"
        "cmd1 && cmd2            Run cmd2 only if cmd1 succeeds"
        "cmd1 || cmd2            Run cmd2 only if cmd1 FAILS"
        "xargs                   Turn lines of text into command arguments"
        "watch -n 5 <cmd>        Re-run a command every 5 seconds"
        "tee file.txt            Pipe output to screen AND a file at once"
        "nohup cmd &             Run command that survives closing terminal"
        "jobs / fg / bg           Manage background processes"
        "diff <(cmd1) <(cmd2)    Compare output of two commands"
        "for f in *.txt; do echo \$f; done    Loop over files"
        "find . -name '*.log' -mtime -7       Files changed this week"
        "du -sh */ | sort -h     Which folders are eating your disk?"
    )

    _git=(
        "gs = status  ga = add  gc = commit  gp = push  gd = diff"
        "gl                      Pretty git log with graph"
        "git stash               Save WIP without committing. 'git stash pop' to restore"
        "git diff --staged       See exactly what your next commit contains"
        "git commit --amend      Fix your last commit message or add forgotten files"
        "git log --oneline -10   Quick look at last 10 commits"
        "git checkout -b <name>  Create and switch to a new branch"
        "git cherry-pick <hash>  Copy one specific commit to current branch"
        "git bisect              Binary search to find which commit broke things"
        "git reflog              Undo almost anything (find lost commits)"
        "git blame <file>        Who changed each line and when"
        "git remote -v           See where push/pull actually goes"
        "git clean -fd           Delete all untracked files (careful!)"
        "Commit early, commit often. Small commits = easier debugging"
        "Branch names: feature/thing  fix/thing  docs/thing"
    )

    _customize=(
        "kittyconf               Open kitty.conf in your editor"
        "bashrc                  Open .bashrc in your editor"
        "Theme switch: edit ~/.config/kitty/dyslexia-friendly.conf"
        "Themes available: dyslexia-warm-brown, cyberpunk-purple, matrix-green, vaporwave"
        "To change: edit the 'include themes/...' line in dyslexia-friendly.conf"
        "Font too small? Ctrl+Shift+= to zoom, or edit font_size in kitty.conf"
        "Want a background image? Uncomment background_image in kitty.conf"
        "Transparency: edit background_opacity (0.0 = invisible, 1.0 = solid)"
        "Add your own aliases in ~/.bashrc or ~/.bash_aliases"
        "Add your own tips: edit the _tips arrays in dyslexia-enhancements.sh"
        "Starship prompt config: create/edit ~/.config/starship.toml"
        "Change cursor: edit cursor_shape in kitty.conf (block, beam, underline)"
        "Tab bar style: edit tab_bar_style (powerline, separator, slant, fade)"
        "path                    Shows your PATH in readable format"
        "whatdoes <cmd>          Shows what a command is and where it lives"
    )

    _wisdom=(
        "Read the error message. The answer is almost always in the last 3 lines"
        "Stuck for 15 mins? Walk away. Your brain solves it in the background"
        "One thing at a time. Finish it or stash it before context-switching"
        "If a command is longer than 80 chars, put it in a script"
        "Test before you push. Future you is counting on present you"
        "Copy-paste is not a crime. Understanding it later is the goal"
        "Automate anything you do 3+ times. That's what scripts are for"
        "Save your work. git add + git commit. Future you will be grateful"
        "Your terminal history IS your notebook. Ctrl+R to search it"
        "Naming things well is half the battle. Be kind to future-you"
        "If it works, commit it. Refactor later on a clean branch"
        "man pages are dense. Use tldr for the 80% use case"
        "The pipe | is your superpower. Chain small tools into big results"
        "alias anything you type often. Two keystrokes > twenty"
        "When in doubt: git status. Always know where you stand"
    )

    # --- Pick one random tip from each of 4 categories ---
    _pick_tip() {
        local -n _arr=$1
        local _len=${#_arr[@]}
        if [ -n "$ZSH_VERSION" ]; then
            echo "${_arr[$(( RANDOM % _len + 1 ))]}"
        else
            echo "${_arr[$(( RANDOM % _len ))]}"
        fi
    }

    # Rotate which 4 categories to show (7 pools, pick 4)
    _all_cats=(basics shortcuts kitty advanced git customize wisdom)
    _cat_len=${#_all_cats[@]}
    _shown=()
    while [ ${#_shown[@]} -lt 4 ]; do
        if [ -n "$ZSH_VERSION" ]; then
            _pick=${_all_cats[$(( RANDOM % _cat_len + 1 ))]}
        else
            _pick=${_all_cats[$(( RANDOM % _cat_len ))]}
        fi
        # deduplicate
        _dupe=0
        for _s in "${_shown[@]}"; do [ "$_s" = "$_pick" ] && _dupe=1; done
        [ "$_dupe" -eq 0 ] && _shown+=("$_pick")
    done

    # Map category name to label + color
    _cat_label() {
        case $1 in
            basics)    echo "\033[1;32m BASICS    \033[0m";;
            shortcuts) echo "\033[1;36m SHORTCUT  \033[0m";;
            kitty)     echo "\033[1;35m KITTY     \033[0m";;
            advanced)  echo "\033[1;34m ADVANCED  \033[0m";;
            git)       echo "\033[1;31m GIT       \033[0m";;
            customize) echo "\033[1;33m CUSTOMIZE \033[0m";;
            wisdom)    echo "\033[1;37m WISDOM    \033[0m";;
        esac
    }

    # =================================================================
    # DISPLAY
    # =================================================================

    echo ""
    echo -e "\033[1;33m      ____                                                          \033[0m"
    echo -e "\033[1;33m     / __ \\                                                         \033[0m"
    echo -e "\033[1;33m    / /  \\ \\                                                        \033[0m"
    echo -e "\033[1;33m   / /    \\ \\   \033[1;36m _  _ ____ _  _ ____ ____    ___ ____ ____ _  _ \033[0m"
    echo -e "\033[1;33m  / /      \\ \\  \033[1;36m |\\| |=== |  | |--< [__]     |  |=== |--< |\\/| \033[0m"
    echo -e "\033[1;33m /  \\------/  \\ \033[0m"
    echo -e "\033[1;33m/    \\    /    \\\033[0m \033[1;32mREADY.\033[0;37m  Your terminal. Your rules.\033[0m"
    echo -e "\033[1;33m \\    \\  /    / \033[0;90m$(date '+%A  %d %b %Y  %H:%M')\033[0m"
    echo -e "\033[1;33m  \\____\\/____/  \033[0m"
    echo ""
    echo -e "\033[0;36m  ============================================================\033[0m"
    for _cat in "${_shown[@]}"; do
        _label=$(_cat_label "$_cat")
        _tip=$(_pick_tip "_${_cat}")
        echo -e "  ${_label} \033[0;37m${_tip}\033[0m"
    done
    echo -e "\033[0;36m  ============================================================\033[0m"
    echo ""
    echo -e "  \033[0;90mType \033[1;32mhelp\033[0;90m = full cheat sheet  |  \033[1;33mhelp kitty\033[0;90m = kitty keys  |  \033[1;35mhelp customize\033[0;90m = make it yours\033[0m"
    echo ""

    unset _basics _shortcuts _kitty _advanced _git _customize _wisdom
    unset _all_cats _cat_len _shown _pick _dupe _s _cat _label _tip
    unset -f _pick_tip _cat_label
fi

# ===================================================================
# HELP SYSTEM
# ===================================================================

help-commands() {
    local topic="${1:-all}"
    local O="\033[1;33m"  # orange
    local G="\033[1;32m"  # green
    local C="\033[1;36m"  # cyan
    local M="\033[1;35m"  # magenta
    local R="\033[1;31m"  # red
    local W="\033[1;37m"  # white
    local D="\033[0;90m"  # dim
    local N="\033[0m"     # reset

    if [ "$topic" = "all" ] || [ "$topic" = "basics" ]; then
        echo ""
        echo -e "${G}=== BASICS ===${N}  ${D}(the commands you'll use every day)${N}"
        echo ""
        echo -e "  ${W}ls${N}              List files (icons + color)       ${W}ll${N}  Detailed list"
        echo -e "  ${W}lt${N}              Tree view (2 levels)             ${W}ltree${N}  Full tree"
        echo -e "  ${W}cd <dir>${N}        Change directory                 ${W}cd${N}  Go home"
        echo -e "  ${W}cd -${N}            Go back to previous directory"
        echo -e "  ${W}..${N}              Up one dir    ${W}...${N}  Up two    ${W}....${N}  Up three"
        echo -e "  ${W}mkcd <dir>${N}      Create a folder AND cd into it"
        echo -e "  ${W}cat <file>${N}      View file (syntax highlighted)   ${W}catt${N}  Scrollable"
        echo -e "  ${W}ff <name>${N}       Find file by name                ${W}fdir <name>${N}  Find directory"
        echo -e "  ${W}search <text>${N}   Search inside all files recursively"
        echo -e "  ${W}extract <file>${N}  Extract any archive (.zip .tar.gz .7z etc)"
        echo -e "  ${W}whatdoes <cmd>${N}  Shows what a command is and where it lives"
        echo -e "  ${W}path${N}            Shows your PATH directories, one per line"
    fi

    if [ "$topic" = "all" ] || [ "$topic" = "shortcuts" ]; then
        echo ""
        echo -e "${C}=== KEYBOARD SHORTCUTS ===${N}  ${D}(speed up EVERYTHING)${N}"
        echo ""
        echo -e "  ${D}--- History ---${N}"
        echo -e "  ${W}Ctrl+R${N}          Fuzzy search command history (THE most useful shortcut)"
        echo -e "  ${W}Up / Down${N}       Browse history (type first to filter)"
        echo -e "  ${W}!!${N}              Re-run last command     ${W}sudo !!${N}  Last cmd as root"
        echo -e "  ${W}!$${N}              Last argument           ${W}!^${N}  First arg    ${W}!*${N}  All args"
        echo -e "  ${W}Alt+.${N}           Paste last arg (press again for older ones)"
        echo ""
        echo -e "  ${D}--- Line Editing ---${N}"
        echo -e "  ${W}Ctrl+A${N}          Jump to START of line"
        echo -e "  ${W}Ctrl+E${N}          Jump to END of line"
        echo -e "  ${W}Ctrl+W${N}          Delete word backwards   ${W}Alt+D${N}  Delete word forwards"
        echo -e "  ${W}Ctrl+U${N}          Delete to line start    ${W}Ctrl+K${N}  Delete to line end"
        echo -e "  ${W}Ctrl+Y${N}          UNDO the delete (paste it back)"
        echo ""
        echo -e "  ${D}--- Files ---${N}"
        echo -e "  ${W}Ctrl+T${N}          Fuzzy find files        ${W}Alt+C${N}  Fuzzy cd into directory"
        echo -e "  ${W}Ctrl+L${N}          Clear screen            ${W}Ctrl+C${N}  Kill current command"
        echo -e "  ${W}Ctrl+Z${N}          Pause program           ${W}fg${N}  Resume it"
    fi

    if [ "$topic" = "all" ] || [ "$topic" = "kitty" ]; then
        echo ""
        echo -e "${M}=== KITTY TERMINAL ===${N}  ${D}(your terminal is more powerful than you think)${N}"
        echo ""
        echo -e "  ${D}--- Tabs ---${N}"
        echo -e "  ${W}Ctrl+Shift+T${N}            New tab (keeps your directory)"
        echo -e "  ${W}Ctrl+Shift+Q${N}            Close tab"
        echo -e "  ${W}Ctrl+Shift+Right/Left${N}   Switch tabs"
        echo -e "  ${W}Ctrl+Shift+. / ,${N}        Move tab position"
        echo -e "  ${W}Ctrl+Shift+Alt+T${N}        Rename tab"
        echo ""
        echo -e "  ${D}--- Split Windows ---${N}  ${D}(run 2 things side by side!)${N}"
        echo -e "  ${W}Ctrl+Shift+Enter${N}        Split current window"
        echo -e "  ${W}Ctrl+Shift+] / [${N}        Switch between splits"
        echo -e "  ${W}Ctrl+Shift+Z${N}            Zoom split (toggle fullscreen one pane)"
        echo -e "  ${W}Ctrl+Shift+W${N}            Close split"
        echo ""
        echo -e "  ${D}--- Look & Feel ---${N}"
        echo -e "  ${W}Ctrl+Shift+=${N}            BIGGER font"
        echo -e "  ${W}Ctrl+Shift+-${N}            Smaller font"
        echo -e "  ${W}Ctrl+Shift+Backspace${N}    Reset font size"
        echo -e "  ${W}Ctrl+Shift+A then M${N}     More transparent"
        echo -e "  ${W}Ctrl+Shift+A then L${N}     Less transparent"
        echo -e "  ${W}Ctrl+Shift+A then 1${N}     Fully opaque"
        echo -e "  ${W}Ctrl+Shift+A then D${N}     Reset transparency"
        echo -e "  ${W}Ctrl+Shift+F11${N}          Toggle fullscreen"
        echo ""
        echo -e "  ${D}--- Power Features ---${N}"
        echo -e "  ${W}Ctrl+Shift+F${N}            Search scrollback (find old output)"
        echo -e "  ${W}Ctrl+Shift+U${N}            Unicode character picker"
        echo -e "  ${W}Ctrl+Shift+F2${N}           Edit kitty.conf right now"
        echo -e "  ${W}Ctrl+Shift+Escape${N}       Kitty debug shell"
        echo -e "  ${W}kitty +kitten themes${N}    Browse color themes interactively"
        echo -e "  ${W}kitty +kitten diff A B${N}  Visual side-by-side file diff"
        echo -e "  ${W}kitty +kitten ssh host${N}  SSH with full kitty features"
    fi

    if [ "$topic" = "all" ] || [ "$topic" = "git" ]; then
        echo ""
        echo -e "${R}=== GIT ===${N}  ${D}(your aliases + the stuff that saves you)${N}"
        echo ""
        echo -e "  ${D}--- Your Aliases ---${N}"
        echo -e "  ${W}gs${N} = git status      ${W}ga${N} = git add       ${W}gc${N} = git commit"
        echo -e "  ${W}gp${N} = git push        ${W}gd${N} = git diff      ${W}gco${N} = git checkout"
        echo -e "  ${W}gl${N} = git log (pretty graph with all branches)"
        echo ""
        echo -e "  ${D}--- Essential Moves ---${N}"
        echo -e "  ${W}git stash${N}             Save WIP without committing"
        echo -e "  ${W}git stash pop${N}         Bring it back"
        echo -e "  ${W}git diff --staged${N}     See what you're about to commit"
        echo -e "  ${W}git commit --amend${N}    Fix last commit (message or files)"
        echo -e "  ${W}git checkout -b name${N}  New branch from here"
        echo -e "  ${W}git log --oneline -10${N} Quick look at recent history"
        echo ""
        echo -e "  ${D}--- Power Git ---${N}"
        echo -e "  ${W}git reflog${N}            Find 'lost' commits (undo almost anything)"
        echo -e "  ${W}git bisect${N}            Binary search for which commit broke things"
        echo -e "  ${W}git cherry-pick hash${N}  Copy one specific commit here"
        echo -e "  ${W}git blame file${N}        Who changed each line and when"
        echo -e "  ${W}git clean -fd${N}         Delete untracked files (careful!)"
    fi

    if [ "$topic" = "all" ] || [ "$topic" = "advanced" ]; then
        echo ""
        echo -e "${O}=== ADVANCED ===${N}  ${D}(level up your shell game)${N}"
        echo ""
        echo -e "  ${D}--- Piping & Redirection ---${N}"
        echo -e "  ${W}cmd1 | cmd2${N}          Pipe output of cmd1 into cmd2"
        echo -e "  ${W}cmd > file${N}           Write output to file (overwrites)"
        echo -e "  ${W}cmd >> file${N}          Append output to file"
        echo -e "  ${W}cmd 2>&1${N}             Merge errors with normal output"
        echo -e "  ${W}cmd | tee file${N}       Output to screen AND file at once"
        echo -e "  ${W}cmd1 && cmd2${N}         Run cmd2 only if cmd1 succeeded"
        echo -e "  ${W}cmd1 || cmd2${N}         Run cmd2 only if cmd1 failed"
        echo ""
        echo -e "  ${D}--- Process Control ---${N}"
        echo -e "  ${W}cmd &${N}                Run in background"
        echo -e "  ${W}nohup cmd &${N}          Run even after terminal closes"
        echo -e "  ${W}jobs${N}                 List background jobs"
        echo -e "  ${W}fg / bg${N}              Resume foreground / background"
        echo -e "  ${W}watch -n 5 cmd${N}       Re-run command every 5 seconds"
        echo ""
        echo -e "  ${D}--- Data Wrangling ---${N}"
        echo -e "  ${W}sort${N}  ${W}uniq${N}  ${W}wc${N}  ${W}head${N}  ${W}tail${N}  ${W}cut${N}  ${W}tr${N}    The classic toolkit"
        echo -e "  ${W}cmd | sort | uniq -c | sort -rn${N}    Count + rank things"
        echo -e "  ${W}rg 'pattern' .${N}       Recursive grep (fast!)"
        echo -e "  ${W}fd 'pattern'${N}         Find files fast"
        echo -e "  ${W}du -sh */ | sort -h${N}  Which folders eat your disk?"
    fi

    if [ "$topic" = "all" ] || [ "$topic" = "customize" ]; then
        echo ""
        echo -e "${O}=== CUSTOMIZE ===${N}  ${D}(make this terminal YOURS)${N}"
        echo ""
        echo -e "  ${D}--- Quick Edits ---${N}"
        echo -e "  ${W}kittyconf${N}                   Edit kitty.conf"
        echo -e "  ${W}bashrc${N}                      Edit .bashrc"
        echo -e "  ${W}Ctrl+Shift+F2${N}               Edit kitty.conf (kitty shortcut)"
        echo ""
        echo -e "  ${D}--- Color Themes ---${N}  ${D}(edit ~/.config/kitty/dyslexia-friendly.conf)${N}"
        echo -e "  Change the ${W}include themes/...${N} line to one of:"
        echo -e "    ${W}themes/dyslexia-warm-brown.conf${N}   Cream on brown (easy on eyes)"
        echo -e "    ${W}themes/cyberpunk-purple.conf${N}      Neon purple Dracula vibes"
        echo -e "    ${W}themes/matrix-green.conf${N}          Classic green-on-black hacker"
        echo -e "    ${W}themes/vaporwave.conf${N}             Retro pink and teal"
        echo ""
        echo -e "  ${D}--- Fonts ---${N}  ${D}(edit font_family in dyslexia-friendly.conf)${N}"
        echo -e "    ${W}OpenDyslexicMono${N}                  Dyslexia-optimized (current)"
        echo -e "    ${W}JetBrains Mono Nerd Font${N}          Clear chars + icons"
        echo ""
        echo -e "  ${D}--- Tweaks ---${N}"
        echo -e "    ${W}font_size 14.0${N}                    Make text bigger/smaller"
        echo -e "    ${W}adjust_line_height 145%${N}           More/less space between lines"
        echo -e "    ${W}background_opacity 0.85${N}           0.0=invisible  1.0=solid"
        echo -e "    ${W}cursor_shape block${N}                block, beam, or underline"
        echo -e "    ${W}tab_bar_style powerline${N}           powerline, slant, fade, separator"
        echo ""
        echo -e "  ${D}--- Starship Prompt ---${N}  ${D}(create ~/.config/starship.toml)${N}"
        echo -e "    See presets: ${W}starship preset -l${N}"
        echo -e "    Use a preset: ${W}starship preset gruvbox-rainbow > ~/.config/starship.toml${N}"
        echo ""
        echo -e "  ${D}--- Add Your Own ---${N}"
        echo -e "    Add aliases in ${W}~/.bashrc${N} or ${W}~/.bash_aliases${N}"
        echo -e "    Add tips in ${W}~/.config/bash/dyslexia-enhancements.sh${N} (edit the arrays)"
    fi

    echo ""
    if [ "$topic" = "all" ]; then
        echo -e "  ${D}Tip: ${W}help kitty${N}${D}, ${W}help git${N}${D}, ${W}help shortcuts${N}${D}, ${W}help advanced${N}${D}, ${W}help customize${N}${D}, ${W}help basics${N}"
    fi
    echo ""
}

# Make help available with topic support
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
