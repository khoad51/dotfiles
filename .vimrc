vim9script

# ---------------------------- #
# ----- General settings ----- #
# ---------------------------- #

# Disable compatibility with vi which can cause unexpected issues.
set nocompatible

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

# Auto copy indent and auto read file change
set autoindent
set autoread

# Allow backspacing over listed items and belloff
set backspace=indent,eol,start
set belloff=all

# List of string that can start a comment line
set comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-,fb:•
set commentstring=

# Scan to put in completion
set complete=.,w,b,u,t
set define=

# Characters to fill the statuslines
set fillchars=
set display=lastline

# Sequence of letters which describes how automatic formatting is to be done
set formatoptions=tcqj

# Program to use for the :grep command
set grepprg=rg\ --vimgrep\ -uu
set path=.,,

# Set default indentation
set expandtab
set smarttab
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
set sidescroll=1

# Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap
set nocp

# Searching
set incsearch
set hlsearch
set matchpairs+=<:>
set ignorecase
set smartcase

# Pattern to be used to find an include command
set include=
set nojoinspaces

# The characters specified by this option are included in file names and path names
set isfname=@,48-57,/,.,-,_,+,,,#,$,%,~,=
set nolangremap

# Enable mouse interaction
set mouse=a
set mousemodel=popup_setpos

# Limit command height to 1 line
set cmdheight=1
set nopaste

# Show several useful info
set showcmd
set noshowmode
set showmatch

# Strings to use in list mode
set listchars=tab:>\ ,trail:-,nbsp:+
set nrformats=bin,hex

# Changes the effect of the :mksession command
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,terminal

# This option helps to avoid all the hit-enter prompts caused by file messages
set shortmess=ltToOCF

# The cursor is kept in the same column
set nostartofline

# Filenames for the tag command
set tags=./tags;,tags

# This option controls the behavior when switching between buffers
set switchbuf=uselast
set tabpagemax=50

# Get rid of scratch buffer
set completeopt-=preview
set ttimeout
set ttimeoutlen=50

# Changes the effect of the :mkview command
set viewoptions=folds,cursor,curdir

# Enable auto completion menu after pressing TAB.
set wildmenu
set wildoptions=pum,tagfile
set wildmode=list:longest

# Set the commands to save in history default number is 20.
set history=10000
set ttyfast

# Colorscheme
set background=dark

# Set statusline last status
set laststatus=2

# ------------------- #
# ----- Keymaps ----- #
# ------------------- #

# Dismiss highlight
nnoremap ~ :noh<cr>

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

# Print current file path
nnoremap <leader>I :echo @%<cr>

# Copy marked text/paste to/from global register
vnoremap <leader>y "+y
nnoremap <leader>p "+p

# Difftool kemaps
nnoremap <leader>dp :diffput 2<cr>
nnoremap <leader>dl :diffget 1<cr>
nnoremap <leader>dr :diffget 3<cr>

# Show current line git annotate
def ShowGitAnnotate(): void
  var line = line('.')
  var file = expand('%:p')
  var format = " | cut -d' ' -f1,2,3 | tr '(' ' '"
  echo system('git annotate -L ' .. line .. ',' .. line .. ' ' .. file .. format)
enddef
nnoremap <leader>B :call ShowGitAnnotate()<cr>

defcompile
