local wezterm = require 'wezterm'

return {
  color_scheme = 'embark',
  font = wezterm.font { family = 'JetBrains Mono', weight = 'Medium' },
  font_size = 13,
  window_padding = {
    left = '0.5cell',
    right = '0.5cell',
    top = '0.1cell',
    bottom  = 0,
  }
}
