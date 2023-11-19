local ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return
end

nvim_treesitter.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  autotag = { enable = true },
  matchup = { enable = true },
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
