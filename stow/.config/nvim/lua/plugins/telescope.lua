return {
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- optional but recommended
      { 'nvim-telescope/telescope-fzf-native.nvim',                  build = 'make' },
      -- { 'nvim-telescope/telescope-fzf-native.nvim',                  build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install' },
      { 'https://github.com/tom-anders/telescope-vim-bookmarks.nvim' },
      { 'https://github.com/debugloop/telescope-undo.nvim' },
      {'https://github.com/MattesGroeger/vim-bookmarks'}
    },
    opts = function ()
      local root_patterns = { ".git", "deps.edn" }
      local root_dir = vim.fs.dirname(vim.fs.find(root_patterns, { upward = true })[1])
      require("telescope").load_extension("fzf")
      require('telescope').load_extension('vim_bookmarks')
      require("telescope").load_extension("undo")
      return {
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim",
            "--follow"
          },
          layout_strategy = 'flex',
          layout_config = { height = 0.95, width = 0.95 },
          mappings = {
            i = {
              ["<C-j>"] = require('telescope.actions').move_selection_next,
              ["<C-k>"] = require('telescope.actions').move_selection_previous,
            }
          }
        },
        pickers = {
          live_grep = {
            file_ignore_patterns = { 'node_modules', '.git', '.cpcache', '.clj-kondo', '.lsp' },
            search_dirs = { root_dir },
          },
          buffers = {
            ignore_current_buffer = true,
            sort_lastused = true,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          undo = {
            side_by_side = true
          }
        },
      }
    end,
  }
}
