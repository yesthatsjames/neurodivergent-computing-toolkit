# Your First Python Project: File Organizer
## Neurodivergent-Friendly Template with Executive Function Support

---

## Why This Project?

**Practical value:** Actually useful in daily life
**Immediate feedback:** See results instantly
**Low complexity:** Builds confidence
**Expandable:** Add features when hyperfocus hits

---

## The Problem We're Solving

```
BEFORE:                          AFTER:
Downloads/                       Downloads/
├── IMG_1234.jpg                ├── images/
├── IMG_5678.jpg                │   ├── IMG_1234.jpg
├── document.pdf                │   └── IMG_5678.jpg
├── notes.txt                   ├── documents/
├── video.mp4                   │   └── document.pdf
└── random_file.xyz             ├── text/
                                │   └── notes.txt
                                ├── videos/
                                │   └── video.mp4
                                └── other/
                                    └── random_file.xyz
```

---

## Project Breakdown (Task Chunking)

```
┌────────────────────────────────────────┐
│ PHASE 1: List files (easiest)         │ ← Start here
├────────────────────────────────────────┤
│ PHASE 2: Identify file types          │
├────────────────────────────────────────┤
│ PHASE 3: Create folders                │
├────────────────────────────────────────┤
│ PHASE 4: Move files                    │
├────────────────────────────────────────┤
│ PHASE 5: Add safety features           │ ← Optional
└────────────────────────────────────────┘
```

---

## Phase 1: List Files (5 minutes)

### Goal
Just see what files are in a folder

### Open REPL
```bash
python3
```

### Try This
```python
>>> import os
>>> files = os.listdir('.')
>>> print(files)
['file1.txt', 'file2.jpg', 'file3.pdf']
```

### What You Learned
- `import os` gives you file tools
- `os.listdir('.')` lists current folder (`.` means "here")
- `print()` shows the result

### ✅ Success Check
- [ ] You can see a list of files
- [ ] You understand what `.` means

**If stuck:** Try `os.listdir('/home/yourusername/Downloads')` with your actual path

---

## Phase 2: Identify File Types (10 minutes)

### Goal
Separate files by extension (.jpg, .pdf, etc.)

### Visual Logic
```
file.jpg
     ↑
Find the dot, get everything after it
```

### Try This
```python
>>> filename = "photo.jpg"
>>> extension = filename.split('.')[-1]
>>> print(extension)
jpg
```

### What's Happening
```
filename.split('.')
  ↓
["photo", "jpg"]  ← Split at the dot
               ↑
              [-1] means "last item"
```

### Now For Real Files
```python
>>> import os
>>> files = os.listdir('.')
>>> for file in files:
...     if '.' in file:
...         ext = file.split('.')[-1]
...         print(f"{file} is a {ext} file")
...
photo.jpg is a jpg file
document.pdf is a pdf file
```

### ✅ Success Check
- [ ] You can get file extensions
- [ ] You understand the loop
- [ ] Print shows what you expect

---

## Phase 3: Create Folders (5 minutes)

### Goal
Make folders for each file type

### Try This (REPL)
```python
>>> import os
>>> os.mkdir('test_folder')
>>> # Check if it worked
>>> 'test_folder' in os.listdir('.')
True
```

### Safety: Don't Crash If Folder Exists
```python
>>> import os
>>> folder = 'images'
>>> if not os.path.exists(folder):
...     os.mkdir(folder)
...     print(f"Created {folder}")
... else:
...     print(f"{folder} already exists")
```

### ✅ Success Check
- [ ] You can create a folder
- [ ] You can check if folder exists
- [ ] No errors when folder already there

---

## Phase 4: Move Files (15 minutes)

### Goal
Actually organize files into folders

### The Plan
```
1. Get list of files
2. For each file:
   - Get extension
   - Decide which folder
   - Move it there
```

### Try With ONE File First
```python
>>> import shutil
>>> shutil.move('test.jpg', 'images/test.jpg')
```

### Visual Check
```python
>>> # Before
>>> os.listdir('.')
['test.jpg', 'images']

>>> # Move it
>>> shutil.move('test.jpg', 'images/test.jpg')

>>> # After
>>> os.listdir('.')
['images']
>>> os.listdir('images')
['test.jpg']
```

### ✅ Success Check
- [ ] You moved ONE file successfully
- [ ] You can find it in the new location
- [ ] Original location is empty

