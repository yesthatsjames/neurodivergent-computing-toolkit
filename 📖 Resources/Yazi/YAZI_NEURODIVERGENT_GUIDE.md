# 📁 Yazi: The Neurodivergent-Friendly File Manager

**Tool:** [Yazi](https://github.com/sxyazi/yazi) - Terminal File Manager
**Why It Works:** Designed for visual-spatial thinking and pattern recognition
**Status:** Production-ready, actively maintained

---

## 🧠 Why Yazi Works for Neurodivergent Brains

### Visual-Spatial Strengths (Dyslexia)

Traditional file managers force you to remember paths and navigate blindly. Yazi gives you **constant visual context**:

```
┌─────────────┬──────────────────┬─────────────┐
│   Parent    │     Current      │   Preview   │
│  (context)  │  (where you are) │  (what's in)│
└─────────────┴──────────────────┴─────────────┘
```

**Cognitive Load Reduction:**
- Never ask "where am I?" - you can SEE the hierarchy
- No mental path tracking - visual spatial layout shows relationships
- Preview panel = see file contents without opening
- Color-coded file types = pattern recognition at a glance

### ADHD Hyperfocus Support

**Flow-State Friendly:**
- Keyboard-only navigation (no mouse interruptions)
- Tab support for parallel workflows
- Fast operations that don't break concentration
- Visual markers for copy/cut/paste state

**Decision Fatigue Reduction:**
- Smart defaults for common operations
- Consistent keybindings (muscle memory)
- Visual confirmation before destructive actions
- No menu diving or context switching

### Autism-Friendly Features

**Systematic & Predictable:**
- Logical, consistent keybinding scheme
- Same operations work everywhere
- Clear visual feedback for all actions
- Configurable to YOUR preferences

**Attention to Detail:**
- See file permissions, sizes, dates at a glance
- Sort by any criteria instantly
- Filter and search with precision
- Preview files before opening

---

## 🎯 Key Neurodivergent Advantages

### 1. **Constant Context Awareness**

Traditional CLI: `cd /long/path/to/somewhere` (where even am I?)
Yazi: Three panels show parent → current → preview (full spatial awareness)

**Why This Matters:**
- Reduces working memory load
- Leverages visual-spatial strengths
- Eliminates "wait, where was I?" moments
- Natural mental mapping of file hierarchy

### 2. **Pattern Recognition Over Text Processing**

Instead of reading filenames line by line:
- **Colors** indicate file types instantly
- **Icons/emojis** provide visual anchors
- **Spatial position** creates mental map
- **Preview panel** shows content context

**Perfect for dyslexic brains** that excel at visual patterns but struggle with linear text.

### 3. **Low Cognitive Overhead**

Traditional file operations require:
1. Remember command syntax
2. Type long paths
3. Verify with another command
4. Repeat if wrong

Yazi operations:
1. Navigate visually → 2. Press key → 3. Done

**Operations become muscle memory, not mental calculation.**

### 4. **Hyperfocus Protection**

Terminal file management often breaks flow:
- Mouse → keyboard → mouse context switching
- Opening new windows
- Mental context reload after each operation

Yazi keeps you **in the zone**:
- All operations via keyboard
- No window management
- Visual feedback without interruption
- Tabs for parallel tasks without losing place

---

## 🚀 Installation & Setup

### Quick Install (Linux)

```bash
# Download latest release
VERSION="v25.5.31"
cd /tmp
curl -fsSL "https://github.com/sxyazi/yazi/releases/download/${VERSION}/yazi-x86_64-unknown-linux-gnu.zip" -o yazi.zip
unzip -q yazi.zip
sudo cp yazi-x86_64-unknown-linux-gnu/yazi /usr/local/bin/
sudo cp yazi-x86_64-unknown-linux-gnu/ya /usr/local/bin/
sudo chmod +x /usr/local/bin/yazi /usr/local/bin/ya
```

### Essential Shell Wrapper

Add to `~/.bashrc` or `~/.zshrc`:

```bash
# Launch Yazi with directory persistence
function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
```

**Why this matters:** When you quit Yazi, your shell changes to the directory you were browsing. Seamless integration!

---

## ⌨️ Essential Keybindings

### Navigation (Choose Your Style)

**Arrow Keys OR Vim-Style:**
- `↑/k` - Up
- `↓/j` - Down
- `←/h` - Parent directory
- `→/l` - Enter directory

**Jump Navigation:**
- `gg` - Top of list
- `G` - Bottom of list
- `.` - Toggle hidden files

### File Operations (Visual Workflow)

**Copy/Move Workflow:**
1. `Space` - Select files (see visual marker)
2. `y` - Yank (copy) OR `x` - Cut (move)
3. Navigate to destination
4. `p` - Paste

**Visual Feedback:**
- Green marker = Copied (will duplicate)
- Red marker = Cut (will be moved)

**Other Operations:**
- `a` - Create file/folder
- `r` - Rename
- `d` - Delete (to trash)
- `D` - Delete permanently (⚠️ use carefully)

### Search & Filter

- `/` - Find in current directory
- `s` - Search filenames recursively (uses `fd`)
- `S` - Search file contents (uses `ripgrep`)
- `f` - Filter by pattern

### Tab Management (ADHD Superpower)

- `t` - New tab
- `[` / `]` - Previous/Next tab
- `1`, `2`, `3` - Jump to tab
- `Ctrl+w` - Close tab

**Use Case:** Keep different project directories open in tabs. Switch contexts without losing your place!

---

## 🎨 Configuration for Your Brain

Yazi is fully customizable. Config files live in `~/.config/yazi/`:

### `yazi.toml` - Main Settings

```toml
[mgr]
# Adjust panel ratios to your visual preference
ratio = [1, 4, 3]  # parent:current:preview

# Sort preferences
sort_by = "modified"      # or "alphabetical", "size", "extension"
sort_dir_first = true     # folders at top
show_hidden = false       # toggle with '.' key

# Visual info display
linemode = "size"         # or "mtime", "permissions"
```

### `theme.toml` - Colors

Customize colors to match your visual processing preferences. High contrast for some, softer colors for others who are light-sensitive.

### `keymap.toml` - Keybindings

Remap any key to match your muscle memory. If you're used to different shortcuts, make Yazi adapt to YOU.

---

## 💡 Neurodivergent Workflow Examples

### Example 1: Visual Project Organization

**Scenario:** Organizing scattered project files (executive function support)

**Traditional way (high cognitive load):**
```bash
# Where even are my files?
find . -name "*.py"
# OK now remember that path
mkdir -p new_structure/python
# Type out each move command
mv ./some/deep/path/file.py new_structure/python/
# Repeat 50 times, lose track, forget what you were doing
```

**Yazi way (visual & low-friction):**
1. Launch `yy` - See everything visually
2. Press `.` to show hidden files
3. Create folders: `a` → type `archive/` → Enter
4. Use `Space` to select files (SEE what you're selecting)
5. Visual mode `v` for range selection
6. `x` (cut) → navigate → `p` (paste)
7. Visual confirmation of operation

**Cognitive Benefits:**
- SEE file structure instead of imagining it
- Visual selection prevents mistakes
- No path typing (reduces typos/frustration)
- Color coding helps categorize

### Example 2: Finding That Lost File

**ADHD Moment:** "I saved that file SOMEWHERE... what was it called again?"

**Yazi Solution:**
1. Navigate to probable parent directory
2. Press `s` (fd search)
3. Type fragment you remember: `budget` or `report`
4. Browse results with visual preview
5. Press Enter to open

**OR search file contents:**
1. Press `S` (ripgrep)
2. Type text you remember inside the file
3. Find it even if you forgot the filename

**Why This Works:**
- Multiple search strategies (filename OR content)
- Visual preview confirms "yes, that's the one!"
- No need to remember exact names or paths
- Pattern recognition over recall

### Example 3: Media Production Workflow

**Scenario:** Organizing video project files (real-world use case)

```
Raw Footage/
├── interview_01.mp4
├── interview_02.mp4
├── broll_cityscape.mp4
└── broll_nature.mp4

Need to organize into:
- raw/interviews/
- raw/broll/
- edited/
- exports/
```

**Yazi Workflow:**
1. Open project in tab 1: `t` → navigate to project
2. Open destination in tab 2: `t` → navigate to organized structure
3. Switch tabs with `1` and `2` to compare
4. Use filter `f` → `*interview*` to see only interviews
5. Select all: `Ctrl+a` → copy: `y`
6. Switch to tab 2: `2` → paste: `p`
7. Clear filter to see all files again

**Neurodivergent Benefits:**
- Tabs = parallel workspace without losing context
- Filter = focus on subset without distraction
- Visual comparison across tabs
- No mental tracking of what's been moved

---

## 🔬 Research-Backed Benefits

### Visual-Spatial Processing

> "42% increase in task completion rates with appropriate digital tools"
> — Neurodiversity research, 2023

Yazi's three-panel layout directly supports:
- Spatial memory (stronger than verbal memory for many neurodivergent individuals)
- Context retention (see relationships visually)
- Pattern recognition (colors, layout, structure)

### Executive Function Support

Traditional file managers require:
- **Planning** (where to click, what menus to open)
- **Working memory** (remember paths, remember what you're doing)
- **Inhibition** (don't get distracted by UI elements)

Yazi reduces executive function load:
- ✅ Consistent keybindings = muscle memory (automatic)
- ✅ Visual state = external working memory
- ✅ Minimal interface = fewer distractions

### ADHD Time Blindness Mitigation

File timestamps in list view show:
- Modified times at a glance
- Sort by recency (find recent work)
- Visual cues for "old vs new"

Helps answer: "When did I last work on this?"

---

## 🎓 Learning Resources

### Official Documentation
- **Website:** https://yazi-rs.github.io/
- **GitHub:** https://github.com/sxyazi/yazi
- **Configuration Guide:** https://yazi-rs.github.io/docs/configuration/overview

### For Neurodivergent Users

**Recommended Learning Approach:**

1. **Hands-on first** (dyslexia-friendly)
   - Just launch it: `yy`
   - Use arrow keys to explore
   - Press `~` for help anytime

2. **Visual reference** (included in this toolkit)
   - Open `yazi_user_guide.html` in browser
   - Color-coded, visual layout
   - Tab-organized by topic

3. **Customize gradually** (ADHD-friendly)
   - Start with defaults
   - Change ONE thing at a time
   - Let muscle memory develop

4. **Build on strengths** (autism-friendly)
   - If you're systematic: read full docs, configure perfectly
   - If you're experimental: try things, break things, learn by doing
   - If you're visual: focus on colors and layout first

---

## 💪 Your Neurodivergent Advantage

Traditional file management was designed by and for neurotypical working memory.

Yazi works with neurodivergent cognition:

- **Visual thinkers:** See structure instead of reading paths
- **Pattern recognition:** Colors and layout over text parsing
- **Hyperfocus:** Keyboard flow, no context breaks
- **Executive function differences:** Automation and muscle memory over decision-making
- **Time blindness:** Visual timestamps and sorting
- **Working memory differences:** External visual state, no mental tracking

**This isn't a "disability accommodation" — it's your brain operating at optimal efficiency.**

---

## 🚀 Quick Start Checklist

- [ ] Install Yazi
- [ ] Add `yy` function to shell config
- [ ] Launch and explore with arrow keys
- [ ] Try `Space` to select, `y` to copy, `p` to paste
- [ ] Press `.` to toggle hidden files
- [ ] Press `~` to see all keybindings
- [ ] Open `yazi_user_guide.html` for visual reference
- [ ] Customize colors in `~/.config/yazi/theme.toml` (optional)
- [ ] Set up workspace aliases for quick access (optional)

---

## 🤝 Community & Support

**Found a workflow that works for your brain?** Share it!

- GitHub Issues: https://github.com/sxyazi/yazi/issues
- This toolkit: Contribute your neurodivergent-optimized configs

**Your configuration choices are valid.** If you need bigger text, different colors, or custom keybindings — that's not "weird," that's optimization.

---

## 📜 Credits

- **Yazi:** Created by [@sxyazi](https://github.com/sxyazi)
- **This Guide:** Created by [@yesthatsjames](https://github.com/yesthatsjames)
- **Neurodivergent insights:** Lived experience + community feedback

---

**Remember:** Your brain isn't broken. Tools that don't work with your cognition are broken. Yazi is a tool built right. 💜
