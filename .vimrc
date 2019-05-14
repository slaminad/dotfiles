" Vim Config

" General
syntax on				" enable syntax highlighting
set showcmd				" show commands
set hidden				" allows you to open new files and hide the currently open one

" Visual
colorscheme peachpuff	" set peachpuff as the default colorscheme
set number				" show line numbers
set relativenumber		" show relative line numbers
set cursorline			" highlight current line
set showmatch			" highlight matching [{()}]
set ruler				" show current position

" Tabs and text
set tabstop=4			" width of a TAB
set wrap				" wrap lines
set autoindent			" auto indent
set wildmenu			" auto-completion

" Search
set incsearch			" search as characters are entered (incremental search)
set hlsearch			" highlight matches
set ignorecase			" include matching uppercase words with lowercase search term
set smartcase			" include only uppercase words with uppercase search term

" Mappings
nnoremap <leader><space> :nohlsearch<CR>

" Plugins - currently using: vim-plug
call plug#begin('~/.vim/plugs')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }	" Vim-Go - Go plugin for Vim
Plug 'vim-airline/vim-airline'						" Vim Airline - statusline

call plug#end()