---

## Phase 5: Put It All Together

### The Full Script

Create file: `organize_files.py`

```python
#!/usr/bin/env python3
"""
File Organizer - Neurodivergent Friendly Version
Organizes files by extension into folders
"""

import os
import shutil

# === CONFIGURATION (Change these to your needs) ===

# Where are the messy files?
SOURCE_FOLDER = '/home/yourusername/Downloads'  # ← CHANGE THIS

# Where should organized files go?
# (Use '.' for same folder, or specify different location)
DESTINATION = '.'

# File type categories
CATEGORIES = {
    'images': ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'svg'],
    'documents': ['pdf', 'doc', 'docx', 'txt', 'odt'],
    'videos': ['mp4', 'avi', 'mkv', 'mov', 'flv'],
    'audio': ['mp3', 'wav', 'flac', 'ogg', 'm4a'],
    'archives': ['zip', 'tar', 'gz', 'rar', '7z'],
    'code': ['py', 'js', 'html', 'css', 'java', 'cpp'],
}

# === FUNCTIONS (The actual work) ===

def get_category(extension):
    """
    Find which category a file extension belongs to
    Returns: category name or 'other'
    """
    extension = extension.lower()

    for category, extensions in CATEGORIES.items():
        if extension in extensions:
            return category

    return 'other'  # Files we don't recognize


def create_folders():
    """
    Create all category folders if they don't exist
    """
    all_folders = list(CATEGORIES.keys()) + ['other']

    for folder in all_folders:
        folder_path = os.path.join(DESTINATION, folder)
        if not os.path.exists(folder_path):
            os.mkdir(folder_path)
            print(f"✓ Created folder: {folder}")
        else:
            print(f"○ Folder exists: {folder}")


def organize_files():
    """
    Main function: organize all files
    """
    # Get all files in source folder
    files = os.listdir(SOURCE_FOLDER)

    # Filter: only actual files, not folders
    files = [f for f in files if os.path.isfile(os.path.join(SOURCE_FOLDER, f))]

    print(f"\nFound {len(files)} files to organize\n")

    # Statistics
    moved_count = 0
    skipped_count = 0

    # Process each file
    for filename in files:
        # Skip this script itself!
        if filename == os.path.basename(__file__):
            continue

        # Get extension
        if '.' not in filename:
            category = 'other'
        else:
            extension = filename.split('.')[-1]
            category = get_category(extension)

        # Build paths
        source_path = os.path.join(SOURCE_FOLDER, filename)
        dest_folder = os.path.join(DESTINATION, category)
        dest_path = os.path.join(dest_folder, filename)

        # Check if file already exists in destination
        if os.path.exists(dest_path):
            print(f"⊘ Skipped (already exists): {filename}")
            skipped_count += 1
            continue

        # Move the file
        try:
            shutil.move(source_path, dest_path)
            print(f"→ Moved to {category}: {filename}")
            moved_count += 1
        except Exception as e:
            print(f"✗ Error moving {filename}: {e}")

    # Summary
    print(f"\n{'='*50}")
    print(f"✓ Moved: {moved_count}")
    print(f"⊘ Skipped: {skipped_count}")
    print(f"Total: {moved_count + skipped_count}")
    print(f"{'='*50}\n")


# === MAIN EXECUTION ===

if __name__ == "__main__":
    print("File Organizer Starting...\n")

    # Step 1: Create folders
    create_folders()

    # Step 2: Organize files
    organize_files()

    print("Done! Check your organized folders.")
```

---

## How to Use This Script

### Step 1: Edit Configuration
```python
# Line 12 - Change this to YOUR downloads folder:
SOURCE_FOLDER = '/home/jam1/Downloads'  # ← Your actual path
```

### Step 2: Save the File
```bash
# Save as: organize_files.py
# Make it executable:
chmod +x organize_files.py
```

### Step 3: Test Run (IMPORTANT)
```bash
# First, test on a COPY of your files
# Don't run on real files until you're confident

# Create test folder
mkdir ~/test_organize
cd ~/test_organize

# Create some test files
touch photo.jpg document.pdf video.mp4 song.mp3 code.py random.xyz

# Copy the script here
cp /path/to/organize_files.py .

# Edit SOURCE_FOLDER to be '.' (current folder)
# Then run:
python3 organize_files.py
```

