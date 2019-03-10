call plug#begin('~/.local/share/nvim/plugged')
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

" Plug 'airblade/vim-gitgutter'

Plug 'w0rp/ale'
Plug 'janko-m/vim-test'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-go', { 'do': 'make'}

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

Plug 'HerringtonDarkholme/yats.vim'

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

" show lint status on statusline
fun! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

" repeat last command on next pane (tmux)
function! s:RepatLastTmuxCommand()
  silent! exec "&& !tmux select-pane -l && clear && tmux send up enter && tmux select-pane -l"
  redraw!
endfunction

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
let g:UltiSnipsJumpForwardTrigger = '<c-b>'
let g:UltiSnipsJumpBackwardTrigger = '<c-z>'

" fzf
let $FZF_DEFAULT_COMMAND = 'ag --ignore-dir "node_modules" -g ""'

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

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
let g:ale_set_quickfix = 1
let g:ale_set_loclist = 0
let g:ale_set_highlights = 0
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_linters = {
\ 'go': ['gofmt', 'golint'],
\ 'javascript': ['eslint'],
\ 'typescript': ['tslint', 'tsserver']
\ }

" prettier
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#trailing_comma = 'es5'
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

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

vno < <gv
vno > >gv

nno <silent><leader>t :NERDTreeToggle<cr>

nmap <silent> <c-p> :FZF<cr>
nmap <silent> <leader>b :Buffer<cr>

nmap <leader>gr :GoRun<cr>

nmap <silent> <space>j :ALENextWrap<cr>
nmap <silent> <space>k :ALEPreviousWrap<cr>

nmap <silent> <leader>lt :ALEToggle<cr>

nmap <leader>bl :set background=light<cr>
nmap <leader>bd :set background=dark<cr>

nnoremap <silent><Leader>rt :call <SID>RepatLastTmuxCommand()<CR>

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
set statusline=%<%f\ %h%m%r              " file
set statusline+=%{fugitive#statusline()} " git branch
set statusline+=\ %{LinterStatus()}      " lint status
set statusline+=\ %{ObsessionStatus()}   " session tracking
set statusline+=%(%l,%c%V%)              " current row and column
set completeopt-=preview
set autoread
colorscheme gruvbox

" custom coloring
highlight clear SignColumn
highlight ALEErrorSign guibg=darkgrey
highlight ALEWarningSign guibg=darkgrey
highlight LineNr ctermfg=240 ctermbg=NONE
highlight CursorLineNr ctermfg=red ctermbg=NONE
highlight StatusLine ctermfg=234 ctermbg=white
highlight StatusLineNC ctermfg=234 ctermbg=darkgrey
highlight WildMenu cterm=underline ctermfg=red ctermbg=0 gui=none guifg=blue guibg=blue
highlight fzf1 ctermfg=red ctermbg=234
highlight fzf2 ctermfg=white ctermbg=234
highlight fzf3 ctermfg=white ctermbg=234

nmap <silent><leader>, :TestNearest<CR>
nmap <silent><leader>. :TestFile<CR>
nmap <silent><leader>z :TestLast<CR>
nmap <silent><leader>x :TestSuite<CR>
" nmap <silent><leader>v :TestVisit<CR>
