#!/bin/bash
# Focus Mode Workflow
# Minimize distractions for deep work

echo "🎯 Activating Focus Mode..."
echo ""

# Disable notifications
echo "[1/4] Disabling notifications..."
gsettings set org.gnome.desktop.notifications show-banners false

# Start Pomodoro timer (if installed)
if command -v gnome-pomodoro &> /dev/null; then
    echo "[2/4] Starting Pomodoro timer..."
    gnome-pomodoro &
else
    echo "[2/4] Pomodoro timer not installed (optional)"
fi

# Enable Do Not Disturb
echo "[3/4] Enabling Do Not Disturb..."
gsettings set org.gnome.desktop.notifications show-in-lock-screen false

# Set a calming blue light filter
if command -v redshift &> /dev/null; then
    echo "[4/4] Activating blue light filter..."
    redshift -O 3500 &
else
    echo "[4/4] Redshift not installed (optional)"
fi

echo ""
echo "✅ Focus Mode activated!"
echo ""
echo "To exit Focus Mode, run: focus_mode_off.sh"
