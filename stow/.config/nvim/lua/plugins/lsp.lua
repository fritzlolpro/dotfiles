-- lua/plugins/lsp.lua
return {
  -- Управление внешними LSP серверами/линтерами/форматтерами
  {
    "williamboman/mason.nvim",
    cmd = "Mason", -- ленивая загрузка по команде :Mason
    build = ":MasonUpdate",
    opts = {},
  },

  -- Мост для lspconfig
  {"neovim/nvim-lspconfig", dependencies = {"williamboman/mason.nvim"}},

  -- Автоматическое подключение серверов из Mason в lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      -- Автоматически устанавливать серверы для перечисленных языков
      ensure_installed = {
        "lua_ls",      -- для Lua
        "pyright",     -- для Python (можно заменить на basedpyright)
        "ts_ls",       -- для TypeScript/JavaScript (ранее tsserver)
        "gopls",       -- для Go
        "jsonls",      -- для JSON
        "yamlls",      -- для YAML
        -- НЕ включаем "rust_analyzer" – он будет через rustaceanvim
      },
      -- Автоматически подключать любой сервер, который установлен и поддерживается
      automatic_installation = true,
    },
    config = function(_, opts)
      require("mason").setup()
      require("mason-lspconfig").setup(opts)

      -- Базовые возможности LSP (используются для автодополнения)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- Если установлен nvim-cmp, расширяем capabilities для автодополнения
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
    end,
  },
}
