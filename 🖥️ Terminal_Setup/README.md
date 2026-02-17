# Terminal Setup - Dyslexia-Friendly Kitty Rice

A complete terminal configuration optimized for neurodivergent users, featuring the Kitty terminal emulator with cyberpunk aesthetics and dyslexia-friendly defaults.

## What's Included

### Kitty Terminal Config
- **kitty.conf** - Cyberpunk-themed Kitty configuration (neon colors, transparency, tab bar)
- **dyslexia-friendly.conf** - Dyslexia overlay: OpenDyslexic font, 145% line height, wider characters, no ligatures
- **4 Color Themes:**
  - Warm Brown (default) - high contrast, easy on the eyes
  - Cyberpunk Purple - Dracula-inspired neon
  - Matrix Green - classic hacker aesthetic
  - Vaporwave - retro pink/teal vibes

### Bash Enhancements
- **dyslexia-enhancements.sh** - comprehensive bash setup:
  - Case-insensitive autocomplete
  - Fuzzy history search (fzf)
  - Modern CLI replacements (eza, bat, fd, ripgrep)
  - Starship prompt
  - Helpful aliases and functions
  - Welcome message with command reference

## Quick Install

```bash
git clone https://github.com/yesthatsjames/neurodivergent-computing-toolkit.git
cd "neurodivergent-computing-toolkit/🖥️ Terminal_Setup"
./install.sh
```

## Manual Install

1. Install Kitty: `sudo apt install kitty`
2. Copy `kitty/` to `~/.config/kitty/`
3. Copy `bash/dyslexia-enhancements.sh` to `~/.config/bash/`
4. Add `source ~/.config/bash/dyslexia-enhancements.sh` to your `~/.bashrc`
5. Install fonts: JetBrains Mono Nerd Font + OpenDyslexic

## Dependencies

| Tool | What it does | Install |
|------|-------------|---------|
| kitty | GPU-accelerated terminal | `sudo apt install kitty` |
| fzf | Fuzzy finder (Ctrl+R history) | `sudo apt install fzf` |
| bat | Syntax-highlighted cat | `sudo apt install bat` |
| eza | Modern ls replacement | `sudo apt install eza` |
| fd | Fast file finder | `sudo apt install fd-find` |
| ripgrep | Fast grep | `sudo apt install ripgrep` |
| starship | Cross-shell prompt | [starship.rs](https://starship.rs) |

## Switching Themes

Edit `~/.config/kitty/dyslexia-friendly.conf` and change:

```conf
# Change this line to switch themes:
include themes/dyslexia-warm-brown.conf

# Options:
# include themes/dyslexia-warm-brown.conf
# include themes/cyberpunk-purple.conf
# include themes/matrix-green.conf
# include themes/vaporwave.conf
```

## Design Principles

- **High contrast without harshness** - cream on dark brown, not white on black
- **Increased spacing** - 145% line height, wider characters reduce crowding
- **No ligatures** - prevents character confusion
- **Case-insensitive everything** - spelling mistakes don't slow you down
- **Visual anchors** - colored prompts, icons, syntax highlighting
- **Reduce retyping** - massive history, fuzzy search, autocomplete

## Works On

- Ubuntu / Debian (including Raspberry Pi)
- Fedora / RHEL
- Arch Linux
- Any Linux distro with apt, dnf, or pacman
