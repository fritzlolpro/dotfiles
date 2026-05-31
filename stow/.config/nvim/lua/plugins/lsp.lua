-- lua/plugins/lsp.lua
return {
    {
        "mason-org/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        opts = {},
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-org/mason.nvim", "https://github.com/VonHeikemen/lsp-zero.nvim" },

        opts = {},
        config = function(_, opts)
            local lsp_zero = require('lsp-zero')

            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                "lua_ls",  -- для Lua
                "pyright", -- для Python (можно заменить на basedpyright)
                "ts_ls",   -- для TypeScript/JavaScript (ранее tsserver)
                "gopls",   -- для Go
                "jsonls",  -- для JSON
                "yamlls",  -- для YAML
            },
            automatic_installation = true,
        },
        config = function(_, opts)
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
            if has_cmp then
                capabilities = cmp_lsp.default_capabilities(capabilities)
            end

            require("mason").setup()
            require("mason-lspconfig").setup(opts)
        end,
    },
}
