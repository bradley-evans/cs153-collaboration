set nocompatible
execute pathogen#infect()
Helptags
filetype plugin indent on
syntax enable
let g:airline#extensions#tabline#enabled = 1
set encoding=utf-8
set guifont=Powerline\ Consolas:s12
let g:Powerline_symbols = 'fancy'
set termencoding=utf-8

let g:airline_powerline_fonts = 1
let g:airline_theme = 'zenburn'

"set term=xterm
"let &t_AB="\e[48;5;%dm"
"let &t_AF="\e[38;5;%dm"

if !exists('g:airline_symbols')
	    let g:airline_symbols = {}
    endif

    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.whitespace = 'Ξ'
    
    " airline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''

set keywordprg=":help"

set autoindent
set backspace=indent,eol,start

set ttimeout
set ttimeoutlen=50

set incsearch
set hlsearch

" show line numbers
set number

set laststatus=2

let mapleader = ","
let g:mapleader = ","

nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> <leader>DD :exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
nnoremap <silent> <leader>DP :exe ":profile pause"<cr>
nnoremap <silent> <leader>DC :exe ":profile continue"<cr>
nnoremap <silent> <leader>DQ :exe ":profile pause"<cr>:noautocmd qall!<cr>
