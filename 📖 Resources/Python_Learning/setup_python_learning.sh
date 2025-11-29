#!/bin/bash

# Python Neurodivergent Learning Suite - Setup Script
# Creates organized folder structure and provides quick access

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  Python Neurodivergent Learning Suite Setup   ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════╝${NC}"
echo ""

# Create directory structure
LEARN_DIR="$HOME/python-neurodivergent-learning"
echo -e "${GREEN}Creating learning directory...${NC}"
mkdir -p "$LEARN_DIR"
mkdir -p "$LEARN_DIR/projects"
mkdir -p "$LEARN_DIR/experiments"
mkdir -p "$LEARN_DIR/notes"

# Move files to organized location
echo -e "${GREEN}Organizing learning materials...${NC}"
mv "$HOME/python_appetite_neurodivergent.md" "$LEARN_DIR/" 2>/dev/null || true
mv "$HOME/python_visual_quickstart.md" "$LEARN_DIR/" 2>/dev/null || true
mv "$HOME/python_repl_cheatsheet.md" "$LEARN_DIR/" 2>/dev/null || true
mv "$HOME/python_first_project_template.md" "$LEARN_DIR/" 2>/dev/null || true
mv "$HOME/python_neurodivergent_learning_suite.md" "$LEARN_DIR/README.md" 2>/dev/null || true

# Create quick-access aliases
ALIAS_FILE="$HOME/.bash_aliases"

echo -e "${GREEN}Creating quick-access commands...${NC}"

cat >> "$ALIAS_FILE" << 'EOF'

# ═══════════════════════════════════════════════════════════
# Python Neurodivergent Learning Suite - Quick Access
# ═══════════════════════════════════════════════════════════

# Open learning directory
alias pylearn='cd ~/python-neurodivergent-learning && ls -la'

# View resources in terminal
alias py-tutorial='less ~/python-neurodivergent-learning/python_appetite_neurodivergent.md'
alias py-quickstart='less ~/python-neurodivergent-learning/python_visual_quickstart.md'
alias py-cheat='less ~/python-neurodivergent-learning/python_repl_cheatsheet.md'
alias py-project='less ~/python-neurodivergent-learning/python_first_project_template.md'
alias py-index='less ~/python-neurodivergent-learning/README.md'

# Open resources in browser (rendered Markdown)
alias py-tutorial-web='xdg-open ~/python-neurodivergent-learning/python_appetite_neurodivergent.md 2>/dev/null || open ~/python-neurodivergent-learning/python_appetite_neurodivergent.md'
alias py-cheat-web='xdg-open ~/python-neurodivergent-learning/python_repl_cheatsheet.md 2>/dev/null || open ~/python-neurodivergent-learning/python_repl_cheatsheet.md'

# Quick REPL with reminder
alias pyrepl='echo "📚 Cheat sheet: ~/python-neurodivergent-learning/python_repl_cheatsheet.md" && python3'

# Start new project from template
py-newproject() {
    if [ -z "$1" ]; then
        echo "Usage: py-newproject <project_name>"
        return 1
    fi

    PROJECT_DIR="$HOME/python-neurodivergent-learning/projects/$1"
    mkdir -p "$PROJECT_DIR"

    # Create initial project file
    cat > "$PROJECT_DIR/main.py" << 'PYEOF'
#!/usr/bin/env python3
"""
Project: $1
Created: $(date +%Y-%m-%d)

Description: [What does this do?]
"""

def main():
    """Main function"""
    print("Hello from your new project!")

    # Your code here
    pass


if __name__ == "__main__":
    main()
PYEOF

    # Create README
    cat > "$PROJECT_DIR/README.md" << 'MDEOF'
# $1

## What This Does

[Describe your project]

## How to Run

```bash
python3 main.py
```

## Notes

[Your notes as you build]
MDEOF

    chmod +x "$PROJECT_DIR/main.py"
    echo "✓ Created project: $PROJECT_DIR"
    echo "→ Opening in editor..."
    cd "$PROJECT_DIR"
    ls -la
}

# Save current REPL experiment
py-saveexp() {
    if [ -z "$1" ]; then
        FILENAME="experiment_$(date +%Y%m%d_%H%M%S).py"
    else
        FILENAME="$1"
    fi

    DEST="$HOME/python-neurodivergent-learning/experiments/$FILENAME"

    echo "# Paste your REPL code, then press Ctrl+D"
    cat > "$DEST"

    echo "✓ Saved to: $DEST"
}

EOF

echo -e "${GREEN}Setup complete!${NC}"
echo ""
echo -e "${YELLOW}═══════════════════════════════════════════════${NC}"
echo -e "${YELLOW}  Available Commands (after reloading shell)   ${NC}"
echo -e "${YELLOW}═══════════════════════════════════════════════${NC}"
echo ""
echo -e "${BLUE}Navigation:${NC}"
echo "  pylearn              → Open learning directory"
echo ""
echo -e "${BLUE}View Resources:${NC}"
echo "  py-index             → View full resource index"
echo "  py-tutorial          → Main tutorial"
echo "  py-quickstart        → Visual quick-start guide"
echo "  py-cheat             → REPL cheat sheet"
echo "  py-project           → First project template"
echo ""
echo -e "${BLUE}Development:${NC}"
echo "  pyrepl               → Start Python REPL (with reminder)"
echo "  py-newproject <name> → Create new project from template"
echo "  py-saveexp [file]    → Save REPL experiment"
echo ""
echo -e "${BLUE}Web View (rendered):${NC}"
echo "  py-tutorial-web      → Open tutorial in browser"
echo "  py-cheat-web         → Open cheat sheet in browser"
echo ""
echo -e "${YELLOW}═══════════════════════════════════════════════${NC}"
echo ""
echo -e "${GREEN}Next steps:${NC}"
echo "  1. Reload your shell: ${BLUE}source ~/.bashrc${NC}"
echo "  2. Run: ${BLUE}pylearn${NC} to see your materials"
echo "  3. Run: ${BLUE}py-index${NC} to read the guide"
echo "  4. Run: ${BLUE}pyrepl${NC} to start coding!"
echo ""
echo -e "${YELLOW}All materials are in:${NC} $LEARN_DIR"
echo ""
