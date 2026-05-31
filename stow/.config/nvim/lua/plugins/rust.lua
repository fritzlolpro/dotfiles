-- lua/plugins/rust.lua
return {
  {
    "mrcjkb/rustaceanvim",
    version = "^9",   -- стабильная версия
    lazy = false,
    config = function()
      vim.g.rustaceanvim = {
        -- Инструменты
        tools = {
          enable_clippy = true,        -- автозапуск clippy при сохранении
          executor = "termopen",       -- как запускать cargo команды
        },
        -- Настройки сервера rust-analyzer
        server = {
          on_attach = function(client, bufnr)
            -- Вы можете переопределить или расширить клавиши для rust
            vim.keymap.set("n", "<leader>rr", ":RustRun<CR>", { buffer = bufnr })
            vim.keymap.set("n", "<leader>rt", ":RustTest<CR>", { buffer = bufnr })
            vim.keymap.set("n", "<leader>a", function() vim.cmd.RustLsp('codeAction') end,
            { silent = true, buffer = bufnr, desc = "code actions" })
            vim.keymap.set( "n", "K",  function() vim.cmd.RustLsp({'hover', 'actions'}) end,
            { silent = true, buffer = bufnr, desc = "hover actions" })
          end,
          default_settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              -- checkOnSave = { command = "clippy" },
            },
          },
        },
        -- Отключаем встроенный lspconfig (чтобы не было конфликта)
        dap = { autoload = true },   -- если не используете отладчик
      }
    end,
  },
}
