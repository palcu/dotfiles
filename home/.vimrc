"=== palcu's defaults {{{
" Most of the settings are loaded from tpope/vim-sensible
" Those that appear here aretaken from pivotal/vim-config
set number " get line numbers in the gutter
set mouse=a " Use mouse support in XTerm/iTerm.
set visualbell " Suppress audio/visual error bell
set showcmd " Show typed command prefixes while waiting for operator
set expandtab " Use soft tabs
set tabstop=2 " Tab settings
set shiftwidth=2 " Width of autoindent
set scrolloff=3 " Scroll when the cursor is 3 lines from edge
set smartcase " Smart case-sensitivity when searching (overrides ignorecase)
set autowriteall " Save when doing various buffer-switching things.
set showmatch " Show matching brackets
set wildmode=list:longest " Bash-like tab completion
set swapfile " Keep swapfiles
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp
" }}}

"=== Vundle plugins setup {{{
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible' "sensible defaults
Plugin 'scrooloose/nerdtree.git' "tree I get when I press F2
Plugin 'ctrlpvim/ctrlp.vim' "ctrl+p gives me Sublime filename search
Plugin 'vim-airline/vim-airline' "nice bottom line
Plugin 'vim-airline/vim-airline-themes' "I want the solarized theme
Plugin 'SirVer/ultisnips' "snippet engine
Plugin 'honza/vim-snippets' "collection of snippets
Plugin 'altercation/vim-colors-solarized' "fancy color scheme
Plugin 'scrooloose/nerdcommenter' "the normal way of commenting stuff
call vundle#end()
filetype plugin indent on
" }}}

"=== Plugins Configuration {{{
"= vim-colors-solarized settings
set background=dark
colorscheme solarized

"= nerdtree
map \ :NERDTreeToggle<CR>
" sort capitalized files first
let g:NERDTreeCaseSensitiveSort=1

"= airline
set laststatus=2
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
let g:airline_solarized_normal_green = 1

"= utilsnips
let g:UltiSnipsExpandTrigger="<tab>"

"= NERDCommenter
" Comment/uncomment lines
map <leader>/ <plug>NERDCommenterToggle
" Pad comment delimeters with spaces
let NERDSpaceDelims = 1
" }}}

"=== Bindings {{{
let mapleader=","
set pastetoggle=<F2>
"w!! for sudo saving
cmap w!! w !sudo tee % >/dev/null
" Remove whitespace on save
autocmd BufRead,BufWritePre,FileWritePre * silent! %s/[\r \t]\+$//
" Reload .vimrc
map <leader>rv  :source ~/.vimrc<CR>
" Previous/next buffers
map <M-Left>  :bp<CR>
map <M-Right> :bn<CR>
" Open and close the quickfix window
map <leader>qo :copen<CR>
map <leader>qc :cclose<CR>
" Easy access to the shell
map <Leader><Leader> :!
" Jump to a new line in insert mode
imap <D-CR> <Esc>o
" }}}

"=== Local settings {{{
if filereadable(glob("~/.vimrclocal"))
  source ~/.vimrclocal
endif
" }}}

" vim:fdm=marker
