vim9script

# ----------------------- #
# ----- Init set-up ----- #
# ----------------------- #

# Disable compatibility with vi which can cause unexpected issues.
set nocompatible

# ---------------------------- #
# ----- General settings ----- #
# ---------------------------- #

# Re-map leader key
nnoremap <space> <nop>
g:mapleader = ' '

# Encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
lang en_US.UTF-8

# Enable type file detection
filetype on
filetype plugin on

# Load an indent file for the detected file type.
filetype indent on

# Turn syntax highlighting on.
syntax enable

# Add numbers to each line on the left-hand side.
set number
set ruler
set hidden

# Set default indentation
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set shiftround

# Do not save temporary files.
set nobackup
set noswapfile

# Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10
set splitbelow

# Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap
set nocp

# Searching
set incsearch
set hlsearch
set matchpairs+=<:>
set ignorecase
set smartcase

# Enable mouse interaction
set ma
set mouse=a

# Limit command height to 1 line
set cmdheight=1
set nopaste

# Show several useful info
set showcmd
set noshowmode
set showmatch

# Get rid of scratch buffer
set completeopt-=preview

# Enable auto completion menu after pressing TAB.
set wildmenu
set wildmode=list:longest

# Set the commands to save in history default number is 20.
set history=10000

# -------------- #
# ----- UI ----- #
# -------------- #

# Colorscheme
set background=light

# Set statusline last status
set laststatus=2

# Mode dictionary
const modes = {
  'n': 'NORMAL',
  'no': 'NORMAL',
  'v': 'VISUAL',
  'V': 'VISUAL LINE',
  '': 'VISUAL BLOCK',
  's': 'SELECT',
  'S': 'SELECT LINE',
  '': 'SELECT BLOCK',
  'i': 'INSERT',
  'ic': 'INSERT',
  'R': 'REPLACE',
  'Rv': 'VISUAL REPLACE',
  'c': 'COMMAND',
  'cv': 'VIM EX',
  'ce': 'EX',
  'r': 'PROMPT',
  'rm': 'MOAR',
  'r?': 'CONFIRM',
  '!': 'SHELL',
  't': 'TERMINAL',
}

# Active statusline
def g:ActiveStatusline(): string
  var sl = '%#Stress# '
  sl ..= modes[mode()]
  sl ..= '%#Normal#'
  sl ..= ': '
  sl ..= '%f'
  sl ..= '%='
  sl ..= '%m'
  sl ..= '%y'
  sl ..= ' - '
  sl ..= '%{strlen(&fenc)?&fenc:"none"}'
  sl ..= '|'
  sl ..= '%l'
  sl ..= ':'
  sl ..= '%c'
  sl ..= ' '
  return sl
enddef

# Inactive statusline
def g:InactiveStatusline(): string
  return '%#Blur# %f%=%L '
enddef

# Minimal statusline
def g:MinimalStatusline(): string
  return '%#Blur# %y '
enddef

# Set active and inactive status line style
hi Normal ctermbg=NONE guibg=NONE
hi Stress cterm=bold ctermbg=NONE gui=bold guibg=NONE
hi Blur ctermbg=NONE ctermfg=grey guibg=NONE guifg=grey

augroup statusline
au!
au WinEnter,BufEnter * setlocal statusline=%!ActiveStatusline()
au WinLeave,BufLeave * setlocal statusline=%!InactiveStatusline()
au WinEnter,BufEnter,FileType netrw setlocal statusline=%!MinimalStatusline()
augroup END


# ------------------- #
# ----- Keymaps ----- #
# ------------------- #

# Remap escape key in insert mode
inoremap <silent> jk <esc>

# Dismiss highlight
nnoremap \| :noh<cr>

# Remap c-w prefix
nnoremap <silent> <leader>w <c-w>

# Remap switch region keys
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l

# Re-size split windows using arrow keys
nnoremap <silent> <up> :resize -2<cr>
nnoremap <silent> <down> :resize +2<cr>
nnoremap <silent> <left> :vertical resize +2<cr>
nnoremap <silent> <right> :vertical resize -2<cr>

# Search current marked text
vnoremap // y/\V<c-r>=escape(@",'/\')<cr><cr>
vnoremap <leader>/ y/\V<c-r>=escape(@",':Rg')<cr><cr>

# Copy marked text/paste to/from global register
vnoremap <leader>y "+y
nnoremap <leader>p "+p

# Difftool kemaps
nnoremap <leader>dp :diffput 2<cr>
nnoremap <leader>dl :diffget 1<cr>
nnoremap <leader>dr :diffget 3<cr>

# --------------------- #
# ----- Utilities ----- #
# --------------------- #

# Netrw config and mapping
hi! link netrwMarkFile Search
hi CursorLine ctermbg=NONE guibg=NONE
g:netrw_liststyle = 0

# Sync current directory and browsing directory
# This solves the problem with the 'move' command
g:netrw_keepdir = 0

# A better copy command
g:netrw_localcopydircmd = 'cp -r'

# Toggle netrw and focus file
nnoremap <leader>e :Explore<cr>
nnoremap <leader>E :Explore %:p:h<cr>

# Remap key inside netrw buffer
def NetrwMapping(): void
  # cancel browsing
  nmap <buffer> <silent> E :Rexplore<cr>

  # Go back in history
  nmap <buffer> H u

  # Go up a directory
  nmap <buffer> h -^

  # Go down a directory / open file
  nmap <buffer> l <CR>

  # Toggle the mark on a file
  nmap <buffer> x mf

  # Unmark all files
  nmap <buffer> X mu

  # Create a file
  nmap <buffer> a %:w<cr>:buffer #<cr>

  # Copy marked files
  nmap <buffer> y mc

  # Move marked files
  nmap <buffer> p mm

  # Set the directory under the cursor as the current target
  nmap <buffer> t mtfq

  # Show the list of marked files
  nmap <buffer> ex :echo join(netrw#Expose('netrwmarkfilelist'), #\n#)<cr>

  # Show the current target directory
  nmap <buffer> et :echo 'Target:' . netrw#Expose('netrwmftgt')<cr>
enddef

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup end

defcompile
