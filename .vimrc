" Vim Config

" General
syntax on				" enable syntax highlighting
set showcmd				" show commands
set hidden				" allows you to open new files and hide the currently open one

" Visual
colorscheme peachpuff	" set peachpuff as the default colorscheme
set number				" show line numbers
set cursorline			" highlight current line
set showmatch			" highlight matching [{()}]
set ruler				" show current position

" Tabs and text
set tabstop=4			" number of visual spaces per TAB
set wrap				" wrap lines
set autoindent			" auto indent

" Search
set incsearch			" search as characters are entered (incremental search)
set hlsearch			" highlight matches
set ignorecase			" include matching uppercase words with lowercase search term
set smartcase			" include only uppercase words with uppercase search term

" Mappings
nnoremap <leader><space> :nohlsearch<CR>
