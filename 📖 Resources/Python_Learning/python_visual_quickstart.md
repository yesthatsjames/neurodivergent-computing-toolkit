# Python Visual Quick-Start Guide
## For Neurodivergent Learners

---

## The 5-Minute Start

```
┌─────────────────────────────────────────┐
│  1. Open Terminal                       │
│  2. Type: python3                       │
│  3. See >>> prompt                      │
│  4. You're coding now                   │
└─────────────────────────────────────────┘
```

---

## Visual Syntax Map

### Basic Operations (Calculator Mode)

```
MATH                    RESULT
────────────────────────────────
>>> 10 + 5              15
>>> 10 - 5              5
>>> 10 * 5              50
>>> 10 / 5              2.0
>>> 10 ** 2             100  (power)
>>> 10 % 3              1    (remainder)
```

### Variables (Storing Things)

```
CONCEPT: Named boxes that hold values

┌─────────────┐
│ name = "Jo" │  ← Put "Jo" in box called 'name'
└─────────────┘

┌──────────────┐
│ age = 25     │  ← Put 25 in box called 'age'
└──────────────┘

┌─────────────────────────────────┐
│ print(f"I'm {name}, age {age}") │  → I'm Jo, age 25
└─────────────────────────────────┘
```

### Strings (Text)

```
VISUAL                          MEANING
─────────────────────────────────────────────
"hello"                         Simple text
'hello'                         Same thing
f"Hello {name}"                 Text with variable
"hello".upper()                 "HELLO"
"HELLO".lower()                 "hello"
"hello world".split()           ["hello", "world"]
```

### Lists (Ordered Collections)

```
VISUAL STRUCTURE:

  ┌───────────────────────────┐
  │ ["apple", "banana", "kiwi"]│
  └───────────────────────────┘
     ↑       ↑        ↑
    [0]     [1]      [2]     ← Index numbers

OPERATIONS:
>>> fruits = ["apple", "banana", "kiwi"]
>>> fruits[0]                    "apple"
>>> fruits.append("mango")       Add to end
>>> len(fruits)                  4
>>> "apple" in fruits            True
```

### Loops (Repeat Actions)

```
VISUAL FLOW:

    ┌──────────────────────┐
    │ for item in list:    │
    │     do_something()   │  ← Repeat for each item
    └──────────────────────┘

EXAMPLE:
>>> files = ["doc1.txt", "doc2.txt", "doc3.txt"]
>>> for file in files:
...     print(f"Processing {file}")
...
Processing doc1.txt
Processing doc2.txt
Processing doc3.txt
```

### Conditionals (If/Then)

```
DECISION TREE:

         ┌─────────────┐
         │ if x > 10:  │
         └──────┬──────┘
                │
        ┌───────┴────────┐
        │                │
       YES              NO
        │                │
   do this         do that

EXAMPLE:
>>> age = 20
>>> if age >= 18:
...     print("Adult")
... else:
...     print("Minor")
...
Adult
```

### Functions (Reusable Code)

```
CONCEPT: Recipe you can use multiple times

┌────────────────────────────┐
│ def greet(name):           │  ← Define the recipe
│     return f"Hello {name}" │
└────────────────────────────┘

>>> greet("Alex")             ← Use it
"Hello Alex"
>>> greet("Sam")              ← Use it again
"Hello Sam"
```

---

## Common Patterns (Visual Reference)

### Pattern: Process All Files

```
┌─────────────────────────────────────┐
│ import os                           │  Step 1: Get tools
│                                     │
│ files = os.listdir('.')             │  Step 2: Get list
│                                     │
│ for file in files:                  │  Step 3: Loop
│     if file.endswith('.txt'):       │  Step 4: Filter
│         print(f"Found: {file}")     │  Step 5: Action
└─────────────────────────────────────┘
```

### Pattern: Read and Process File

```
┌─────────────────────────────────────┐
│ with open('file.txt') as f:         │  Auto-closes file
│     content = f.read()              │  Read all content
│     lines = content.split('\n')     │  Split by line
│     for line in lines:              │  Process each
│         print(line.upper())         │  Do something
└─────────────────────────────────────┘
```

### Pattern: Build From List

