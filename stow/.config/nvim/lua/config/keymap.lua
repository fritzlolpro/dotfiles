return function()
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
	-- Telescope: работа с undo историей
	vim.keymap.set("n", "<leader>tut", "<cmd>Telescope undo<cr>", { desc = "Telescope: undo history" })

	-- Telescope: outline на основе ctags для всех буферов
	vim.keymap.set("n", "<leader>tct", function()
		require('telescope').extensions.ctags_outline.outline({ buf = 'all' })
	end, { desc = "Telescope: ctags outline (all buffers)" })

	-- Telescope: поиск строки в корне git-репозитория (требуется функция Find_git_root)
	vim.keymap.set("n", "<leader>tgs", function()
		require('telescope.builtin').grep_string({ cwd = vim.fn['Find_git_root']() })
	end, { desc = "Telescope: grep string in git root" })

	-- Telescope: список буферов
	vim.keymap.set("n", "<leader>tbb", function()
		require('telescope.builtin').buffers()
	end, { desc = "Telescope: list buffers" })

	-- Telescope: список меток (marks)
	vim.keymap.set("n", "<leader>tmm", function()
		require('telescope.builtin').marks()
	end, { desc = "Telescope: list marks" })

	-- Telescope: поиск по справке (help tags)
	vim.keymap.set("n", "<leader>thh", function()
		require('telescope.builtin').help_tags()
	end, { desc = "Telescope: help tags" })

	-- Telescope: главное меню
	vim.keymap.set("n", "<leader>ttt", "<cmd>Telescope<cr>", { desc = "Telescope: open picker" })

	-- Telescope: список команд Neovim
	vim.keymap.set("n", "<leader>tcc", function()
		require('telescope.builtin').commands()
	end, { desc = "Telescope: list commands" })

	-- Telescope: закладки (vim_bookmarks) в текущем файле
	vim.keymap.set("n", "<leader>tmf", function()
		require('telescope').extensions.vim_bookmarks.current_file()
	end, { desc = "Telescope: bookmarks in current file" })
end
