syntax on
filetype plugin indent on

let mapleader=" "

" window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" save / quit
map  <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>
map  <Leader>w :w<CR>
map  <Leader>q :q<CR>

" exit insert mode
imap jk <Esc>

" settings
set nocompatible
set noswapfile
set nobackup
set number
set nowrap
set mouse=a
set clipboard=unnamed
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
set laststatus=2
set encoding=utf-8

colorscheme elflord

" strip trailing whitespace on save
fun! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call StripTrailingWhitespaces()