```
┌─────────────────────────────────────┐
│ numbers = [1, 2, 3, 4, 5]           │
│                                     │
│ doubled = []                        │  Empty result
│ for num in numbers:                 │  For each
│     doubled.append(num * 2)         │  Add to result
│                                     │
│ # Result: [2, 4, 6, 8, 10]          │
└─────────────────────────────────────┘

SHORTCUT (List Comprehension):
>>> doubled = [num * 2 for num in numbers]
```

---

## Error Messages (Don't Panic)

### Visual Error Decoder

```
>>> print(name)
NameError: name 'name' is not defined
          ↑
    Problem here

MEANING: You tried to use 'name' but never created it
FIX: Create it first → name = "something"
```

```
>>> numbers = [1, 2, 3]
>>> numbers[5]
IndexError: list index out of range
           ↑
    Asking for position 5, but list only has 3 items

FIX: Use numbers[0], numbers[1], or numbers[2]
```

```
>>> "5" + 5
TypeError: can only concatenate str (not "int") to str
           ↑
    Mixing text and number

FIX: Convert → "5" + str(5) or int("5") + 5
```

---

## Color-Coded Concept Map

```
🟦 DATA TYPES          🟩 OPERATIONS       🟨 CONTROL FLOW
─────────────          ──────────────      ────────────────
str   "text"           +  -  *  /          if/else
int   42               <  >  ==            for loop
float 3.14             and or not          while loop
bool  True/False       in                  break/continue
list  [1,2,3]          .method()
dict  {key: val}

🟪 INPUT/OUTPUT        🟧 FILE OPS         🟥 ORGANIZATION
────────────────       ────────────        ───────────────
print()                open()              def function():
input()                read()              import module
f"string"              write()             class Name:
```

---

## REPL Workflow (Visual)

```
TRADITIONAL CODING:              PYTHON REPL:

Write code                       >>> Try idea
  ↓                                 ↓
Save file                        See result instantly
  ↓                                 ↓
Run program                      Works? Save it
  ↓                                 ↓
See if it works                  Doesn't work? Try again
  ↓                                 ↓
(Context lost)                   (Context preserved)
  ↓
Start over


🧠 ADHD BENEFIT: Instant feedback loop
📚 DYSLEXIA BENEFIT: See results, not imagine them
♾️ AUTISM BENEFIT: Systematic experimentation
```

---

## Module Import Visual Guide

```
CONCEPT: Using tools someone else built

┌──────────────────────────────────────┐
│ import os          ← Get entire toolbox
│ os.listdir('.')    ← Use tool from box
└──────────────────────────────────────┘

┌──────────────────────────────────────┐
│ from os import listdir  ← Get one tool
│ listdir('.')            ← Use it directly
└──────────────────────────────────────┘

┌──────────────────────────────────────┐
│ import os as operating_system  ← Rename
│ operating_system.listdir('.')  ← Use new name
└──────────────────────────────────────┘
```

### Common Useful Modules

```
MODULE      PURPOSE                  EXAMPLE
──────      ───────                  ───────
os          File/folder operations   os.listdir('.')
sys         System operations        sys.argv
pathlib     Modern file paths        Path('file.txt')
datetime    Dates and times          datetime.now()
json        JSON data                json.load(file)
re          Regex patterns           re.search(pattern, text)
glob        Find files               glob.glob('*.txt')
shutil      Copy/move files          shutil.copy(src, dst)
```

---

## Indentation Visual Guide

```
❌ WRONG (Mixed spaces/tabs or inconsistent):

if True:
  print("2 spaces")
    print("4 spaces")  ← Error!

✅ RIGHT (Consistent indentation):

if True:
    print("4 spaces")
    print("4 spaces")
    if nested:
        print("8 spaces")

RULE: Pick spaces (4 is standard) and stick to it
Your editor can do this automatically
```

---

## Quick Reference Cards

### String Methods
```
"hello".upper()          → "HELLO"
"HELLO".lower()          → "hello"
"hello".capitalize()     → "Hello"
"hello world".split()    → ["hello", "world"]
" hello ".strip()        → "hello"
"hello".replace("h","j") → "jello"
"hello".startswith("h")  → True
"hello".endswith("o")    → True
```

### List Methods
```
lst = [1, 2, 3]
lst.append(4)            → [1, 2, 3, 4]
lst.insert(0, 0)         → [0, 1, 2, 3, 4]
lst.remove(2)            → [0, 1, 3, 4]
lst.pop()                → 4 (and removes it)
lst.sort()               → Sorts in place
sorted(lst)              → Returns sorted copy
len(lst)                 → 3
```

