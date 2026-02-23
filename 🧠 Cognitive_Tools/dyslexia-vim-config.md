# Vim / Neovim for Dyslexic Users

Configuration that makes vim and neovim genuinely usable
when text tracking, letter reversal, and visual crowding
are part of how your brain works.

Built from lived experience. Not a workaround — an optimisation.

---

## The Quick Config

Add this to your `~/.vimrc` or `~/.config/nvim/init.vim`:

```vim
" ═══════════════════════════════════════════════════
" DYSLEXIA-FRIENDLY VIM CONFIG
" ═══════════════════════════════════════════════════

" --- READABILITY ---

" Increase line spacing — letters need room to breathe
set linespace=6

" Highlight the line you're on — easier to track
set cursorline

" Relative line numbers — easier to navigate by feel
set number
set relativenumber

" Wrap long lines — never scroll sideways
set wrap
set linebreak          " break at words, not mid-word
set breakindent        " keep indentation on wrapped lines

" Bigger scrolloff — keep context above and below cursor
set scrolloff=8

" --- SPELLING ---

" Enable spell check (English by default)
set spell
set spelllang=en_gb     " change to en_us if needed

" Make misspellings visible but not aggressive
highlight SpellBad cterm=underline ctermfg=red gui=undercurl guisp=red
highlight SpellCap cterm=underline ctermfg=blue

" Easy spell fix — press ctrl+s on a misspelled word
" z= shows suggestions, ]s moves to next error
nnoremap <C-s> z=

" --- VISUAL CLARITY ---

" High contrast colour scheme — easier letter discrimination
" Options: desert, elflord, industry, murphy, torte
" Pick the one that feels most readable to you
colorscheme desert

" Show matching brackets — spatial anchoring
set showmatch

" Always show the status line — know where you are
set laststatus=2

" Show partial commands being typed
set showcmd

" --- REDUCE COGNITIVE LOAD ---

" Auto-save when you leave insert mode or switch windows
" Stops the "did I save?" mental overhead
autocmd InsertLeave * silent! write
autocmd BufLeave * silent! write

" Confirm before closing unsaved — no surprise data loss
set confirm

" Undo history — 200 steps back if you need them
set undolevels=200

" No swap files — they create confusing messages
set noswapfile

" Keep undo history between sessions (neovim only)
if has('nvim')
    set undofile
    set undodir=~/.config/nvim/undo
endif

" --- SEARCH ---

" Highlight search matches — easier to track
set hlsearch
set incsearch          " show matches as you type

" Case insensitive unless you use capitals
set ignorecase
set smartcase

" Clear highlights with enter
nnoremap <CR> :nohlsearch<CR>

" --- SHORTCUTS FOR DYSLEXIC WORKFLOWS ---

" Read mode — max width 80 chars, centred, no distractions
" Toggle with ,r
nnoremap ,r :set columns=80<CR>:set textwidth=80<CR>ggVGgq<CR>

" Increase font size (GUI vim only)
nnoremap <C-=> :let &guifont = substitute(&guifont, ':h\(\d*\)', '\=":h".(submatch(1)+1)', '')<CR>
nnoremap <C--> :let &guifont = substitute(&guifont, ':h\(\d*\)', '\=":h".(submatch(1)-1)', '')<CR>

" ═══════════════════════════════════════════════════
" END DYSLEXIA CONFIG
" ═══════════════════════════════════════════════════
```

---

## Font

The most impactful single change: **OpenDyslexic** or **OpenDyslexicMono**.

For GUI vim / neovim with a GUI frontend:
```vim
set guifont=OpenDyslexicMono:h14
```

For terminal vim: set the font in your terminal emulator instead.
If you use Kitty, see the [Terminal Setup guide](../🖥️%20Terminal_Setup/README.md).

---

## Neovim Extra: Which Colour Schemes Help

High contrast schemes that reduce visual crowding:

| Scheme | Works well for |
|---|---|
| `everforest` (plugin) | Soft contrast, warm greens |
| `gruvbox` (plugin) | High contrast, very readable |
| `catppuccin-mocha` (plugin) | Clear syntax distinction |
| Built-in `desert` | Always available, good contrast |
| Built-in `industry` | Dark, clean |

Install via your plugin manager (lazy.nvim, vim-plug, etc.)

---

## Navigation That Works With Dyslexic Spatial Memory

Instead of remembering line numbers, use marks:

```vim
" Place a mark on a line:  ma  (mark 'a')
" Jump back to it:         'a

" Jump between paragraphs (often easier than line numbers)
{   " go to previous blank line
}   " go to next blank line

" Jump between words
w   " next word
b   " back a word
e   " end of current word
```

---

## The Hardest Part — Getting Started

Vim has a steep learning curve that is genuinely harder with dyslexia
because the commands are not phonetically obvious.

`d` does not mean "delete what I select" — it's a motion prefix.
`y` does not mean "yank" to most people's brains.

**Reframe the vocabulary:**

| Vim term | Think of it as |
|---|---|
| yank `y` | grab |
| delete `d` | cut |
| put `p` | place |
| change `c` | swap |
| visual `v` | select |

Write your own cheat sheet in words that make sense to you.
Pin it next to the screen. Use it for 2 weeks.
Then you won't need it.

---

## Alternatives Worth Knowing

If vim's modal editing genuinely doesn't work for how your brain works,
these editors are designed with lower cognitive friction:

- **Helix** — vim-like but shows you what's possible at each step
- **Micro** — terminal editor with familiar Ctrl+S, Ctrl+Z shortcuts
- **nano** — always available, commands shown on screen at all times

There is no shame in choosing the tool that works.
