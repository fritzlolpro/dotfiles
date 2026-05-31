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
        dependencies = { "mason-org/mason.nvim" },

        opts = {},
        config = function(_, opts)
            vim.lsp.enable('lua_ls')
            local lua_ls_config = {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        format = {
                            enable = true, -- включаем встроенный форматтер (значение по умолчанию)
                            -- Можно указать параметры форматирования (необязательно)
                            defaultConfig = {
                                -- Например, отступ = 4 пробела, не использовать табуляцию
                                indent_style = "space",
                                indent_size = "2",

                            }
                        }
                    }
                }
            }
            vim.lsp.config('lua_ls', lua_ls_config)
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
                -- НЕ включаем "rust_analyzer" – он будет через rustaceanvim
            },
            automatic_installation = true,
        },
        config = function(_, opts)
            vim.lsp.enable('lua_ls')
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
            if has_cmp then
                capabilities = cmp_lsp.default_capabilities(capabilities)
            end

            -- Обработчик для всех LSP серверов (единая логика при подключении)
            local on_attach = function(client, bufnr)
                -- Здесь можно настроить горячие клавиши для LSP
                print("LSP attached: " .. client.name)
            end
            -- Настройка каждого сервера индивидуально (или общая)
            require("mason-lspconfig").setup({
                ensure_installed = opts.ensure_installed,
                automatic_installation = opts.automatic_installation,
                -- Этот обработчик вызывается для каждого сервера
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                        })
                    end,
                }
            })
            require("mason").setup()
            require("mason-lspconfig").setup(opts)
        end,
    },
}
