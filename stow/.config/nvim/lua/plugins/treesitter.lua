return {
		{
			'nvim-treesitter/nvim-treesitter',
			lazy = false,
			build = ':TSUpdate',
			opts = {
			 ensure_installed = {"rust",  "php", "lua", "typescript", "json", "javascript", "html", "jsdoc", "vue", "bash", "tsx", "dockerfile", "regex", "vim", "make", "c"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
			 sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
			 ignore_install = {}, -- List of parsers to ignore installing
			 highlight = {
				 enable = true,              -- false will disable the whole extension
				 disable = {},  -- list of language that will be disabled
			 },
			 indent = {
				 enable = true
			 },
			 fold = {
				 enable = true,
			 },
			 rainbow = {
				 enable = true,
				 extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
				 max_file_lines = nil, -- Do not enable for files with more than n lines, int
			 },
			},
			dependencies = {
							{ "windwp/nvim-ts-autotag" },
				},
			config = function(_, opts)
					require('nvim-treesitter').setup(opts)
					vim.api.nvim_create_autocmd('FileType', {
						pattern = '{"rust",  "php", "lua", "typescript", "json", "javascript", "html", "jsdoc", "vue", "bash", "tsx", "dockerfile", "regex", "vim", "make", "c"}',
						callback = function()
							vim.treesitter.start()
						end,
					})
			end,
		}
}
