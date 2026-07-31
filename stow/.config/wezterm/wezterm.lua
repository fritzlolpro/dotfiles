-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28
config.cursor_blink_rate = 0

-- or, changing the font size and color scheme.
config.font_size = 10
config.color_scheme = 'GruvboxDarkHard'

config.enable_tab_bar = false

config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font 'Hack'

config.keys = {

  {
    key = 'm',
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'W',
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment,
  },
}

-- Finally, return the configuration to wezterm:
return config

