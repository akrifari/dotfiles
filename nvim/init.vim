call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
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
Plug 'tpope/vim-obsession'
Plug 'godlygeek/tabular'
Plug 'w0rp/ale'
Plug 'junegunn/vim-emoji'
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

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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

" vim-go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_fmt_command = "goimports"

" ale
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_sign_error = emoji#for('x')
let g:ale_sign_warning = emoji#for('large_orange_diamond')
let g:ale_set_quickfix = 1
let g:ale_set_loclist = 0
let g:ale_set_highlights = 0
let g:ale_echo_msg_format = '[%linter%] %s'

" key mapping
no <silent> <leader>r :source %<cr>
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

map <silent> J :bp<cr>
map <silent> K :bn<cr>

nno <silent><leader>t :NERDTreeToggle<cr>

nmap <silent> <c-p> :FZF<cr>
nmap <silent> <leader>b :Buffer<cr>

nmap <leader>gr :GoRun<cr>

nmap <silent> <space>k :ALENextWrap<cr>
nmap <silent> <space>j :ALEPreviousWrap<cr>

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
" set cursorline
" set cursorcolumn
set title
set nobackup
set noswapfile
set nowritebackup
set splitbelow
set splitright
set background=dark
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}\ %{ObsessionStatus()}\ %(%l,%c%V%)
colorscheme gruvbox

" custom coloring
highlight clear SignColumn
highlight ALEErrorSign guibg=darkgrey
highlight ALEWarningSign guibg=darkgrey
highlight LineNr ctermfg=darkgrey ctermbg=NONE
highlight CursorLineNr ctermfg=red ctermbg=NONE
highlight StatusLine ctermfg=0 ctermbg=red
highlight StatusLineNC ctermfg=0 ctermbg=darkgrey
highlight WildMenu cterm=underline ctermfg=red ctermbg=0 gui=none guifg=blue guibg=blue
highlight fzf1 ctermfg=red ctermbg=0
highlight fzf2 ctermfg=white ctermbg=0
highlight fzf3 ctermfg=white ctermbg=0
