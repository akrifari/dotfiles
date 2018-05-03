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
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'henrik/vim-indexed-search'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'lilydjwg/colorizer'
" Plug 'airblade/vim-gitgutter'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'

Plug 'chr4/nginx.vim'
call plug#end()

" space trailing
fun! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

autocmd! FileType fzf tnoremap <buffer> jk <c-c>

let g:mapleader = ','

" gruvbox
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'

" emmet
let g:user_emmet_leader_key = '<leader>e'

" nerdtree
let g:NERDTreeIgnore = ['node_modules']

" ultisnips
let g:UltiSnipsListSnippets = '<leader>sl'
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/snips', 'snips', 'UltiSnips']

" fzf
let $FZF_DEFAULT_COMMAND = 'ag --ignore-dir "node_modules" -g ""'

" deoplete
let g:deoplete#enable_at_startup = 1

let g:colorizer_startup = 0

" key mapping
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

no <leader>d /\.\.\.<cr>

nno <c-h> <c-w><c-h>
nno <c-j> <c-w><c-j>
nno <c-k> <c-w><c-k>
nno <c-l> <c-w><c-l>

map J :bp<cr>
map K :bn<cr>

nno <leader>t :NERDTreeToggle<cr>

map <c-p> :FZF<cr>
map <leader>b :Buffer<cr>

map <leader>c :ColorToggle<cr>

" settings
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
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}\ %(%l,%c%V%)
colorscheme gruvbox