### Step 4: Check Results
```bash
# You should see:
images/photo.jpg
documents/document.pdf
videos/video.mp4
audio/song.mp3
code/code.py
other/random.xyz
```

### Step 5: Use For Real
```bash
# Once confident, edit SOURCE_FOLDER back to Downloads
# Run it:
python3 organize_files.py
```

---

## Customization Ideas (For Hyperfocus Sessions)

### Add Timestamps to Folder Names
```python
from datetime import datetime

# In create_folders():
timestamp = datetime.now().strftime("%Y-%m-%d")
folder_name = f"{category}_{timestamp}"
```

### Dry Run Mode (Preview Without Moving)
```python
DRY_RUN = True  # Set to False to actually move files

# In organize_files():
if DRY_RUN:
    print(f"[DRY RUN] Would move {filename} to {category}")
else:
    shutil.move(source_path, dest_path)
```

### Organize By Date Instead
```python
import os
from datetime import datetime

def get_file_date(filepath):
    """Get creation date of file"""
    timestamp = os.path.getctime(filepath)
    return datetime.fromtimestamp(timestamp).strftime("%Y-%m")

# Then use date as folder name instead of category
```

### Duplicate File Handling
```python
# If file exists, add number
base, ext = os.path.splitext(filename)
counter = 1
while os.path.exists(dest_path):
    new_name = f"{base}_{counter}{ext}"
    dest_path = os.path.join(dest_folder, new_name)
    counter += 1
```

---

## Troubleshooting Guide

### "Permission Denied"
```
PROBLEM: Can't access folder
FIX: Check folder permissions
     Try: ls -la /path/to/folder
```

### "File Already Exists"
```
PROBLEM: Duplicate filenames
FIX: Script skips by default (safe)
     OR: Add duplicate handler (see customization)
```

### "Module Not Found"
```
PROBLEM: Missing import
CHECK: os and shutil are built-in, should always work
       If not, Python installation issue
```

### Script Doesn't Find Files
```
PROBLEM: Wrong SOURCE_FOLDER path
FIX: Print the path to verify:
     print(f"Looking in: {SOURCE_FOLDER}")
     print(os.listdir(SOURCE_FOLDER))
```

---

## Executive Function Support

### Before Running
- [ ] Backup important files
- [ ] Test on dummy files first
- [ ] Read what the script will do
- [ ] Set a timer (prevent hyperfocus on perfection)

### While Running
- [ ] Watch the output (see what's moving)
- [ ] Stop if something looks wrong (Ctrl+C)
- [ ] Take breaks between customizations

### After Running
- [ ] Check a few moved files manually
- [ ] Verify nothing got lost
- [ ] Document what you changed (for future you)

---

## Success Metrics

**You succeeded if:**
- Files are organized (even if not perfectly)
- Nothing got deleted
- You understand what the code does
- You can run it again

**Doesn't matter:**
- Whether code is "elegant"
- If you looked up syntax
- How many tries it took
- If you took breaks

---

## What You Learned

```
CONCEPTS MASTERED:
✓ File I/O operations
✓ Loops and conditionals
✓ Functions
✓ Dictionaries
✓ String manipulation
✓ Error handling
✓ Script structure

REAL-WORLD SKILLS:
✓ Automation
✓ File management
✓ Code organization
✓ Testing strategy
✓ Configuration
```

---

## Next Project Ideas

**If you enjoyed this, try:**

1. **Duplicate Finder**
   - Find duplicate files by comparing content
   - Uses: hashing, sets, file comparison

2. **Batch Renamer**
   - Rename files with patterns
   - Uses: regex, string formatting

3. **Photo Organizer by Date**
   - Sort photos by EXIF date data
   - Uses: external libraries (PIL), datetime

4. **Download Watcher**
   - Auto-organize new downloads
   - Uses: file watching, scheduling

5. **Backup Script**
   - Copy important folders to backup location
   - Uses: shutil, datetime, compression

---

## Save This Template

```bash
# Bookmark this file for reference
# When you start new projects:

# 1. Copy this template
cp organize_files.py my_new_project.py

# 2. Modify for new purpose
# 3. Test on dummy data
# 4. Run for real

# Your workflow is established!
```

---

**Remember: This is YOUR project. Modify it. Break it. Fix it. Make it yours.**

*Practical coding > Theoretical perfection*
