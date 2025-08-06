" Minimal Neovim configuration

" Hide splash screen
set shortmess+=I

" Essential settings
set number          " Show line numbers
set mouse=a         " Enable mouse
set expandtab       " Use spaces instead of tabs
set tabstop=2       " 2 spaces for tab
set shiftwidth=2    " 2 spaces for indentation
set ignorecase      " Case insensitive search
set smartcase       " Unless capital letters are used
set hlsearch        " Highlight search results
set incsearch       " Search as you type

" Leader key
let mapleader=","