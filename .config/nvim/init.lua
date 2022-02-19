-- speed up startuptime by caching plugins
-- TODO: remove `impatient` once https://github.com/neovim/neovim/pull/15436
--       is merged
require('impatient')
require('plugins')

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
vim.opt.signcolumn = 'yes'
vim.opt.inccommand = 'split'

require('highlights')
require('statusline')

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

-- colorizer
vim.api.nvim_set_keymap('n', '<leader>1', ':ColorToggle<cr>', { noremap = true, silent = true })
