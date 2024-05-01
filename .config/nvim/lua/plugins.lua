local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- colorscheme
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
  },

  -- misc
  'jiangmiao/auto-pairs',
  'chrisbra/Colorizer',
  'enricobacis/paste.vim',
  'tpope/vim-unimpaired',
  'tpope/vim-obsession',
  {
    'google/vim-searchindex',
    config = function()
      vim.g.searchindex_star_case = 0
    end,
  },

  -- editing texts
  {
    'tpope/vim-surround',
    'tpope/vim-repeat',
  },
  { 'godlygeek/tabular', cmd = 'Tabularize' },
  {
    'numToStr/Comment.nvim',
    dependencies = 'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require 'modules.comment'
    end,
  },

  -- git
  {
    'tpope/vim-fugitive',
    {
      'lewis6991/gitsigns.nvim',
      config = function()
        require 'modules.gitsigns'
      end,
    },
  },

  -- file explorer
  {
    'kyazdani42/nvim-tree.lua',
    version = '*',
    lazy = false,
    config = function()
      require('nvim-tree').setup({
        sort_by = 'case_sensitive',
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      })

      vim.api.nvim_create_autocmd('BufEnter', {
        callback = function()
          if vim.fn.winnr '$' == 1 and vim.bo.filetype == 'NvimTree' then
            vim.cmd 'quit'
          end
        end,
        pattern = '*',
      })
    end
  },

  -- fuzzy finder
  {
    'ibhagwan/fzf-lua',
    config = function()
      require 'modules.fzf'
    end,
  },
  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
  },

  -- LSP, formatter, auto completion, and snippets
  {
    {
      'neovim/nvim-lspconfig',
      dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'b0o/schemastore.nvim',
      },
      config = function()
        require 'modules.lsp'
      end,
    },
    {
      'filipdutescu/renamer.nvim',
      branch = 'master',
      dependencies = 'nvim-lua/plenary.nvim',
      config = function()
        require('renamer').setup()
      end,
    },
    {
      'nvimtools/none-ls.nvim',
      dependencies = 'nvimtools/none-ls-extras.nvim',
      config = function()
        require 'modules.lsp.null-ls'
      end,
    },
    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      config = function()
        require 'modules.lsp.cmp'
      end,
    },
    { 'hrsh7th/cmp-buffer', dependencies = 'nvim-cmp' },
    { 'hrsh7th/cmp-path', dependencies = 'nvim-cmp' },
    {
      'L3MON4D3/LuaSnip',
      dependencies = { 'rafamadriz/friendly-snippets', 'nvim-cmp' },
      config = function()
        require 'modules.lsp.luasnip'
      end,
    },
    { 'saadparwaiz1/cmp_luasnip', dependencies = 'nvim-cmp' },
  },

  -- syntax highlighting
  {
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      config = function()
        require 'modules.treesitter'
      end,
    },
    { 'windwp/nvim-ts-autotag', dependencies = 'nvim-treesitter' },
    {
      'https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git',
      dependencies = 'nvim-treesitter',
      config = function()
        require 'modules.rainbow-delimiters'
      end,
    },
    { 'andymass/vim-matchup', dependencies = 'nvim-treesitter' },
  },

  -- testing
  {
    'janko-m/vim-test',
    cmd = {
      'TestFile',
      'TestLast',
      'TestNearest',
      'TestSuite',
      'TestVisit',
    },
  },

  -- markdown
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app & yarn install',
    ft = 'markdown',
    cmd = 'MarkdownPreview',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end
  },
  {
    'dkarter/bullets.vim',
    ft = { 'markdown', 'text', 'gitcommit', 'scratch' },
  },

  -- javascript
  {
    'heavenshell/vim-jsdoc',
    ft = { 'javascript', 'javascript.jsx', 'typescript' },
    build = 'make install',
  },
}

local opts = {
  ui = {
    border = 'rounded'
  }
}

local ok, lazy = pcall(require, 'lazy')
if not ok then
  return
end
lazy.setup(plugins, opts)
