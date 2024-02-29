require('lualine').setup{
  options = {
    theme = 'auto',
    section_separators = {'|', '|'},
    component_separators = {'|', '|'},
    icons_enabled = true,
  },
  -- extensions = {'fzf', 'fugitive'}
  --   options = {
  --   icons_enabled = true,
  --   theme = 'auto',
  --   component_separators = { left = '>', right = '<'},
  --   section_separators = { left = '>', right = '<'},
  --   disabled_filetypes = {},
  --   always_divide_middle = true,
  -- },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
      'diff',
      {
        'diagnostics',
        symbols = {error = 'e', warn = 'w', info = 'i', hint = 'h'},
      }
    },
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 1
      }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  -- inactive_sections = {
  --   lualine_a = {},
  --   lualine_b = {},
  --   lualine_c = {'filename'},
  --   lualine_x = {'location'},
  --   lualine_y = {},
  --   lualine_z = {}
  -- },
  -- tabline = {},
  extensions = {'fzf', 'quickfix', 'toggleterm'}
}
