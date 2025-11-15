" Config simple para ventanas, buffers y NERDTree

set nocompatible
set encoding=utf-8
set number
set relativenumber
set ruler
set showcmd
set showmatch
set mouse=a
set clipboard=unnamedplus

set ignorecase
set smartcase
set incsearch
set hlsearch

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

set hidden
set splitbelow
set splitright
set updatetime=300

let mapleader=","

" ===========================
" Manejo de ventanas
" ===========================
" Moverse entre ventanas con Ctrl + h/j/k/l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Crear splits rápido
nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>

" Cerrar ventana actual
nnoremap <leader>q :close<CR>

" Redimensionar ventanas con Ctrl + flechas
nnoremap <C-Up>    :resize +2<CR>
nnoremap <C-Down>  :resize -2<CR>
nnoremap <C-Left>  :vertical resize -3<CR>
nnoremap <C-Right> :vertical resize +3<CR>

" ===========================
" Manejo de buffers
" ===========================
nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprevious<CR>
nnoremap <leader>bl :ls<CR>
nnoremap <leader>bd :bdelete<CR>

" ===========================
" Crear carpeta (directory)
" ===========================
function! s:CreateDir()
  let l:dirname = input('Nueva carpeta: ', '', 'dir')
  if empty(l:dirname)
    return
  endif

  " -p: crea subdirectorios intermedios si hace falta
  call mkdir(l:dirname, 'p')
  echo 'Carpeta creada: ' . l:dirname
endfunction

" ,nd -> new directory
nnoremap <leader>nd :call <SID>CreateDir()<CR>


" ===========================
" Crear archivo (y carpeta si no existe)
" ===========================
function! s:CreateFile()
  let l:filename = input('Nuevo archivo: ', '', 'file')
  if empty(l:filename)
    return
  endif

  " Carpeta del archivo (si viene con ruta tipo src/main.py)
  let l:dir = fnamemodify(l:filename, ':h')

  " Si tiene carpeta y no existe, crearla
  if !empty(l:dir) && !isdirectory(l:dir)
    call mkdir(l:dir, 'p')
  endif

  " Abrir el archivo en un buffer
  execute 'edit ' . fnameescape(l:filename)
endfunction

" ,nf -> new file
nnoremap <leader>nf :call <SID>CreateFile()<CR>

" ===========================
" Plugins (vim-plug)
" ===========================
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'

" Python: mejor syntax
Plug 'vim-python/python-syntax'

" Go: plugin clásico para Go (requiere tener 'go' instalado)
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" C/C++: syntax mejorado
Plug 'octol/vim-cpp-enhanced-highlight'

" Java: syntax/ftplugin simple
Plug 'uiiaoo/java-syntax.vim'



call plug#end()

" ===========================
" NERDTree
" ===========================
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>

" Abrir NERDTree si no se pasa archivo al arrancar
autocmd VimEnter * if argc() == 0 | NERDTree | endif

" Cerrar Vim si solo queda NERDTree
autocmd BufEnter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | quit | endif

let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" ===========================
" Atajos útiles
" ===========================
nnoremap <leader>w :w<CR>
nnoremap <leader>x :wq<CR>
nnoremap <leader>/ :nohlsearch<CR>
nnoremap <leader>rn :set relativenumber!<CR>

" ===========================
" Sintaxis y colores
" ===========================
syntax on

if filereadable(expand("~/.vim/plugged/gruvbox/colors/gruvbox.vim"))
  colorscheme gruvbox
  set background=dark
endif
