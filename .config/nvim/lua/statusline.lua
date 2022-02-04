-- credits:
-- https://elianiva.my.id/post/neovim-lua-statusline

local M = {}

M.colors = {
  red = '%#TNRed#',
  red1 = '%#TNRed1#',
  green = '%#TNGreen#',
  yellow = '%#TNYellow#',
  blue = '%#TNBlue#',
  magenta = '%#TNMagenta#',
  cyan = '%#TNCyan#',
  gray = '%#TNGray#',
  orange = '%#TNOrange#',
  teal = '%#TNTeal#',
  blue2 = '%#TNBlue2#',
}
--
M.specifiers = {
  field_truncation = '%<',
  field_alignment = '%=',
  modified = '%m',
  help = '%h',
  readonly = '%r',
  fullpath = '%F',
  filepath = '%f',
  filetype = '%y',
  current_line = '%l',
  total_lines = '%L',
  current_column = '%4v',
}

M.get_filepath = function(self)
  return self.specifiers.filepath
end

M.get_obsession = function()
  return '%(%{ObsessionStatus()}%)'
end

M.get_file_status = function(self)
  local filetype = vim.bo.filetype
  if filetype == '' then
    return ''
  end

  return table.concat {
    self.colors.yellow,
    self.specifiers.modified,
    self.colors.green,
    self.specifiers.help,
    self.specifiers.readonly,
  }
end

M.get_diagnostic_count = function(severity)
  local bufnr = vim.fn.bufnr ''
  local ok, diagnostic = pcall(vim.api.nvim_buf_get_var, bufnr, 'coc_diagnostic_info')
  if not ok then
    return ''
  end
  if diagnostic[severity] == 0 then
    return ''
  end
  return '  ' .. diagnostic[severity]
end

M.get_filetype = function()
  local filetype = vim.bo.filetype
  if filetype == '' then
    return ''
  end
  return string.format('[%s] ', filetype)
end

M.get_gitsigns_status = function(key)
  local summary = vim.b.gitsigns_status_dict or {
    head = '',
    added = 0,
    changed = 0,
    removed = 0,
  }

  -- if gitsigns is not ready
  if summary[key] == nil then
    return ''
  end
  -- if the file is not in a git repo
  if summary[key] == '' then
    return ''
  end
  -- if there are no changes
  if summary[key] == 0 then
    return ''
  end

  local symbols = {
    head = ' ',
    added = ' ',
    changed = ' ',
    removed = ' ',
  }
  return symbols[key] .. summary[key] .. ' '
end

M.get_line_position = function(self)
  local total_lines = vim.fn.line '$'
  return table.concat {
    self.colors.cyan,
    self.specifiers.current_line,
    self.colors.gray,
    '/',
    total_lines,
  }
end

M.get_column_position = function(self)
  return self.specifiers.current_column
end

M.set_active = function(self)
  local obsession = self.colors.green .. self:get_obsession()

  local filepath = self.colors.blue .. self:get_filepath()
  local filetype = self.colors.magenta .. self:get_filetype()
  local file_status = self:get_file_status()

  local coc_hint    = self.colors.teal .. self.get_diagnostic_count('hint')
  local coc_info    = self.colors.blue2 .. self.get_diagnostic_count('information')
  local coc_warning = self.colors.orange .. self.get_diagnostic_count('warning')
  local coc_error   = self.colors.red1 .. self.get_diagnostic_count('error')

  local git_added = self.colors.green .. self.get_gitsigns_status('added')
  local git_changed = self.colors.orange .. self.get_gitsigns_status('changed')
  local git_removed = self.colors.red .. self.get_gitsigns_status('removed')
  local git_head = self.colors.blue .. self.get_gitsigns_status('head')

  local line_pos = self.colors.cyan .. self:get_line_position()
  local column_pos = self.colors.cyan .. self:get_column_position()

  return table.concat {
    self.specifiers.field_truncation,
    filepath,
    file_status,
    obsession,
    coc_hint,
    coc_info,
    coc_warning,
    coc_error,
    self.specifiers.field_alignment,
    git_added,
    git_changed,
    git_removed,
    git_head,
    filetype,
    line_pos,
    column_pos,
  }
end

M.set_inactive = function(self)
  return table.concat {
    self.colors.gray,
    self.specifiers.field_alignment,
    self.specifiers.fullpath,
    self.specifiers.field_alignment,
  }
end

M.set_explorer = function(self)
  local title = '%= NERD_tree_1 %='
  return self.colors.blue .. title
end

Statusline = setmetatable(M, {
  __call = function(self, mode)
    if mode == 'active' then
      return self:set_active()
    end
    if mode == 'inactive' then
      return self:set_inactive()
    end
    if mode == 'explorer' then
      return self:set_explorer()
    end
  end,
})

vim.cmd [[
  augroup Statusline
    autocmd!
    autocmd WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')
    autocmd WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline('inactive')
    autocmd WinEnter,BufEnter,FileType nerdtree,NERD_tree_1 setlocal statusline=%!v:lua.Statusline('explorer')
  augroup END
]]
