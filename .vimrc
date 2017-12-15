" plugin manager
set nocompatible
filetype off

" vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" core plugins
Plugin 'VundleVim/Vundle.vim'

" utility
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'godlygeek/tabular'
Plugin 'mattn/emmet-vim'
Plugin 'airblade/vim-gitgutter'

" ruby
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'

" javascript
Plugin 'pangloss/vim-javascript'
call vundle#end()
filetype plugin indent on

" remove unnecessary whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

" airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme="term"

" ctrlp
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40

" side bar
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" show hidden files
let NERDTreeShowHidden=1

" open nerdtree automatically if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" starts nerd tree when opening directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" quit vim if nerdtree is active buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" emmet filetype filter
let g:user_emmet_leader_key='<tab>'
autocmd BufNewFile,Bufread *.html.erb set filetype=html

" theme
syntax on
set background=dark
colorscheme gruvbox

" encoding utf-8
set encoding=utf-8

" display all matching file when we tab complete
set wildmenu

" line number (relative)
set relativenumber
set number

" search
set ignorecase
set incsearch

" indent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

" status bar
set laststatus=2

" font
set guifont=Meslo\ LG\ M\ Bold\ for\ Powerline\ 20

" speed up escaping
set timeoutlen=350 ttimeoutlen=0

" eol
set list listchars=eol:¬

" window split
set splitbelow
set splitright

" leader key
let mapleader = ","

" remove backup files
set nobackup
set nowritebackup

" escape key
ino jk <ESC>

" awesome window movement
map <C-h> <C-w><C-h>
map <C-j> <C-w><C-j>
map <C-k> <C-w><C-k>
map <C-l> <C-w><C-l>

" visual block
no <leader>q <C-v>

" buffer control
map <S-j> :bp<CR>
map <S-k> :bn<CR>
map <leader>d :bd<CR>

" toggle paste
map <F3> :set paste!<CR>

" beginning and end of line
imap <c-a> <c-o>^
imap <c-e> <c-o>$

" substitute to text region
vno <leader>s :s/\%V

" moving code blocks
vno < <gv
vno > >gv

" toggle side bar
map <leader>t :NERDTreeToggle<CR>

" list files opened in buffer
map <leader>b :CtrlPBuffer<CR>

" open vimrc
map <leader>vim :e $MYVIMRC<CR>

" surround 'til end of words
map <leader>ste ys$
