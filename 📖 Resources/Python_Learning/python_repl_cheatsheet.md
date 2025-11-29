# Python REPL Cheat Sheet
## Neurodivergent-Optimized Quick Reference

Keep this open while coding. Ctrl+F to search.

---

## Emergency Commands

```
┌─────────────────────────────────────────┐
│ STUCK? START HERE:                      │
├─────────────────────────────────────────┤
│ Ctrl+C        → Stop running code       │
│ Ctrl+D        → Exit Python             │
│ exit()        → Exit Python (typed)     │
│ help(thing)   → Get help on 'thing'     │
│ dir(thing)    → See what 'thing' can do │
│ type(thing)   → What type is 'thing'?   │
└─────────────────────────────────────────┘
```

---

## Starting the REPL

```bash
# Linux/Mac
python3

# If that doesn't work
python

# Exit when done
>>> exit()
# or press Ctrl+D
```

---

## Instant Calculator

```python
# Basic math
>>> 2 + 2
4
>>> 10 - 3
7
>>> 5 * 4
20
>>> 10 / 3
3.3333333333333335
>>> 10 // 3        # Division without decimals
3
>>> 10 % 3         # Remainder
1
>>> 2 ** 8         # Power (2 to the 8th)
256

# Order of operations works
>>> 2 + 3 * 4
14
>>> (2 + 3) * 4
20
```

---

## Variables (Memory Boxes)

```python
# Store values
>>> name = "Alex"
>>> age = 25
>>> height = 5.9

# Use them
>>> print(name)
Alex
>>> age + 5
30

# Check what's stored
>>> name
'Alex'

# Reassign
>>> age = 26
>>> age
26
```

---

## Text (Strings)

```python
# Create strings
>>> "hello"
'hello'
>>> 'hello'     # Single or double quotes
'hello'

# Combine
>>> "hello" + " " + "world"
'hello world'

# With variables
>>> name = "Sam"
>>> f"Hello, {name}"
'Hello, Sam'
>>> f"In 5 years, you'll be {age + 5}"
'In 5 years, you'll be 30'

# Repeat
>>> "ha" * 3
'hahaha'

# Length
>>> len("hello")
5

# Upper/lower
>>> "hello".upper()
'HELLO'
>>> "HELLO".lower()
'hello'

# Check contents
>>> "hello" in "hello world"
True
>>> "goodbye" in "hello world"
False

# Split into pieces
>>> "one,two,three".split(",")
['one', 'two', 'three']

# Join pieces
>>> ", ".join(["one", "two", "three"])
'one, two, three'

# Replace
>>> "hello world".replace("world", "Python")
'hello Python'

# Strip whitespace
>>> "  hello  ".strip()
'hello'
```

---

## Lists (Ordered Collections)

```python
# Create
>>> numbers = [1, 2, 3, 4, 5]
>>> names = ["Alice", "Bob", "Charlie"]
>>> mixed = [1, "two", 3.0, True]

# Access by position (starts at 0)
>>> numbers[0]
1
>>> numbers[2]
3
>>> numbers[-1]    # Last item
5

# Slice (get range)
>>> numbers[1:3]   # From position 1 up to (not including) 3
[2, 3]
>>> numbers[:2]    # First 2 items
[1, 2]
>>> numbers[2:]    # From position 2 to end
[3, 4, 5]

# Length
>>> len(numbers)
5

# Add items
>>> numbers.append(6)
>>> numbers
[1, 2, 3, 4, 5, 6]

# Insert at position
>>> numbers.insert(0, 0)    # Insert 0 at position 0
>>> numbers
[0, 1, 2, 3, 4, 5, 6]

# Remove
>>> numbers.remove(3)       # Remove first occurrence of 3
>>> numbers
[0, 1, 2, 4, 5, 6]

# Pop (remove and return)
>>> last = numbers.pop()
>>> last
6
>>> numbers
[0, 1, 2, 4, 5]

# Check if item exists
>>> 2 in numbers
True
>>> 99 in numbers
False

# Sort
>>> unsorted = [3, 1, 4, 1, 5]
>>> sorted(unsorted)
[1, 1, 3, 4, 5]
>>> unsorted.sort()    # Modifies in place
>>> unsorted
[1, 1, 3, 4, 5]

# Reverse
>>> numbers.reverse()
>>> numbers
[5, 4, 2, 1, 0]
```

