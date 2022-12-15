syntax on
set number
set mouse=a
set clipboard=unnamed
set showcmd
set ruler
set encoding=utf8
set showmatch
set sw=4
set relativenumber
let mapleader = " "
set laststatus=2
set guioptions-=T
set backspace=indent,eol,start
set tabstop=4


imap jk <Esc>

nmap <leader>so :source $HOME_\_vimrc<CR>
nmap <leader>w :w <CR>
nmap <leader>q :q <CR>


call plug#begin('~/.vim/plugged')

"NerdTree
Plug 'preservim/nerdtree'
"Auto Pairs
Plug 'jiangmiao/auto-pairs'
"Gruvbox
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

nmap <Leader>nt :NERDTreeFind<CR>
