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
Plugin 'kana/vim-textobj-user'

" ruby
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'
Plugin 'nelstrom/vim-textobj-rubyblock'

" javascript
Plugin 'pangloss/vim-javascript'
"
" go
Plugin 'fatih/vim-go'
call vundle#end()

filetype plugin indent on

" ruby block dependencies
runtime macros/matchit.vim

" remove unnecessary whitespace
fun! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

" airline
" let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1
let g:airline_theme = "lucius"

" ctrlp
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40
let g:ctrlp_prompt_mappings = { 'PrtExit()' : ['<ESC>', '<C-c>'] }

" nerd tree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" vim-go
let g:go_fmt_autosave=1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1

" starts nerd tree when opening directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" quit vim if nerdtree is active buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" filetype filter
let g:user_emmet_leader_key='<leader>e'
autocmd BufNewFile,Bufread *.html.erb set filetype=html
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

" theme
syntax on
set t_Co=256
set background=dark
colorscheme gruvbox

" encoding utf-8
set encoding=utf-8

" display all matching pattern in command mode
set wildmenu

" line number (relative)
set relativenumber
set number

" search
set ignorecase
set incsearch
set hlsearch

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
set timeoutlen=500 ttimeoutlen=0

" eol
set list listchars=tab:\ \ ,trail:•,eol:¬

" window split
set splitbelow
set splitright

" leader key
let mapleader = ","

" remove backup files
set nobackup
set nowritebackup
set noswapfile

" highlight row & column
set cursorcolumn
set cursorline

" copy content to clipboard
set clipboard=unnamedplus
vno <C-c> "+y

" escape key
ino jk <ESC>
vno ;; <ESC>

" window
map <C-h> <C-w><C-h>
map <C-j> <C-w><C-j>
map <C-k> <C-w><C-k>
map <C-l> <C-w><C-l>
map <leader>wc <C-w><C-c>

" visual block
no <leader>q <C-v>

" buffer
map <leader>ls :ls<CR>
map <silent> <S-j> :bp<CR>
map <silent> <S-k> :bn<CR>
map <silent> <leader>d :bd<CR>
map <leader>bl :CtrlPBuffer<CR>

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

" select all
no <C-a> ggVG

" paragraph navigation
no j gj
no k gk

" surround 'til end of words
map <leader>ste ys$

" clear highlight after searching some pattern
no <silent><CR> :noh<CR>

" vimrc
map <leader>vim :e $MYVIMRC<CR>
map <leader>sm :source $MYVIMRC<CR>

" toggle side bar
map <leader>t :NERDTreeToggle<CR>

" vim-go
map <leader>gr :GoRun<CR>

" goyo
map <leader>,g :Goyo<CR>

" reset ctrlp
no <leader>r :CtrlPClearCache<CR>