---

## Loops (Do Something Multiple Times)

```python
# Loop through list
>>> for name in ["Alice", "Bob", "Charlie"]:
...     print(f"Hello, {name}")
...
Hello, Alice
Hello, Bob
Hello, Charlie

# Loop through range
>>> for i in range(5):
...     print(i)
...
0
1
2
3
4

# Loop with both index and value
>>> names = ["Alice", "Bob", "Charlie"]
>>> for index, name in enumerate(names):
...     print(f"{index}: {name}")
...
0: Alice
1: Bob
2: Charlie

# While loop
>>> count = 0
>>> while count < 3:
...     print(count)
...     count += 1
...
0
1
2
```

---

## Conditionals (Make Decisions)

```python
# If/else
>>> age = 20
>>> if age >= 18:
...     print("Adult")
... else:
...     print("Minor")
...
Adult

# If/elif/else
>>> score = 85
>>> if score >= 90:
...     print("A")
... elif score >= 80:
...     print("B")
... else:
...     print("C")
...
B

# Comparison operators
>>> 5 > 3
True
>>> 5 < 3
False
>>> 5 == 5
True
>>> 5 != 3
True
>>> 5 >= 5
True

# Logical operators
>>> True and False
False
>>> True or False
True
>>> not True
False

# Checking multiple conditions
>>> age = 25
>>> if age >= 18 and age < 65:
...     print("Working age")
...
Working age
```

---

## Dictionaries (Key-Value Pairs)

```python
# Create
>>> person = {
...     "name": "Alex",
...     "age": 25,
...     "city": "NYC"
... }

# Access values
>>> person["name"]
'Alex'
>>> person.get("name")
'Alex'
>>> person.get("country", "Unknown")   # Default if key missing
'Unknown'

# Add/modify
>>> person["email"] = "alex@example.com"
>>> person["age"] = 26

# Remove
>>> del person["city"]

# Check if key exists
>>> "name" in person
True
>>> "phone" in person
False

# Get all keys
>>> person.keys()
dict_keys(['name', 'age', 'email'])

# Get all values
>>> person.values()
dict_values(['Alex', 26, 'alex@example.com'])

# Get all items
>>> person.items()
dict_items([('name', 'Alex'), ('age', 26), ('email', 'alex@example.com')])

# Loop through
>>> for key, value in person.items():
...     print(f"{key}: {value}")
...
name: Alex
age: 26
email: alex@example.com
```

---

## Functions (Reusable Code)

```python
# Define
>>> def greet(name):
...     return f"Hello, {name}"
...

# Use
>>> greet("Alice")
'Hello, Alice'

# With multiple parameters
>>> def add(a, b):
...     return a + b
...
>>> add(5, 3)
8

# With default values
>>> def greet(name="stranger"):
...     return f"Hello, {name}"
...
>>> greet()
'Hello, stranger'
>>> greet("Bob")
'Hello, Bob'

# Multiple return values
>>> def min_max(numbers):
...     return min(numbers), max(numbers)
...
>>> minimum, maximum = min_max([1, 5, 3, 9, 2])
>>> minimum
1
>>> maximum
9
```

---

## File Operations

```python
# Read entire file
>>> content = open('file.txt').read()

# Read line by line
>>> with open('file.txt') as f:
...     for line in f:
...         print(line.strip())

# Read all lines as list
>>> lines = open('file.txt').readlines()

# Write to file (overwrites)
>>> with open('output.txt', 'w') as f:
...     f.write("Hello, file!")

# Append to file
>>> with open('output.txt', 'a') as f:
...     f.write("\nNew line")

# Check if file exists
>>> import os
>>> os.path.exists('file.txt')
True
```

---

## Common Imports

