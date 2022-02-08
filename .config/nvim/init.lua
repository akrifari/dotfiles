vim.fn['plug#begin']('~/.local/share/nvim/plugged')
-- colorscheme
vim.cmd [[Plug 'folke/tokyonight.nvim', { 'branch': 'main' }]]

-- misc
vim.cmd [[Plug 'jiangmiao/auto-pairs']]
vim.cmd [[Plug 'tpope/vim-surround']]
vim.cmd [[Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }]]
vim.cmd [[Plug 'Xuyuanp/nerdtree-git-plugin']]
vim.cmd [[Plug 'mattn/emmet-vim']]
vim.cmd [[Plug 'enricobacis/paste.vim']]
vim.cmd [[Plug 'honza/vim-snippets']]
vim.cmd [[Plug 'tpope/vim-repeat']]
vim.cmd [[Plug 'tpope/vim-fugitive']]
vim.cmd [[Plug 'tpope/vim-obsession']]
vim.cmd [[Plug 'godlygeek/tabular']]
vim.cmd [[Plug 'dkarter/bullets.vim']]
vim.cmd [[Plug 'editorconfig/editorconfig-vim']]
vim.cmd [[Plug 'neoclide/coc.nvim', { 'branch': 'release' }]]
vim.cmd [[Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }]]
vim.cmd [[Plug 'chrisbra/Colorizer']]
vim.cmd [[Plug 'tpope/vim-unimpaired']]

vim.cmd [[Plug 'nvim-lua/plenary.nvim']]
vim.cmd [[Plug 'lewis6991/gitsigns.nvim']]
vim.cmd [[Plug 'numToStr/Comment.nvim']]
vim.cmd [[Plug 'kevinhwang91/nvim-bqf', { 'for': 'qf' }]]
vim.cmd [[Plug 'ibhagwan/fzf-lua']]

-- syntax highlighting
vim.cmd [[Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }]]
vim.cmd [[Plug 'nvim-treesitter/playground']]
vim.cmd [[Plug 'JoosepAlviste/nvim-ts-context-commentstring']]
vim.cmd [[Plug 'p00f/nvim-ts-rainbow']]

-- testing
vim.cmd [[Plug 'janko-m/vim-test']]

-- javascript
vim.cmd [[Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx', 'typescript'], 'do': 'make install' }]]

-- golang
vim.cmd [[Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }]]
vim.fn['plug#end']()

function trim_white_space()
  local save = vim.fn.winsaveview()
  vim.cmd [[%s/\s\+$//e]]
  vim.fn.winrestview(save)
end
vim.api.nvim_command('autocmd BufWritePre * lua trim_white_space()')

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
vim.opt.colorcolumn = '80'
vim.opt.autoread = true
vim.opt.updatetime = 100
vim.opt.timeoutlen = 350
vim.opt.termguicolors = true
vim.opt.shortmess:append('c')
vim.opt.signcolumn = 'yes'
vim.opt.inccommand = 'split'

require('highlights')
require('statusline')

-- emmet
vim.g.user_emmet_leader_key = '<leader>e'

-- nerdtree
vim.g.NERDTreeIgnore = {'node_modules'}
--    force quit if the only active buffer is nerdtree
vim.api.nvim_command('autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif')


-- vim-go
vim.g.go_highlight_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_fmt_command = "goimports"

-- bullets
vim.g.bullets_enabled_file_types = {
  'markdown',
  'text',
  'gitcommit',
  'scratch',
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

vim.api.nvim_set_keymap('n', '<space>', '<nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rv', ':source $MYVIMRC<cr>', { noremap = true })

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
vim.api.nvim_set_keymap('n', '<m-H>', '<c-w><c-h>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<m-J>', '<c-w><c-j>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<m-K>', '<c-w><c-k>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<m-L>', '<c-w><c-l>', { noremap = true, silent = true })

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

-- fzf-lua
vim.api.nvim_set_keymap('n', '<c-p>', ':FzfLua files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>p', ':FzfLua grep<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rg', ':FzfLua live_grep_native<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bf', ':FzfLua buffers<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gfl', ':FzfLua git_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gfm', ':FzfLua git_status<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'q:', ':FzfLua command_history<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bl', ':FzfLua<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>df', ":lua require('modules.fzf').dotfiles()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fw', ":FzfLua grep_cword<cr>", { noremap = true, silent = true })

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
vim.api.nvim_set_keymap('i', '<c-y>', 'coc#refresh()', { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<c-f>"', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('n', '<c-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<c-b>"', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<c-f>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<right>"', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<c-b>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<left>"', { noremap = true, silent = true, expr = true })

-- colorizer
vim.api.nvim_set_keymap('n', '<leader>1', ':ColorToggle<cr>', { noremap = true, silent = true })

require('modules')