### Dictionary Patterns
```
person = {
    "name": "Alex",
    "age": 25,
    "city": "NYC"
}

person["name"]           → "Alex"
person.get("name")       → "Alex"
person.keys()            → ["name", "age", "city"]
person.values()          → ["Alex", 25, "NYC"]
person.items()           → [("name", "Alex"), ...]
```

---

## Practical One-Liners

```
# Get all .txt files in current directory
txt_files = [f for f in os.listdir('.') if f.endswith('.txt')]

# Read entire file
content = open('file.txt').read()

# Write to file
open('output.txt', 'w').write("Hello world")

# Get current date/time
from datetime import datetime
now = datetime.now().strftime("%Y-%m-%d %H:%M")

# Sort files by modification time
from pathlib import Path
files = sorted(Path('.').glob('*'), key=lambda f: f.stat().st_mtime)
```

---

## Debugging Visual Process

```
PROBLEM
  ↓
MINIMAL TEST in REPL
  ↓
  ├─ Works? → Add complexity
  │             ↓
  │          Keep building
  │
  └─ Fails? → Simplify further
                ↓
             Find exact break point
```

### The Print() Debugging Method

```
def process_data(items):
    print(f"Received: {items}")  ← See what came in

    result = []
    for item in items:
        print(f"Processing: {item}")  ← Track progress
        processed = item * 2
        print(f"Result: {processed}")  ← See each result
        result.append(processed)

    print(f"Final: {result}")  ← See what goes out
    return result
```

---

## Learning Path Flowchart

```
                    START
                      ↓
            ┌─────────────────┐
            │  REPL Practice  │
            │  (30 minutes)   │
            └────────┬────────┘
                     ↓
            Comfortable with basics?
                     ↓
         ┌───────────┴───────────┐
        NO                      YES
         │                       │
         ↓                       ↓
    Repeat REPL         ┌────────────────┐
    exercises           │ First Script   │
                        │ (file rename)  │
                        └───────┬────────┘
                                ↓
                        Script works?
                                ↓
                    ┌───────────┴──────────┐
                   YES                    NO
                    │                      │
                    ↓                      ↓
            Next project          Debug with REPL
```

---

## Executive Function Checklist

**Before Starting:**
- [ ] Terminal open
- [ ] Python REPL running (`python3`)
- [ ] Water nearby
- [ ] Timer set (25 min Pomodoro optional)
- [ ] Distractions minimized

**During Coding:**
- [ ] Save experiments that work
- [ ] Comment what you're trying
- [ ] Take breaks when stuck
- [ ] Use print() liberally

**When Stuck:**
- [ ] Simplify to smallest piece
- [ ] Test in REPL first
- [ ] Google exact error message
- [ ] Take a walk

**After Success:**
- [ ] Save your code
- [ ] Add comments explaining WHY
- [ ] Note what you learned
- [ ] Celebrate (seriously)

---

## Memory Aids

### Variable Naming (Reduce Cognitive Load)

```
❌ BAD (cognitive load)
a = open('data.txt')
x = a.read()
y = x.split('\n')

✅ GOOD (self-documenting)
file_handle = open('data.txt')
file_content = file_handle.read()
lines = file_content.split('\n')
```

### Code Comments for Future You

```
# When I return to this code in a week, I'll forget WHY

# GOOD COMMENTS explain WHY:
time.sleep(2)  # API rate limit: max 30 requests/minute

# BAD COMMENTS explain WHAT (code already shows that):
time.sleep(2)  # Sleep for 2 seconds
```

---

## Neurodivergent-Optimized Study Plan

### ADHD: Sprint Method
```
Day 1: REPL only - 20 min bursts
Day 2: Build something small that interests you
Day 3: Add to yesterday's project
Day 4: Different project (variety)
Day 5: Return to Day 3 project
```

### Dyslexia: Visual-First Method
```
Day 1: Draw what you want to build
Day 2: Find examples that match your drawing
Day 3: Modify examples
Day 4: Build your version
Day 5: Visualize next project
```

### Autism: Systematic Method
```
Day 1: Read one concept, try all examples
Day 2: Next concept, document everything
Day 3: Combine concepts systematically
Day 4: Build reference documentation
Day 5: Test edge cases
```

---

**Remember: This is a reference, not a test. Bookmark it. Use it. Modify it.**

*Visual learning is valid learning.*
