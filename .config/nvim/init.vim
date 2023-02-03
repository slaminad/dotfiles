" Vim Config

" General
syntax on               " enable syntax highlighting
set showcmd             " show commands
set hidden              " allows you to open new files and hide the currently open one
set wildmenu            " auto-completion for commands
set autoread            " autoload file changes
set mouse=              " disable mouse mode

" Visual
set number              " show line numbers
set relativenumber      " show relative line numbers
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set ruler               " show current position
set laststatus=2        " always show status bar
set scrolloff=1         " always show at least 1 line above/below the cursor

" Tabs and text
set tabstop=4                   " width of a TAB
set shiftwidth=4                " set TAB width when using >
set smarttab                    " smartly inserts tabs according to tabstop and shiftwidth
set wrap                        " wrap lines
set autoindent                  " auto indent
set backspace=indent,eol,start  " allow backspacing over autoindent, linebreaks, and start of insert

" Search
set incsearch           " search as characters are entered (incremental search)
set hlsearch            " highlight matches
set ignorecase          " include matching uppercase words with lowercase search term
set smartcase           " include only uppercase words with uppercase search term

" Highlighting (hi)
" make MatchParen (%) more clear which one the cursor is at
hi MatchParen ctermbg=8 guibg=DarkGray
" make non-text (such as extra spaces at EOL) red
hi NonText ctermfg=1 guibg=Red

" File specific formatting
autocmd Filetype yaml,yml setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype text setlocal noexpandtab linebreak showbreak=...\

" Mappings
" change <leader> key to spacebar
nnoremap <SPACE> <Nop>
let mapleader = " "
" <Leader> <Space> - clear search highlighting
nnoremap <leader><space> :nohlsearch<CR>
" <Leader> l - toggle listing invisible characters
nnoremap <leader>l :set list!<CR>
" <Leader> n - toggle numbers/relative numbers
nnoremap <leader>n :set number! relativenumber!<CR>

" ============================================
" This section is all plugin configurations
" ============================================

" Helps setup auto install for vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yggdroot/indentline'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" FZF settings
" <Leader> f - :Files
nmap <leader>f :Files<CR>

" Indentline settings
" Set color
let g:indentLine_setColors = 242
" Disable by default
let g:indentLine_enabled = 0
" <Leader> y - toggle indentLine (for yaml)
autocmd FileType yaml,yml nmap <leader>y :silent! IndentLinesToggle<CR>

" Lightline colorscheme
let g:lightline = {'colorscheme': 'one'}

" Vim-go settings
" Prefer goimports over gofmt
let g:go_fmt_command = "goimports"
" Experimental mode
let g:go_fmt_experimental = 1
" only show quickfix list instead of quickfix + location
let g:go_list_type = "quickfix"

" Vim-go keybinds
" <Leader> i - :GoInfo
autocmd FileType go nmap <Leader>i <Plug>(go-info)
" <Leader> t - :GoTest
autocmd FileType go nmap <leader>t <Plug>(go-test)
" <Leader> r - :GoRun
autocmd FileType go nmap <leader>r <Plug>(go-run)
" <Leader> b - :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
