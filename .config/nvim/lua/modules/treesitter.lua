local ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return
end

nvim_treesitter.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false,
  },
  indent = { enable = true },
  autotag = { enable = true },
  matchup = { enable = true },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  rainbow = {
    enable = true,
    extended_mode = false,
    max_file_lines = nil,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<m-l>",
      scope_incremental = '<m-k>',
      node_incremental = "<m-l>",
      node_decremental = "<m-h>",
    },
  },
}
