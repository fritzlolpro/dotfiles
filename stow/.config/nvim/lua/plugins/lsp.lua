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
          "lua_ls",            -- для Lua
          "pyright",           -- для Python (можно заменить на basedpyright)
          "ts_ls",             -- для TypeScript/JavaScript (ранее tsserver)
          "gopls",             -- для Go
          "jsonls",            -- для JSON
          "yamlls",            -- для YAML
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
