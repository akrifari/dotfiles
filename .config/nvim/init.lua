vim.fn['plug#begin']('~/.local/share/nvim/plugged')
-- colorscheme
vim.cmd [[Plug 'dracula/vim']]

-- misc
vim.cmd [[Plug 'jiangmiao/auto-pairs']]
vim.cmd [[Plug 'tpope/vim-surround']]
vim.cmd [[Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }]]
vim.cmd [[Plug 'Xuyuanp/nerdtree-git-plugin']]
vim.cmd [[Plug 'mattn/emmet-vim']]
vim.cmd [[Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }]]
vim.cmd [[Plug 'junegunn/fzf.vim']]
vim.cmd [[Plug 'tpope/vim-ragtag']]
vim.cmd [[Plug 'enricobacis/paste.vim']]
vim.cmd [[Plug 'honza/vim-snippets']]
vim.cmd [[Plug 'tpope/vim-repeat']]
vim.cmd [[Plug 'tpope/vim-fugitive']]
vim.cmd [[Plug 'tpope/vim-commentary']]
vim.cmd [[Plug 'tpope/vim-obsession']]
vim.cmd [[Plug 'godlygeek/tabular']]
vim.cmd [[Plug 'luochen1990/rainbow']]
vim.cmd [[Plug 'dkarter/bullets.vim']]
vim.cmd [[Plug 'editorconfig/editorconfig-vim']]
vim.cmd [[Plug 'neoclide/coc.nvim', { 'branch': 'release' }]]
vim.cmd [[Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }]]
vim.cmd [[Plug 'chrisbra/Colorizer']]
vim.cmd [[Plug 'tpope/vim-unimpaired']]

vim.cmd [[Plug 'nvim-lua/plenary.nvim']]
vim.cmd [[Plug 'lewis6991/gitsigns.nvim']]

-- linting & testing
vim.cmd [[Plug 'w0rp/ale']]
vim.cmd [[Plug 'janko-m/vim-test']]

