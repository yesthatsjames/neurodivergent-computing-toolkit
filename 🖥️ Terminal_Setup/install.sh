#!/bin/bash
# ===================================================================
# Neurodivergent Terminal Setup - One-Command Installer
# Installs Kitty terminal + dyslexia-friendly configs + CLI tools
# ===================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "=========================================="
echo "  Neurodivergent Terminal Setup"
echo "=========================================="
echo ""

# Detect package manager
if command -v apt &> /dev/null; then
    PKG_INSTALL="sudo apt install -y"
    PKG_UPDATE="sudo apt update -qq"
elif command -v dnf &> /dev/null; then
    PKG_INSTALL="sudo dnf install -y"
    PKG_UPDATE="sudo dnf check-update || true"
elif command -v pacman &> /dev/null; then
    PKG_INSTALL="sudo pacman -S --noconfirm"
    PKG_UPDATE="sudo pacman -Sy"
else
    echo "Unsupported package manager. Install manually."
    exit 1
fi

echo "[1/6] Updating package lists..."
$PKG_UPDATE

echo "[2/6] Installing Kitty terminal..."
$PKG_INSTALL kitty || echo "Kitty not in repos - visit https://sw.kovidgoyal.net/kitty/"

echo "[3/6] Installing CLI tools..."
$PKG_INSTALL ripgrep fd-find bat || true
# eza replaces exa on newer distros
$PKG_INSTALL eza 2>/dev/null || $PKG_INSTALL exa 2>/dev/null || true

echo "[4/6] Installing fonts..."
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts

# JetBrains Mono Nerd Font
if [ ! -f "JetBrainsMonoNerdFont-Regular.ttf" ]; then
    echo "  Downloading JetBrains Mono Nerd Font..."
    curl -fLo "JetBrainsMono.tar.xz" \
        "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz"
    tar xf JetBrainsMono.tar.xz
    rm JetBrainsMono.tar.xz
fi

# OpenDyslexic
if [ ! -f "OpenDyslexic-Regular.otf" ]; then
    echo "  Downloading OpenDyslexic..."
    curl -fLo "OpenDyslexic-Regular.otf" \
        "https://github.com/antijingoist/opendyslexic/raw/master/compiled/OpenDyslexic-Regular.otf"
    curl -fLo "OpenDyslexic-Bold.otf" \
        "https://github.com/antijingoist/opendyslexic/raw/master/compiled/OpenDyslexic-Bold.otf"
    curl -fLo "OpenDyslexic-Italic.otf" \
        "https://github.com/antijingoist/opendyslexic/raw/master/compiled/OpenDyslexic-Italic.otf"
    curl -fLo "OpenDyslexic-BoldItalic.otf" \
        "https://github.com/antijingoist/opendyslexic/raw/master/compiled/OpenDyslexic-BoldItalic.otf"
fi

fc-cache -f 2>/dev/null

echo "[5/6] Installing Starship prompt..."
if ! command -v starship &> /dev/null; then
    curl -sS https://starship.rs/install.sh | sh -s -- -y -b ~/.local/bin
    export PATH="$HOME/.local/bin:$PATH"
fi

echo "[6/6] Copying configs..."
# Create symlinks for bat/fd if needed (Debian renames them)
mkdir -p ~/.local/bin
[ -f /usr/bin/batcat ] && [ ! -f ~/.local/bin/bat ] && ln -s /usr/bin/batcat ~/.local/bin/bat
[ -f /usr/bin/fdfind ] && [ ! -f ~/.local/bin/fd ] && ln -s /usr/bin/fdfind ~/.local/bin/fd

# Copy Kitty config
mkdir -p ~/.config/kitty/themes
cp "$SCRIPT_DIR/kitty/kitty.conf" ~/.config/kitty/
cp "$SCRIPT_DIR/kitty/dyslexia-friendly.conf" ~/.config/kitty/
cp "$SCRIPT_DIR/kitty/themes/"*.conf ~/.config/kitty/themes/

# Copy bash enhancements
mkdir -p ~/.config/bash
cp "$SCRIPT_DIR/bash/dyslexia-enhancements.sh" ~/.config/bash/

# Add to .bashrc if not already there
if ! grep -q "dyslexia-enhancements" ~/.bashrc 2>/dev/null; then
    cat >> ~/.bashrc <<'BASHRC'

# Dyslexia-friendly terminal enhancements
if [ -f ~/.config/bash/dyslexia-enhancements.sh ]; then
    source ~/.config/bash/dyslexia-enhancements.sh
fi

export PATH="$HOME/.local/bin:$PATH"
BASHRC
    echo "  Added enhancements to ~/.bashrc"
else
    echo "  ~/.bashrc already configured"
fi

echo ""
echo "=========================================="
echo "  Setup Complete!"
echo "=========================================="
echo ""
echo "  Open Kitty terminal to see your new setup."
echo "  Run 'source ~/.bashrc' to reload in current shell."
echo ""
echo "  Themes available:"
echo "    - Warm Brown (default, dyslexia-optimized)"
echo "    - Cyberpunk Purple"
echo "    - Matrix Green"
echo "    - Vaporwave"
echo ""
echo "  To switch themes, edit ~/.config/kitty/dyslexia-friendly.conf"
echo "  Change the 'include themes/...' line to your preferred theme."
echo ""
