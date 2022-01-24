local ok, fzf_lua = pcall(require, 'fzf-lua')
if not ok then
  return
end

fzf_lua.setup {
  winopts = {
    fullscreen = true,
  },
  keymap = {
    builtin = {
      ["<f1>"]  = "toggle-help",
      ["<f2>"]  = "toggle-fullscreen",
      ["<f3>"]  = "toggle-preview-wrap",
      ["<f4>"]  = "toggle-preview",
      ["<f5>"]  = "toggle-preview-ccw",
      ["<f6>"]  = "toggle-preview-cw",
      ["<c-f>"] = "preview-page-down",
      ["<c-b>"] = "preview-page-up",
    },
    fzf = {
      ["alt-a"]  = "toggle-all",
      ["ctrl-k"] = "half-page-up",
      ["ctrl-j"] = "half-page-down",
      -- only valid with fzf previewers (bat/cat/git/etc)
      ["f3"]     = "toggle-preview-wrap",
      ["f4"]     = "toggle-preview",
      ["ctrl-f"] = "preview-page-down",
      ["ctrl-b"] = "preview-page-up",
    },
  },
  fzf_opts = {
    ['--layout'] = 'default',
  },
  previewers = {
    git_diff = {
      pager = "delta",
    },
  },
  git = {
    files = {
      multiprocess = true,
    },
    commits = {
      preview = "git show --color {1}",
      fzf_opts = {
        ['--layout'] = 'reverse',
      }
    },
    bcommits = {
      preview = "git show --color {1}",
      fzf_opts = {
        ['--layout'] = 'reverse',
      }
    }
  },
  builtin = {
    winopts_fn = function()
      return { fullscreen = vim.o.columns < 80 }
    end
  },
  files = {
    multiprocess = true,
    winopts = {
      preview = {
        hidden = 'hidden'
      }
    },
    git_icons  = false,
    file_icons = false,
  },
  grep = {
    multiprocess = true,
    search       = "",
    file_icons   = false,
    git_icons    = false,
    preview_layout = "vertical",
    preview_vertical = "up:60%",
  },
}

local M = {}

M.dotfiles = function(opts)
  if not opts then opts = {} end
  opts.prompt = "dotfiles> "
  opts.cwd = "$HOME/dotfiles"
  opts.winopts = {
    preview = {
      hidden = 'nohidden'
    }
  }
  fzf_lua.files(opts)
end

return M