```python
# Operating system operations
>>> import os
>>> os.listdir('.')              # List files
>>> os.getcwd()                  # Current directory
>>> os.path.exists('file.txt')   # Check existence

# File paths
>>> from pathlib import Path
>>> Path('file.txt').exists()
>>> Path('.').glob('*.txt')      # Find all .txt files

# Date and time
>>> from datetime import datetime
>>> datetime.now()
>>> datetime.now().strftime("%Y-%m-%d")

# Random numbers
>>> import random
>>> random.randint(1, 10)        # Random int between 1-10
>>> random.choice(['a', 'b', 'c'])  # Random choice from list

# JSON
>>> import json
>>> data = {'name': 'Alex', 'age': 25}
>>> json.dumps(data)             # Convert to JSON string
>>> json.loads('{"name": "Alex"}')  # Parse JSON string

# Regular expressions
>>> import re
>>> re.search(r'\d+', 'I have 42 apples')  # Find numbers
>>> re.findall(r'\d+', 'I have 42 apples and 17 oranges')

# System arguments
>>> import sys
>>> sys.argv                     # Command line arguments
```

---

## List Comprehensions (Shortcuts)

```python
# Traditional way
>>> squares = []
>>> for i in range(5):
...     squares.append(i ** 2)
>>> squares
[0, 1, 4, 9, 16]

# List comprehension way
>>> squares = [i ** 2 for i in range(5)]
>>> squares
[0, 1, 4, 9, 16]

# With condition
>>> evens = [i for i in range(10) if i % 2 == 0]
>>> evens
[0, 2, 4, 6, 8]

# Transform strings
>>> names = ['alice', 'bob', 'charlie']
>>> [name.upper() for name in names]
['ALICE', 'BOB', 'CHARLIE']
```

---

## Error Handling

```python
# Try/except
>>> try:
...     result = 10 / 0
... except ZeroDivisionError:
...     result = None
...     print("Can't divide by zero!")
...
Can't divide by zero!

# Catch any error
>>> try:
...     risky_operation()
... except Exception as e:
...     print(f"Error: {e}")

# Multiple exceptions
>>> try:
...     # risky code
... except FileNotFoundError:
...     print("File not found")
... except PermissionError:
...     print("No permission")
```

---

## Useful Built-in Functions

```python
# Type checking
>>> type(42)
<class 'int'>
>>> type("hello")
<class 'str'>
>>> isinstance(42, int)
True

# Conversion
>>> int("42")
42
>>> str(42)
'42'
>>> float("3.14")
3.14
>>> list("hello")
['h', 'e', 'l', 'l', 'o']

# Min/Max/Sum
>>> min([1, 5, 3])
1
>>> max([1, 5, 3])
5
>>> sum([1, 2, 3, 4])
10

# All/Any
>>> all([True, True, True])
True
>>> all([True, False, True])
False
>>> any([False, False, True])
True

# Zip (combine lists)
>>> names = ['Alice', 'Bob']
>>> ages = [25, 30]
>>> list(zip(names, ages))
[('Alice', 25), ('Bob', 30)]

# Map (apply function to all)
>>> list(map(str.upper, ['a', 'b', 'c']))
['A', 'B', 'C']

# Filter
>>> list(filter(lambda x: x > 5, [1, 6, 3, 8, 2]))
[6, 8]
```

---

## Quick Debugging

```python
# Print type and value
>>> x = "hello"
>>> print(f"{type(x)}: {x}")
<class 'str'>: hello

# Print variables during loop
>>> for i, item in enumerate(['a', 'b', 'c']):
...     print(f"Index {i}: {item}")
...
Index 0: a
Index 1: b
Index 2: c

# See all attributes/methods
>>> dir(str)
[... lots of methods ...]

# Get help
>>> help(str.upper)
Help on method_descriptor:

upper(self, /)
    Return a copy of the string converted to uppercase.

# Inspect object
>>> x = [1, 2, 3]
>>> type(x)
<class 'list'>
>>> dir(x)
['append', 'clear', 'copy', ...]
>>> len(x)
3
```

---

## Save Your REPL Session

```python
# Save experiments to file
>>> def save_to_file(content, filename):
...     with open(filename, 'w') as f:
...         f.write(content)
...
>>> save_to_file("my experimental code", "experiment.py")

# Or manually:
# Just copy-paste from REPL into a .py file
```

