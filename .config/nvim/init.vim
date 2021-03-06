" Vim Config

" General
syntax on				" enable syntax highlighting
set showcmd				" show commands
set hidden				" allows you to open new files and hide the currently open one
set wildmenu			" auto-completion for commands
set autoread			" autoload file changes

" Visual
set number				" show line numbers
set relativenumber		" show relative line numbers
set cursorline			" highlight current line
set showmatch			" highlight matching [{()}]
set ruler				" show current position
set laststatus=2		" always show status bar
set scrolloff=1         " always show at least 1 line above/below the cursor

" Tabs and text
set tabstop=4			" width of a TAB
set shiftwidth=4		" set TAB width when using >
set wrap				" wrap lines
set autoindent			" auto indent

" Search
set incsearch			" search as characters are entered (incremental search)
set hlsearch			" highlight matches
set ignorecase			" include matching uppercase words with lowercase search term
set smartcase			" include only uppercase words with uppercase search term

" File specific formatting
autocmd Filetype yaml,yml setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype text setlocal noexpandtab linebreak showbreak=...\ 

" Mappings
" clear search highlighting
nnoremap <leader><space> :nohlsearch<CR>
" toggle listing invisible characters
nnoremap <leader>l :set list!<CR>
" toggle numbers/relative numbers
nnoremap <leader>n :set number! relativenumber!<CR>

" Helps setup auto install for vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()
