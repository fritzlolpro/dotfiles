-- lua/plugins/lsp.lua
return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = function ()
      local opts = {
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ruff",
          "ts_ls",
          "gopls",
          "jsonls",
          "yamlls",
        },
        automatic_installation = true,
      }
      require("mason").setup()
      require("mason-lspconfig").setup(opts)
    end,
    config = function (_, opts)
    end,
  },
}
