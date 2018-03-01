call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-ragtag'
Plug 'Valloric/MatchTagAlways'
Plug 'enricobacis/paste.vim'

Plug 'tpope/vim-endwise'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
call plug#end()

fun! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()
autocmd! FileType fzf tnoremap <buffer> jk <c-c>

let g:mapleader=','
let g:user_emmet_leader_key='<leader>e'
let g:NERDTreeIgnore = ['node_modules']

no <leader>r :source %<cr>

no <silent> <cr> :nohl<cr>

no j gj
no k gk

ino jk <esc>
cno jk <esc>
vno ;; <esc>
tno jk <c-\><c-n>

ino <c-a> <c-o>^
ino <c-e> <c-o>$

no <leader>c "+y
no <leader>v "+p
vno <leader>c "+y
vno <leader>v "+p

nno <c-h> <c-w><c-h>
nno <c-j> <c-w><c-j>
nno <c-k> <c-w><c-k>
nno <c-l> <c-w><c-l>

nno <leader>t :NERDTreeToggle<CR>
map <c-p> :FZF<cr>
map <leader>b :Buffer<cr>

set encoding=utf-8
set number
set relativenumber
set pastetoggle=<F3>
set clipboard=unnamedplus
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:›\ ,trail:•,eol:¬
set ignorecase
set cursorline
set cursorcolumn
set title
set nobackup
set noswapfile
set nowritebackup
set splitbelow
set splitright
set background=dark
colorscheme gruvbox
