call plug#begin('~/.local/share/nvim/plugged')
" colorscheme
Plug 'dracula/vim'

" misc
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-ragtag'
Plug 'enricobacis/paste.vim'
Plug 'honza/vim-snippets'
Plug 'google/vim-searchindex'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'godlygeek/tabular'
Plug 'luochen1990/rainbow'
Plug 'dkarter/bullets.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'chrisbra/Colorizer'

" linting & testing
Plug 'w0rp/ale'
Plug 'janko-m/vim-test'

" javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'HerringtonDarkholme/yats.vim'

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" ruby
Plug 'tpope/vim-endwise'

" nginx
Plug 'chr4/nginx.vim'
call plug#end()

" space trailing
fu! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

" show lint status on statusline
fu! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '' : printf(
        \   '%dW %dE',
        \   all_non_errors,
        \   all_errors
        \ )
endfunction

" documentation popup
fu! s:ShowDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" hide fzf statusline
autocmd FileType fzf
      \ set laststatus=0 noshowmode noruler signcolumn=no nonumber
        \ norelativenumber
      \| autocmd BufLeave <buffer>
        \ set laststatus=2 showmode ruler signcolumn=yes number relativenumber

let g:mapleader = ','

" emmet
let g:user_emmet_leader_key = '<leader>e'

" nerdtree
let g:NERDTreeIgnore = ['node_modules']

" fzf
let g:fzf_layout = { 'down': '~30%' }

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
      \   'go': ['gofmt', 'golint'],
      \   'javascript': ['eslint'],
      \   'typescript': ['tslint', 'tsserver']
      \ }

" rainbow parenthesis
let g:rainbow_active = 1
let g:rainbow_conf = {
      \   'separately': {
      \     'html': 0,
      \     'markdown': 0,
      \     'css': 0
      \   }
      \ }

" vim-searchindex
let g:searchindex_star_case = 0

" coc
let g:coc_global_extensions = [
      \   "coc-json",
      \   "coc-tsserver",
      \   "coc-css",
      \   "coc-prettier",
      \   "coc-go",
      \   "coc-emmet",
      \   "coc-html",
      \   "coc-snippets",
      \   "coc-eslint",
      \ ]
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

" key mapping
no <silent> <leader>r :source %<cr>
no <silent> <cr> :nohl<cr>

ino jk <esc>
cno jk <esc>
vno ;; <esc>
tno jk <c-\><c-n>
tno <silent> jj <c-\><c-n>:q<cr>

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
nmap <leader>gc :GoCoverageToggle<cr>

nmap <silent> <space>j :ALENextWrap<cr>
nmap <silent> <space>k :ALEPreviousWrap<cr>

vno <leader>hr :<C-U>%s/\%V

nmap <silent> <space>J :GitGutterNextHunk<cr>
nmap <silent> <space>K :GitGutterPrevHunk<cr>
nmap <silent> <space>gp :GitGutterPreviewHunk<cr>

nmap <silent><leader>, :TestNearest<CR>
nmap <silent><leader>. :TestFile<CR>
nmap <silent><leader>z :TestLast<CR>
nmap <silent><leader>x :TestSuite<CR>
nmap <silent><leader><space> :TestVisit<CR>

nn <silent> K :call <sid>ShowDocumentation()<cr>
nmap <f2> <plug>(coc-rename)
nmap <silent> gd <plug>(coc-definition)
nmap <silent> gy <plug>(coc-type-definition)
nmap <silent> gi <plug>(coc-implementation)
nmap <silent> gr <plug>(coc-references)
nmap <silent> [g <plug>(coc-diagnostic-prev)
nmap <silent> ]g <plug>(coc-diagnostic-next)
vmap <c-j> <plug>(coc-snippets-select)
imap <c-l> <plug>(coc-snippets-expand)
imap <c-j> <plug>(coc-snippets-expand-jump)

nn <leader>1 :ColorToggle<cr>

" settings
set encoding=utf-8
set number
set relativenumber
set pastetoggle=<F3>
set clipboard+=unnamedplus
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:›\ ,trail:•,eol:¬
set ignorecase
set title
set nobackup
set noswapfile
set nowritebackup
set splitbelow
set splitright
set background=dark
set statusline=%<%1*%f%*                        " full path
set statusline+=%(\ %7*%m%*%2*%h%r%*%)          " modified, help, and readonly flag
set statusline+=%(\ %4*%{LinterStatus()}%*%)    " lint status
set statusline+=%(\ %3*%{FugitiveHead()}%*%)    " git branch
set statusline+=%(\ %5*%{ObsessionStatus()}%*%) " session tracking
set statusline+=%=%6*%y%*                       " file type
set statusline+=\ %3*%l%*                       " current line
set statusline+=/%L                             " total lines
set statusline+=%3*%4v%*                        " virtual column number
set completeopt-=preview
set colorcolumn=80
set autoread
set updatetime=100
set timeoutlen=350
set termguicolors
set hidden
set shortmess+=c
set signcolumn=yes
colorscheme dracula

" customize colors
source ~/.config/nvim/color/dracula.vim