-- javascript
vim.cmd [[Plug 'yuezk/vim-js']]
vim.cmd [[Plug 'MaxMEllon/vim-jsx-pretty']]
vim.cmd [[Plug 'HerringtonDarkholme/yats.vim']]
vim.cmd [[Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx', 'typescript'], 'do': 'make install'}]]

-- golang
vim.cmd [[Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }]]

-- ruby
vim.cmd [[Plug 'tpope/vim-endwise']]

-- nginx
vim.cmd [[Plug 'chr4/nginx.vim']]
vim.fn['plug#end']()

function trim_white_space()
  local save = vim.fn.winsaveview()
  vim.cmd [[%s/\s\+$//e]]
  vim.fn.winrestview(save)
end
vim.api.nvim_command('autocmd BufWritePre * lua trim_white_space()')

function _G.linter_status()
  local ale_summary = vim.fn['ale#statusline#Count'](vim.fn.bufnr(''))
  local error_count = ale_summary['error'] + ale_summary['style_error']
  local warning_count = ale_summary['total'] - error_count
  if ale_summary['total'] == 0 then return '' end
  return vim.fn.printf('%dW %dE', warning_count, error_count)
end

function show_documentation()
  local filetype = vim.bo.filetype
  if filetype == "vim" or filetype == "help" then
    vim.api.nvim_command("h " .. vim.fn.expand("<cword>"))
  elseif vim.fn["coc#rpc#ready"]() then
    vim.fn.CocActionAsync("doHover")
  else
    vim.api.nvim_command("!" .. vim.bo.keywordprg .. " " .. vim.fn.expand("<cword>"))
  end
end

vim.g.mapleader = ','
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars = {
  eol = "¬",
  tab = "› ",
  trail = "•"
}
vim.opt.ignorecase = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.background = 'dark'
vim.opt.statusline = '%<%1*%f%*'                                       -- full path
vim.opt.statusline:append('%( %7*%m%*%2*%h%r%*%)')                     -- modified, help, and readonly flag
vim.opt.statusline:append('%( %4*%{v:lua.linter_status()}%*%)')        -- lint status
vim.opt.statusline:append('%( %3*%{FugitiveHead()}%*%)')               -- git branch
vim.opt.statusline:append('%( %6*%{get(b:,"gitsigns_status","")}%*%)') -- git hunk status
vim.opt.statusline:append('%( %5*%{ObsessionStatus()}%*%)')            -- session tracking
vim.opt.statusline:append('%=%6*%y%*')                                 -- file type
vim.opt.statusline:append(' %3*%l%*')                                  -- current line
vim.opt.statusline:append('%8*/%L%*')                                  -- total lines
vim.opt.statusline:append('%3*%4v%*')                                  -- virtual column number
vim.opt.colorcolumn = '80'
vim.opt.autoread = true
vim.opt.updatetime = 100
vim.opt.timeoutlen = 350
vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.shortmess:append('c')
vim.opt.signcolumn = 'yes'
vim.opt.inccommand = 'split'

-- colorscheme & color preference
-- note: order matters here, otherwise it will mess up
require('highlights')
vim.cmd [[colorscheme dracula]]

-- emmet
vim.g.user_emmet_leader_key = '<leader>e'

-- nerdtree
vim.g.NERDTreeIgnore = {'node_modules'}
--    force quit if the only active buffer is nerdtree
vim.api.nvim_command('autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif')

-- fzf
vim.g.fzf_layout = {
  window = { height = 0.9, width = 0.9 }
}

-- vim-go
vim.g.go_highlight_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_fmt_command = "goimports"

-- ale
vim.g.ale_echo_msg_error_str = 'E'
vim.g.ale_echo_msg_warning_str = 'W'
vim.g.ale_set_quickfix = 1
vim.g.ale_set_loclist = 0
vim.g.ale_set_highlights = 0
vim.g.ale_echo_msg_format = '[%linter%] %s'
vim.g.ale_linters = {
  go = {'gofmt', 'golint'},
  javascript = {'eslint'},
  typescript = {'tslint', 'tsserver'}
}

-- rainbow
vim.g.rainbow_active = 1
vim.g.rainbow_conf = {
  separately = { html = 0, markdown = 0, css = 0 }
}

-- coc
vim.g.coc_global_extensions = {
  'coc-json',
  'coc-tsserver',
  'coc-css',
  'coc-prettier',
  'coc-go',
  'coc-emmet',
  'coc-html',
  'coc-snippets',
  'coc-eslint',
}
vim.g.coc_snippet_next = '<c-j>'
vim.g.coc_snippet_prev = '<c-k>'

-- vim-jsx-pretty
vim.g.vim_jsx_pretty_colorful_config = 1

vim.api.nvim_set_keymap('n', '<leader>r', ':source $MYVIMRC<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<cr>', ':nohl<cr>', { noremap = true, silent = true })

-- escape in various mode
vim.api.nvim_set_keymap('i', 'jk', '<esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('c', 'jk', '<esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', ';;', '<esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', 'jk', '<c-\\><c-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', 'jj', '<c-\\><c-n>:q<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>Q', ':q!<cr>', { noremap = true, silent = true })

-- emacs like keybindings
vim.api.nvim_set_keymap('i', '<c-a>', '<c-o>^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<c-e>', '<c-o>$', { noremap = true, silent = true })

-- window navigation
vim.api.nvim_set_keymap('n', '<c-h>', '<c-w><c-h>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w><c-j>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w><c-k>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w><c-l>', { noremap = true, silent = true })

-- tab navigation
vim.api.nvim_set_keymap('n', '`h', ':tabp<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '`l', ':tabn<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '``', ':tabc<cr>', { noremap = true, silent = true })

-- move selected block
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'K', '[egv', { noremap = false, silent = true })
vim.api.nvim_set_keymap('v', 'J', ']egv', { noremap = false, silent = true })

-- nerdtree
vim.api.nvim_set_keymap('n', '<leader>t', ':NERDTreeToggle<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', ':NERDTreeFind<cr>', { noremap = true, silent = true })

-- fzf
vim.api.nvim_set_keymap('n', '<c-p>', ':Files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>p', ':Rg<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':Buffers<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>w', ':Windows<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'q:', ':History:<cr>', { noremap = true, silent = true })

-- ale
vim.api.nvim_set_keymap('n', '<space>j', ':ALENextWrap<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>k', ':ALEPreviousWrap<cr>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<leader>hr', ':<c-u>%s/\\%V/g<left><left>', { noremap = true, silent = true })

-- vim-fugitive
vim.api.nvim_set_keymap('n', '<leader>gg', ':Git<cr>', { noremap = true, silent = true })

-- vim-test
vim.api.nvim_set_keymap('n', '<leader>,', ':TestNearest<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>.', ':TestFile<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>z', ':TestLast<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':TestSuite<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><space>', ':TestVisit<cr>', { noremap = true, silent = true })

-- coc
vim.api.nvim_set_keymap('n', 'K', ':lua show_documentation()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<f2>', '<plug>(coc-rename)', { silent = true })
vim.api.nvim_set_keymap('n', 'gd', '<plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gy', '<plug>(coc-type-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<plug>(coc-implementation)', { silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<plug>(coc-references)', { silent = true })
vim.api.nvim_set_keymap('n', '[g', '<plug>(coc-diagnostic-prev)', { silent = true })
vim.api.nvim_set_keymap('n', ']g', '<plug>(coc-diagnostic-next)', { silent = true })
vim.api.nvim_set_keymap('v', '<c-j>', '<plug>(coc-snippets-select)', { silent = true })
vim.api.nvim_set_keymap('i', '<c-l>', '<plug>(coc-snippets-expand)', { silent = true })
vim.api.nvim_set_keymap('i', '<c-j>', '<plug>(coc-snippets-expand-jump)', { silent = true })
vim.api.nvim_set_keymap('i', '<c-space>', 'coc#refresh()', { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fw', ':CocSearch <c-r><c-w><cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<c-f>"', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('n', '<c-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<c-b>"', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<c-f>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<right>"', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<c-b>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<left>"', { noremap = true, silent = true, expr = true })

-- colorizer
vim.api.nvim_set_keymap('n', '<leader>1', ':ColorToggle<cr>', { noremap = true, silent = true })

require('gitsigns').setup {
  keymaps = {
    noremap = true,
    buffer = true,
    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<cr>'" },
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<cr>'" },

    ['n gp'] = '<cmd>lua require"gitsigns".preview_hunk()<cr>',
    ['n <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk()<cr>',
    ['n <leader>gu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<cr>',
    ['n <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk()<cr>',
    ['n <leader>gR'] = '<cmd>lua require"gitsigns".reset_buffer()<cr>',
    ['n <leader>gb'] = '<cmd>lua require"gitsigns".blame_line(true)<cr>',
    ['n <leader>gB'] = '<cmd>Gitsigns toggle_current_line_blame<cr>',

    -- text objects
    ['o ih'] = ':<c-u>lua require"gitsigns.actions".select_hunk()<cr>',
    ['x ih'] = ':<c-u>lua require"gitsigns.actions".select_hunk()<cr>',
  },
  current_line_blame_opts = {
    delay = 100
  }
}
