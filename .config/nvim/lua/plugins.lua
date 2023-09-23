local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system {
    'git',
    'clone',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  vim.api.nvim_command 'packadd packer.nvim'
end

local ok, packer = pcall(require, 'packer')
if not ok then
  return
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerSync',
  group = packer_group,
  pattern = 'plugins.lua',
})

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use { 'folke/tokyonight.nvim', branch = 'main' }

  -- misc
  use 'jiangmiao/auto-pairs'
  use 'chrisbra/Colorizer'
  use 'enricobacis/paste.vim'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-obsession'
  use {
    'google/vim-searchindex',
    config = function()
      vim.g.searchindex_star_case = 0
    end,
  }

  -- editing texts
  use {
    'tpope/vim-surround',
    'tpope/vim-repeat',
  }
  use { 'godlygeek/tabular', cmd = 'Tabularize' }
  use {
    'numToStr/Comment.nvim',
    requires = 'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require 'modules.comment'
    end,
  }

  -- code standard
  use 'editorconfig/editorconfig-vim'

  -- git
  use {
    'tpope/vim-fugitive',
    {
      'lewis6991/gitsigns.nvim',
      config = function()
        require 'modules.gitsigns'
      end,
    },
  }

  -- file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    tag = 'nightly',
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          mappings = {
            list = {
              { key = "C", action = "cd" },
              { key = "u", action = "dir_up" },
              { key = "<c-s>", action = "split" },
            },
          },
        },
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
  }

  -- fuzzy finder
  use {
    'ibhagwan/fzf-lua',
    config = function()
      require 'modules.fzf'
    end,
  }
  use {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
  }

  -- LSP, formatter, auto completion, and snippets
  use {
    {
      'neovim/nvim-lspconfig',
      requires = {
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
      requires = 'nvim-lua/plenary.nvim',
      config = function()
        require('renamer').setup()
      end,
    },
    {
      'jose-elias-alvarez/null-ls.nvim',
      config = function()
        require 'modules.lsp.null-ls'
      end,
    },
    {
      'hrsh7th/nvim-cmp',
      config = function()
        require 'modules.lsp.cmp'
      end,
    },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    {
      'L3MON4D3/LuaSnip',
      requires = 'rafamadriz/friendly-snippets',
      after = 'nvim-cmp',
      config = function()
        require 'modules.lsp.luasnip'
      end,
    },
    { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
  }

  -- syntax highlighting
  use {
    {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        require 'modules.treesitter'
      end,
    },
    { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
    {
      'https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git',
      after = 'nvim-treesitter',
      config = function()
        require 'modules.rainbow-delimiters'
      end,
    },
    { 'andymass/vim-matchup', after = 'nvim-treesitter' },
  }

  -- testing
  use {
    'janko-m/vim-test',
    cmd = {
      'TestFile',
      'TestLast',
      'TestNearest',
      'TestSuite',
      'TestVisit',
    },
  }

  -- markdown
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app & yarn install',
    ft = 'markdown',
    cmd = 'MarkdownPreview',
  }
  use {
    'dkarter/bullets.vim',
    ft = { 'markdown', 'text', 'gitcommit', 'scratch' },
  }

  -- javascript
  use {
    'heavenshell/vim-jsdoc',
    ft = { 'javascript', 'javascript.jsx', 'typescript' },
    run = 'make install',
  }
end)
