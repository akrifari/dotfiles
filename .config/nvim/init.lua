vim.loader.enable()

vim.g.mapleader = ','
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars = {
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

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ timeout = '30' })
  end,
})

require('plugins')
require('highlights')
require('statusline')
require('keymaps')
