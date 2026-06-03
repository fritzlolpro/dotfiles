return function ()
  -- LSP
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "goto def" })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "hover code_action" })
  vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "goto implementation" })
  vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "goto references" })
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP rename" })
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code_action" })
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "diagnostic goto_prev" })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "diagnostic goto_next" })
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "diagnostic open_float" })
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format buffer (LSP)" })

  -- Telescope
  -- Telescope: работа с undo историей
  vim.keymap.set("n", "<leader>tu", "<cmd>Telescope undo<cr>", { desc = "Telescope: undo history" })

  -- Telescope: outline на основе ctags для всех буферов
  -- vim.keymap.set("n", "<leader>tct", function ()
  --   require('telescope').extensions.ctags_outline.outline({ buf = 'all' })
  -- end, { desc = "Telescope: ctags outline (all buffers)" })

  -- vim.keymap.set("n", "<leader>tgs", function ()
  --   require('telescope.builtin').grep_string({ cwd = vim.fn['Find_git_root']() })
  -- end, { desc = "Telescope: grep string in git root" })

  vim.keymap.set("n", "<leader>tg", function ()
    require('telescope.builtin').live_grep()
  end, { desc = "Telescope: grep" })

  -- Telescope: список буферов
  vim.keymap.set("n", "<leader>tb", function ()
    require('telescope.builtin').buffers()
  end, { desc = "Telescope: list buffers" })

  -- Telescope: список меток (marks)
  vim.keymap.set("n", "<leader>tm", function ()
    require('telescope.builtin').marks()
  end, { desc = "Telescope: list marks" })

  -- Telescope: поиск по справке (help tags)
  vim.keymap.set("n", "<leader>th", function ()
    require('telescope.builtin').help_tags()
  end, { desc = "Telescope: help tags" })

  -- Telescope: главное меню
  vim.keymap.set("n", "<leader>tt", "<cmd>Telescope<cr>", { desc = "Telescope: open picker" })

  -- Telescope: список команд Neovim
  vim.keymap.set("n", "<leader>tc", function ()
    require('telescope.builtin').commands()
  end, { desc = "Telescope: list commands" })

  -- Telescope: project / git files
  vim.keymap.set("n", "<leader>tp", function ()
    require('telescope.builtin').git_files()
  end, { desc = "Telescope: project files" })

  -- Telescope: file history / old files
  vim.keymap.set("n", "<leader>to", function ()
    require('telescope.builtin').oldfiles()
  end, { desc = "Telescope: oldfiles" })

  -- Telescope: sessions
  vim.keymap.set("n", "<leader>ts", function ()
    require('telescope').extensions.possession.list()
  end, { desc = "Telescope: sessions" })

  -- Telescope: закладки (vim_bookmarks) в текущем файле
  vim.keymap.set("n", "<leader>tm", function ()
    require('telescope').extensions.vim_bookmarks.current_file()
  end, { desc = "Telescope: bookmarks in current file" })


  -- Move move lines
  -- Перемещение строки под курсором (Normal mode)
  vim.keymap.set('n', '<A-Up>', ':m-2<CR>', { desc = 'Move current line up' })
  vim.keymap.set('n', '<A-Down>', ':m+<CR>', { desc = 'Move current line down' })

  -- Перемещение выделенных строк (Visual mode)
  vim.keymap.set('v', '<A-Up>', ":m-2<CR>gv", { desc = 'Move selected lines up' })
  vim.keymap.set('v', '<A-Down>', ":m+<CR>gv", { desc = 'Move selected lines down' })

  -- Перемещение строки в Insert mode (выход из режима, перемещение, возврат)
  vim.keymap.set('i', '<A-Up>', '<Esc>:m-2<CR>a', { desc = 'Move current line up in insert' })
  vim.keymap.set('i', '<A-Down>', '<Esc>:m+<CR>a', { desc = 'Move current line down in insert' })

  -- sessions
  vim.keymap.set("n", "<leader>ss", ":SSave<CR>", { desc = "Session save" })
  vim.keymap.set("n", "<leader>sl", ":SLoad ", { desc = "Session load" })
  vim.keymap.set("n", "<leader>sa", ":SList<CR>", { desc = "Session avaliable list" })
  vim.keymap.set("n", "<leader>sd", ":SDelete ", { desc = "Session delete" })
end
