#!/bin/bash
# System Maintenance Workflow
# Quick system cleanup and updates

echo "🔧 Starting System Maintenance..."
echo ""

echo "[1/4] Updating package lists..."
sudo apt update

echo ""
echo "[2/4] Upgrading packages..."
sudo apt upgrade -y

echo ""
echo "[3/4] Cleaning up old packages..."
sudo apt autoremove -y
sudo apt autoclean

echo ""
echo "[4/4] Checking disk space..."
df -h / /home | grep -v tmpfs

echo ""
echo "✅ System maintenance complete!"
