# 🧠 Neuro Command Center

**A neurodivergent-friendly hub for workflows, communities, and resources**

Built by neurodivergents, for neurodivergents. Celebrating lateral thinking, visual minds, and beautiful chaos. ✨

---

## 🌟 What is this?

A playful, visual web interface designed specifically for people with:
- 🧠 **Dyslexia** - OpenDyslexic font, high contrast, spacious layouts
- 🎯 **ADHD** - Quick actions, visual cues, minimal distractions
- 🎨 **Lateral thinking** - Flexible workflows, explorable interfaces
- ⚡ **Quick processing** - One-click actions, keyboard shortcuts

## 🚀 Quick Start

```bash
# Launch the Neuro Command Center
python3 ~/.local/share/neuro-command-center/server.py
```

Or use the launcher:
```bash
neuro-hub
```

The web interface will automatically open at `http://localhost:8765`

---

## ✨ Features

### ⚡ Quick Actions
One-click workflows for common tasks:
- System maintenance
- Security scans
- Development environment setup
- Focus mode (disable distractions)

### 👥 Communities
Direct links to real neurodivergent tech communities:
- r/ADHD_Programmers
- Neurodivergent in Tech Discord
- Actually Autistic Coders
- Dyslexic Advantage

### 🛠️ Tools
Curated accessibility and productivity tools:
- OpenDyslexic font
- Redshift (blue light filter)
- Pomodoro timers
- Visual note-taking tools (Obsidian, Excalidraw)
- Screen readers

### 📚 Learning Resources
Evidence-based resources for neurodivergent developers:
- How to ADHD (YouTube)
- British Dyslexia Association
- Neurodivergent Design Patterns

### 🎯 Quick Wins
Instant system tweaks:
- Enable high contrast
- Increase font sizes
- Enable Do Not Disturb
- Customize your workspace

---

## 🎨 Design Principles

### For Dyslexia:
- ✅ OpenDyslexic font throughout
- ✅ Increased letter spacing (0.02em)
- ✅ Increased word spacing (0.16em)
- ✅ Line height 1.8 (easier scanning)
- ✅ High contrast color scheme
- ✅ Large, clear buttons

### For ADHD:
- ✅ Visual icons for every action
- ✅ Animated feedback (bounce, fade, scale)
- ✅ Keyboard shortcuts (Ctrl+1-5 for tabs)
- ✅ Quick search (Ctrl+K)
- ✅ One-click actions
- ✅ Progress indicators

### For Everyone:
- ✅ Playful, engaging design
- ✅ No overwhelming walls of text
- ✅ Clear visual hierarchy
- ✅ Responsive and fast

---

## 🔧 Customization

All content is stored in JSON for easy editing:

```bash
# Edit resources, communities, tools
nano ~/.local/share/neuro-command-center/resources.json

# Add your own workflows
nano ~/.local/share/neuro-command-center/workflows/my_workflow.sh
chmod +x ~/.local/share/neuro-command-center/workflows/my_workflow.sh
```

### Example: Add your own quick action

```json
{
  "workflows": [
    {
      "name": "My Custom Workflow",
      "icon": "🎨",
      "script": "my_workflow.sh",
      "description": "Does something awesome",
      "category": "custom"
    }
  ]
}
```

---

## 🤝 Contributing

**This is a living, evolving project!**

Ways to contribute:
1. **Add your own resources** - Edit `resources.json`
2. **Create workflows** - Add scripts to `workflows/`
3. **Share your setup** - Fork and customize
4. **Join the community** - Share tips and improvements
5. **Report issues** - Help make it better for everyone

### Share Your Version

1. Copy the project to GitHub:
```bash
cd ~/.local/share/neuro-command-center
git init
git add .
git commit -m "My Neuro Command Center setup"
git remote add origin YOUR_REPO_URL
git push -u origin main
```

2. Add your customizations
3. Share with the community!

### Contribution Ideas
- 🎨 Alternative color themes
- 🌍 Translations
- 🛠️ New workflows
- 📚 More resources
- ♿ Additional accessibility features
- 🎮 Gamification elements

---

## 📁 Project Structure

```
~/.local/share/neuro-command-center/
├── server.py              # Python web server
├── resources.json         # All content (editable!)
├── README.md             # This file
├── templates/
│   └── index.html        # Main web interface
└── workflows/            # Executable scripts
    ├── system_maintenance.sh
    ├── security_scan.sh
    ├── focus_mode.sh
    └── dev_setup.sh
```

---

## 🎯 Keyboard Shortcuts

- `Ctrl+1` - Quick Actions
- `Ctrl+2` - Communities
- `Ctrl+3` - Tools
- `Ctrl+4` - Learning
- `Ctrl+5` - Quick Wins
- `Ctrl+K` - Focus search

---

## 🌈 Philosophy

> "Neurodivergence is not a bug, it's a feature."

This project celebrates:
- **Lateral thinking** - Multiple paths to solutions
- **Visual processing** - Icons, colors, spatial layout
- **Quick processing** - Fast actions, minimal friction
- **Novel approaches** - Breaking conventional UI patterns
- **Change** - Evolving, customizable, never static

---

## 💜 Credits

Made with love by the neurodivergent community.

Special thanks to:
- OpenDyslexic font creators
- r/ADHD_Programmers community
- Everyone who shared their experiences and needs

---

## 📜 License

Free to use, modify, and share. No restrictions.

Help other neurodivergent developers - that's all we ask. 🚀

---

## 🔗 Resources

- [OpenDyslexic](https://opendyslexic.org/)
- [r/ADHD_Programmers](https://www.reddit.com/r/ADHD_Programmers/)
- [Dyslexic Advantage](https://www.dyslexicadvantage.org/)
- [Neurodiversity Design](https://neurodiversity.design/)
- [How to ADHD](https://www.youtube.com/@HowtoADHD)

---

**Questions? Ideas? Contributions?**

This is YOUR project. Make it work for YOUR brain. 🧠✨
