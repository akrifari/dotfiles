vim.keymap.set('n', '<space>', '<nop>')
vim.keymap.set('n', '<leader>rv', '<cmd>source $MYVIMRC<cr>')

-- escape in various mode
vim.keymap.set({ 'i', 'c' }, 'jk', '<esc>')
vim.keymap.set('v', ';;', '<esc>')
vim.keymap.set('t', 'jk', '<c-\\><c-n>')
vim.keymap.set('t', 'jj', '<c-\\><c-n><cmd>q<cr>')
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>')
vim.keymap.set('n', '<leader>Q', '<cmd>q!<cr>')

-- emacs like keybindings
vim.keymap.set('i', '<c-a>', '<c-o>^')
vim.keymap.set('i', '<c-e>', '<c-o>$')

-- window navigation
vim.keymap.set('n', '<m-H>', '<c-w><c-h>')
vim.keymap.set('n', '<m-J>', '<c-w><c-j>')
vim.keymap.set('n', '<m-K>', '<c-w><c-k>')
vim.keymap.set('n', '<m-L>', '<c-w><c-l>')

-- tab navigation
vim.keymap.set('n', '`h', '<cmd>tabp<cr>')
vim.keymap.set('n', '`l', '<cmd>tabn<cr>')
vim.keymap.set('n', '``', '<cmd>tabc<cr>')

-- move selected block
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
-- `remap` options is a must otherwise it won't work
-- NOTE: these lines need `vim-unimpaired`
vim.keymap.set('v', 'K', '[egv', { remap = true })
vim.keymap.set('v', 'J', ']egv', { remap = true })

-- substitute text in selected region
vim.keymap.set('v', '<leader>hr', ':<c-u>%s/\\%V/g<left><left>')

-- nerdtree
vim.keymap.set('n', '<leader>t', '<cmd>NERDTreeToggle<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>NERDTreeFind<cr>')

-- vim-fugitive
vim.keymap.set('n', '<leader>gg', '<cmd>Git<cr>')

-- vim-test
vim.keymap.set('n', '<leader>,', '<cmd>TestNearest<cr>')
vim.keymap.set('n', '<leader>.', '<cmd>TestFile<cr>')
vim.keymap.set('n', '<leader>z', '<cmd>TestLast<cr>')
vim.keymap.set('n', '<leader>x', '<cmd>TestSuite<cr>')
vim.keymap.set('n', '<leader><space>', '<cmd>TestVisit<cr>')

-- colorizer
vim.keymap.set('n', '<leader>1', '<cmd>ColorToggle<cr>')

-- fzf-lua
vim.keymap.set('n', '<c-p>', '<cmd>FzfLua files<cr>')
vim.keymap.set('n', '<space>p', '<cmd>FzfLua grep<cr>')
vim.keymap.set('n', '<leader>rg', '<cmd>FzfLua live_grep_native<cr>')
vim.keymap.set('n', '<leader>bf', '<cmd>FzfLua buffers<cr>')
vim.keymap.set('n', '<leader>gfl', '<cmd>FzfLua git_files<cr>')
vim.keymap.set('n', '<leader>gfm', '<cmd>FzfLua git_status<cr>')
vim.keymap.set('n', 'q:', '<cmd>FzfLua command_history<cr>')
vim.keymap.set('n', '<leader>bl', '<cmd>FzfLua<cr>')
vim.keymap.set('n', '<leader>df', function()
  return require('modules.fzf').dotfiles()
end)
vim.keymap.set('n', '<leader>fw', '<cmd>FzfLua grep_cword<cr>')
