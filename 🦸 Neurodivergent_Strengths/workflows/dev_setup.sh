#!/bin/bash
# Development Setup Workflow
# Quick environment setup for coding

echo "⚙️ Setting up development environment..."
echo ""

# Check common dev tools
echo "[1/3] Checking development tools..."
for tool in git python3 node npm docker; do
    if command -v $tool &> /dev/null; then
        version=$($tool --version 2>&1 | head -n1)
        echo "  ✅ $tool: $version"
    else
        echo "  ❌ $tool: not installed"
    fi
done

echo ""
echo "[2/3] Checking Python environment..."
if command -v python3 &> /dev/null; then
    python3 --version
    echo "Pip packages:"
    pip list 2>/dev/null | head -n 5
fi

echo ""
echo "[3/3] Git status..."
if [ -d .git ]; then
    git status
else
    echo "Not in a git repository"
fi

echo ""
echo "✅ Development environment check complete!"
