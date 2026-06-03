-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
    {
      "ellisonleao/gruvbox.nvim",
      priority = 1000,
      config = true,
      opts = {
        terminal_colors = true,         -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        inverse = true,            -- invert background for search, diffs, statuslines and errors
        contrast = "hard",         -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      }
    },
    { "folke/which-key.nvim", lazy = fase },
    {
      "ibhagwan/fzf-lua",
      dependencies = { "nvim-mini/mini.icons" },
      ---@module "fzf-lua"
      ---@type fzf-lua.Config|{}
      ---@diagnostic disable: missing-fields
      opts = {}
      ---@diagnostic enable: missing-fields
    },
    {
      'https://github.com/wsdjeg/rooter.nvim',
      lazy = false,
      config = true,
      opts = {
        root_patterns = { '.git/' },
        outermost = true,
        enable_cache = true,
        project_non_root = '', -- this can be '', 'home' or 'current'
        enable_logger = true, -- enable runtime log via logger.nvim
        command = 'cd', -- cd, tcd or lcd
      }
    },
    {
      "monaqa/dial.nvim",
      -- lazy-load on keys
      -- mode is `n` by default. For more advanced options, check the section on key mappings
      keys = { "<C-a>", { "<C-x>", mode = "n" } },
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "gruvbox" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
