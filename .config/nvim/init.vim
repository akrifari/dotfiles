call plug#begin('~/.local/share/nvim/plugged')
" colorscheme
Plug 'dracula/vim'

" misc
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
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
Plug 'yuezk/vim-js'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'heavenshell/vim-jsdoc', {
      \   'for': ['javascript', 'javascript.jsx','typescript'],
      \   'do': 'make install'
      \ }

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

" git hunk status (added, modified, and replaced)
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return a == 0 && m == 0 && r == 0 ? '' : printf('+%d ~%d -%d', a, m, r)
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

" vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1

" key mapping
no <silent> <leader>r :source $MYVIMRC<cr>
no <silent> <cr> :nohl<cr>

ino jk <esc>
cno jk <esc>
vn ;; <esc>
tno jk <c-\><c-n>
tno <silent> jj <c-\><c-n>:q<cr>
nno <silent> <leader>q :q<cr>

ino <c-a> <c-o>^
ino <c-e> <c-o>$

nn <c-h> <c-w><c-h>
nn <c-j> <c-w><c-j>
nn <c-k> <c-w><c-k>
nn <c-l> <c-w><c-l>

nn <silent> <space>h :bp<cr>
nn <silent> <space>l :bn<cr>
nn <silent> `h :tabp<cr>
nn <silent> `l :tabn<cr>

vn < <gv
vn > >gv
vn K dkPV`]
vn J dpV`]

nn <silent> <leader>t :NERDTreeToggle<cr>

nn <silent> <c-p> :FZF<cr>
nn <silent> <space>p :Rg<cr>
nn <silent> <leader>b :Buffer<cr>
nn <silent> <leader>w :Windows<cr>
nn <silent> q: :History:<cr>

nn <leader>gr :GoRun<cr>
nn <leader>gc :GoCoverageToggle<cr>

nn <silent> <space>j :ALENextWrap<cr>
nn <silent> <space>k :ALEPreviousWrap<cr>

vn <leader>hr :<C-U>%s/\%V

nn <silent> gl :GitGutterNextHunk<cr>
nn <silent> gh :GitGutterPrevHunk<cr>
nn <silent> gp :GitGutterPreviewHunk<cr>

nn <silent> <leader>, :TestNearest<cr>
nn <silent> <leader>. :TestFile<cr>
nn <silent> <leader>z :TestLast<cr>
nn <silent> <leader>x :TestSuite<cr>
nn <silent> <leader><space> :TestVisit<cr>

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
nn <leader>fw :CocSearch <c-r><c-w><cr>

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
set statusline+=%(\ %6*%{GitStatus()}%*%)       " git hunk status
set statusline+=%(\ %5*%{ObsessionStatus()}%*%) " session tracking
set statusline+=%=%6*%y%*                       " file type
set statusline+=\ %3*%l%*                       " current line
set statusline+=%8*/%L%*                        " total lines
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