---

## REPL Productivity Tips

### Multi-line Editing
```python
# Press Enter on empty line to execute
>>> def my_function():
...     print("line 1")
...     print("line 2")
...                          ← Press Enter here
>>>
```

### Recall Last Output
```python
>>> 2 + 2
4
>>> _ + 5        # _ holds last result
9
```

### History Navigation
```
↑ (Up Arrow)     → Previous command
↓ (Down Arrow)   → Next command
Ctrl+R           → Search command history
```

### Clear Screen
```python
>>> import os
>>> os.system('clear')    # Linux/Mac
>>> os.system('cls')      # Windows
```

---

## Common Error Messages (Decoded)

```
NameError: name 'x' is not defined
→ You used variable 'x' before creating it
→ Fix: Create it first: x = something

SyntaxError: invalid syntax
→ Typo or wrong Python syntax
→ Fix: Check parentheses, colons, quotes

IndentationError: unexpected indent
→ Spaces/tabs are wrong
→ Fix: Make indentation consistent

TypeError: unsupported operand type(s)
→ Mixed incompatible types
→ Fix: "5" + 5 → int("5") + 5 or "5" + str(5)

IndexError: list index out of range
→ Tried to access position that doesn't exist
→ Fix: Check list length with len()

KeyError: 'key'
→ Dictionary doesn't have that key
→ Fix: Use .get() or check with 'key' in dict

FileNotFoundError
→ File doesn't exist at that path
→ Fix: Check path, use os.path.exists()
```

---

## One-Liners (Copy-Paste Ready)

```python
# Current date/time
from datetime import datetime; datetime.now().strftime("%Y-%m-%d %H:%M")

# List all .txt files
import os; [f for f in os.listdir('.') if f.endswith('.txt')]

# Read file as list of lines
open('file.txt').read().splitlines()

# Count word frequency
from collections import Counter; Counter("hello world".split())

# Quick HTTP request
import urllib.request; urllib.request.urlopen('http://example.com').read()

# Generate random password
import random, string; ''.join(random.choices(string.ascii_letters + string.digits, k=12))

# Flatten nested list
[item for sublist in [[1,2],[3,4]] for item in sublist]

# Remove duplicates
list(set([1, 2, 2, 3, 3, 3]))

# Sort dict by value
sorted({'a': 3, 'b': 1, 'c': 2}.items(), key=lambda x: x[1])
```

---

## Neurodivergent-Specific Tips

### ADHD: Quick Wins
```python
# Set timer before starting
import time
start = time.time()
# ... do stuff ...
print(f"That took {time.time() - start:.2f} seconds")

# Visual progress indicator
for i in range(100):
    if i % 10 == 0:
        print(f"Progress: {i}%")
```

### Dyslexia: Readable Code
```python
# Use descriptive names (easier than memorizing)
user_age = 25  # ✓ Good
ua = 25        # ✗ Hard to remember

# Comment for future you
# I tried using filter() but it was confusing
# This loop is clearer:
results = []
for item in items:
    if item > 5:
        results.append(item)
```

### Autism: Systematic Experimentation
```python
# Document your experiments
"""
Experiment: Testing string methods
Date: 2025-01-15
Goal: Understand .split() behavior
"""

test_cases = [
    "hello world",
    "hello,world",
    "hello  world",  # Double space
]

for case in test_cases:
    print(f"Input: '{case}'")
    print(f"Output: {case.split()}")
    print()
```

---

## When Stuck in REPL

```
1. Type the thing that confuses you
2. See what it returns
3. Use dir() to see what it can do
4. Use help() to learn more
5. Try variations
6. Google the exact error
7. Take a break
8. Come back fresh
```

---

## Exit Strategies

```python
# Normal exit
>>> exit()

# Keyboard shortcut
Ctrl+D

# Force quit if frozen
Ctrl+C

# If completely stuck
Close terminal, open new one
(Nothing permanent is lost in REPL)
```

---

**Print this. Keep it visible. Ctrl+F to search.**

*The REPL is your experimentation playground. Nothing breaks permanently. Try everything.*
