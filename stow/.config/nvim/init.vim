set ignorecase smartcase
set lazyredraw
set backspace=indent,eol,start
set laststatus=2
set statusline=[%n]\ %<%f%h%m
"set statusline=[%n]\
syntax on
set langmap=!№\\%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!#%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
"setlocal spell spelllang=ru_yo,en_us
set nospell
set spellfile=~/.config/nvim/spell/vimspell.utf-8.add
set wrap linebreak
set clipboard=unnamedplus
set guicursor+=n:-blinkwait175-blinkoff150-blinkon175
set guifont=Hack\ Nerd\ Font\ Bold\ 14
set number relativenumber
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set wrapmargin=0
set tw=120
set shiftwidth=2
set autoindent
set copyindent
set expandtab
set smartindent
set nu
set smartcase
set smarttab
set hlsearch
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set history=1000
set undolevels=1000
set formatoptions+=t
set encoding=UTF-8
set fileencodings=utf-8,cp1251,koi8-r,cp866

set formatoptions-=l
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=750
set mouse=a
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=120
set diffopt+=vertical

" set pastetoggle=<F2>
set sessionoptions-=options

"highlight ColorColumn ctermbg=0 guibg=lightgrey

" set autochdir and disable auto-vim-rooter
set autochdir


let g:rooter_cd_cmd="lcd"
let g:rooter_manual_only = 1
let $FZF_DEFAULT_COMMAND = 'find .'

" CTRL-A CTRL-Q to select all and build quickfix list

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
let mapleader = " "


" AUTOCLOSE TAGS
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'jsx,html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'"

" twins of word under cursor:
let g:vim_current_word#highlight_twins = 1
" the word under cursor:
let g:vim_current_word#highlight_current_word = 1

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1
let g:nerdtreeignore = ['^node_modules$']
let g:ctrlsf_ackprg = '/usr/local/bin/rg'
"let g:ctrlsf_winsize = '100'
let g:vrfr_rg = 'true'


" NETRW FILE MANAGER
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 30
hi! link netrwMarkFile Search
let g:netrw_bufsettings = 'noma nu nobl nowrap ro'

let g:fzf_layout = { 'down': '~50%' }
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window':  { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }}

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_RgConfig = [
        \ "--max-columns=150",
        \ "--glob=!git/*",
        \ "--hidden",
    \ ]

let g:coc_global_extensions = [
  \ 'coc-phpls',
  \ 'coc-pairs',
  \ 'coc-cssmodules',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-lua',
  \ 'coc-prettier',
  \ 'coc-tsserver',
  \ 'coc-pyright',
  \ 'coc-rust-analyzer'
  \ ]

let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 79,
    \ 'x': 1,
    \ 'y': 88,
    \ 'z': 45,
    \ 'warning': 80,
    \ 'error': 80,
    \ }

let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'z', 'error', 'warning' ]
  \ ]
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline_powerline_fonts = 1
" to only show the tail, e.g. a branch 'feature/foo' becomes 'foo', use
"let g:airline#extensions#branch#format = 1
" to truncate all path sections but the last one, e.g. a branch
" 'foo/bar/baz' becomes 'f/b/baz', use
let g:airline#extensions#branch#format = 2
"let g:airline_stl_path_style = 'short'
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#show_coc_status = 0
function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode'])
endfunction
autocmd VimEnter * call AirlineInit()

function! Find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

let projectDir = Find_git_root()

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" vim-plug conditional activation
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, {'on': [], 'for': []})
endfunction


call plug#begin('~/.config/nvim/plugged')
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " Plug 'dense-analysis/ale'
  Plug 'williamboman/mason.nvim'
  Plug 'https://github.com/tpope/vim-unimpaired'
  Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
  Plug 'alvan/vim-closetag'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'dominikduda/vim_current_word'
  Plug 'morhetz/gruvbox'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-utils/vim-man'
  Plug 'mbbill/undotree'
  Plug 'sheerun/vim-polyglot'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-peekaboo'
  Plug 'tomarrell/vim-npr'
  Plug 'https://github.com/nvie/vim-togglemouse'
  Plug 'https://github.com/tpope/vim-surround'
  Plug 'https://github.com/ap/vim-css-color'
  Plug 'zivyangll/git-blame.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'airblade/vim-rooter'
  Plug 'dyng/ctrlsf.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'flazz/vim-colorschemes'
  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'jiangmiao/auto-pairs'
  Plug 'https://github.com/AndrewRadev/tagalong.vim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'https://github.com/fritzlolpro/harpoon.git'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  Plug 'rbgrouleff/bclose.vim'
  Plug 'francoiscabrol/ranger.vim'
  Plug 'windwp/nvim-spectre'
  Plug 'kdheepak/lazygit.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'https://github.com/p00f/nvim-ts-rainbow'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  Plug 'https://github.com/tom-anders/telescope-vim-bookmarks.nvim'
  Plug 'nvim-treesitter/nvim-treesitter-context'
  " Plug 'phaazon/hop.nvim'
  Plug 'https://github.com/tpope/vim-commentary'
  Plug 'Yilin-Yang/vim-markbar'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  Plug 'rust-lang/rust.vim'
  Plug 'https://github.com/debugloop/telescope-undo.nvim'
  Plug 'https://github.com/kevinhwang91/nvim-bqf'
  Plug 'https://github.com/andreasvc/vim-256noir'
call plug#end()

"treesitter
"packadd nvim-treesitter
lua <<EOF

-- TREESITTER
require'nvim-treesitter.configs'.setup {
  --ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {"rust",  "php","dockerfile", "lua", "typescript", "json", "javascript", "html", "jsdoc", "vue", "bash", "tsx", "dockerfile", "regex", "vim", "make", "c"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true
  },
  fold = {
    enable = true,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
}
-- TRESITTER-CONTEXT Sticky Scroll
require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 1, -- How many lines the window should span. Values <= 0 mean no limit.
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class',
            'function',
            'method',
            -- 'for', -- These won't appear in the context
            -- 'while',
            -- 'if',
            -- 'switch',
            -- 'case',
        },
        -- Example for a specific filetype.
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        --   rust = {
        --       'impl_item',
        --   },
    },
    exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true,
    },

}
-- HARPOON
require("harpoon").setup({
    global_settings = {
        save_on_change = true,
        global_project = vim.fn['Find_git_root']()
    },
})

-- TELESCOPE
require('telescope').setup({
  defaults = {
      vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim"
    },
      layout_strategy = 'flex',
      layout_config = { height = 0.95, width = 0.95 },
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        --["<C-h>"] = "which_key"
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
     buffers = {
            ignore_current_buffer = true,
            sort_lastused = true,
        },
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        },
        undo = {
          side_by_side = true
        }
    }
})
require('telescope').load_extension('fzf')

-- TELESCOPE UNDO TREE
require("telescope").load_extension("undo")
vim.keymap.set("n", "<leader>tut", "<cmd>Telescope undo<cr>")

vim.api.nvim_set_keymap('n',  '<leader>tct', [[
    <cmd>lua require('telescope').extensions.ctags_outline.outline({buf='all'})<cr>
]], {noremap = true})

vim.api.nvim_set_keymap('n',  '<leader>tgs', [[
    <cmd>lua require'telescope.builtin'.grep_string({cwd=vim.fn['Find_git_root']()})<cr>
]], {noremap = true})

vim.api.nvim_set_keymap('n',  '<leader>tbb', [[
    <cmd>lua require'telescope.builtin'.buffers()<cr>
]], {noremap = true})

vim.api.nvim_set_keymap('n',  '<leader>thh', [[
    <cmd>lua require'telescope.builtin'.help_tags()<cr>
]], {noremap = true})

vim.api.nvim_set_keymap('n',  '<leader>ttt', [[
    <cmd>Telescope<cr>
]], {noremap = true})

vim.api.nvim_set_keymap('n',  '<leader>tcc', [[
    <cmd>lua require'telescope.builtin'.commands()<cr>
]], {noremap = true})

vim.api.nvim_set_keymap('n',  '<leader>tmm', [[
    <cmd>lua require('telescope').extensions.vim_bookmarks.all({tail_path=false})<cr>
]], {noremap = true})

vim.api.nvim_set_keymap('n',  '<leader>tmf', [[
<cmd>lua require('telescope').extensions.vim_bookmarks.current_file()<cr>
]], {noremap = true})

-- SPECTRE search and replace
require('spectre').setup({
  find_engine = {
      -- rg is map with finder_cmd
      ['rg'] = {
        cmd = "rg",
        -- default args
        args = {
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
        } ,
        options = {
          ['ignore-case'] = {
            value= "--ignore-case",
            icon="[I]",
            desc="ignore case"
          },
          ['hidden'] = {
            value="--hidden",
            desc="hidden file",
            icon="[H]"
          },
          ['multiline'] = {
            value="--multiline",
            desc="multi line",
            icon="[M]"
          }
          -- you can put any rg search option you want here it can toggle with
          -- show_option function
        }
      },
      ['ag'] = {
        cmd = "ag",
        args = {
          '--vimgrep',
          '-s'
        } ,
        options = {
          ['ignore-case'] = {
            value= "-i",
            icon="[I]",
            desc="ignore case"
          },
          ['hidden'] = {
            value="--hidden",
            desc="hidden file",
            icon="[H]"
          },
        },
      },
    },
})

vim.api.nvim_set_keymap('n', '<Leader>ssg', [[
    <cmd>lua require('spectre').open({cwd = vim.fn['Find_git_root']()})<CR>
]], {noremap = true, silent = true})


--search current word
vim.api.nvim_set_keymap('n', '<leader>ssw', [[
    <cmd>lua require('spectre').open_visual({cwd = vim.fn['Find_git_root'](), select_word=true}) <CR>
]], {noremap = true})

vim.api.nvim_set_keymap('v', '<leader>ssv', [[
    <cmd>lua require('spectre').open_visual() <CR>
]], {noremap = true})

--  search in current file
vim.api.nvim_set_keymap('n', '<leader>ssf', [[
    <cmd>lua require('spectre').open_file_search() <CR>
]], {noremap = true})

-- NVIM HOP
-- require'hop'.setup{
--   keys = 'etovxqpdygfblzhckisuran'
-- }
-- vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
-- vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
-- vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
-- vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})
require("mason").setup({})
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- vim.keymap.set("n", "K", function()
    --   vim.lsp.buf.hover()
    -- end, { desc = "Hover" })
    -- vim.keymap.set("n", "<leader>gd", function()
    --   vim.lsp.buf.definition()
    -- end, { desc = "Go to definition" })
    -- vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
    -- vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    -- vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<leader>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    -- vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    -- vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    -- vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
    -- vim.keymap.set('n', '<leader>cf', function()
    --   vim.lsp.buf.format { async = true }
    -- end, opts)
  end,
})
EOF

" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr><TAB>
"            \ pumvisible() ? "\<C-n>" :
"            \ <SID>check_back_space() ? "\<TAB>" :
"            \ coc#refresh()
"
"inoremap <silent><expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"hi CocSearch ctermfg=12 guifg=#18A3FF
"hi CocMenuSel ctermbg=109 guibg=#13354A
    "
" GoTo coc code navigation.
inoremap <silent><expr><C-space> coc#refresh()
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)
nmap <leader>cf :CocCommand prettier.formatFile<CR>
" nmap <leader>cf :CocCommand eslint.executeAutofix<CR>
nmap <leader>ca <Plug>(coc-codeaction)
nnoremap <leader>cr :CocRestart<CR>

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

"harpoon
nnoremap <silent><leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
"nnoremap <silent><leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <silent><leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <silent><leader>5 :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <silent><leader>tu :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <silent><leader>te :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <silent><leader>cu :lua require("harpoon.term").sendCommand(1, 1)<CR>
nnoremap <silent><leader>ce :lua require("harpoon.term").sendCommand(1, 2)<CR>

" -- VIM MARKBAR
let g:markbar_width = 50


" -- VIM PEEKABOO REGISTER BAR
let g:peekaboo_window = "vert bo 50new"

" -- RUST stuff
let g:rustfmt_emit_files = 1

"markdown .md autopreview
"nmap <leader><C-s> <Plug>MarkdownPreview

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

nmap <leader>pa <cmd>:let @" = expand("%:p")<cr>
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <C-p> :ProjectFiles<CR>
nnoremap <Leader>pf :Files %:p:h<CR>
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>fp :echo expand('%:p')<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d
inoremap <C-c> <esc>
nnoremap <Leader>gb :<C-u>call gitblame#echo()<CR>
nmap <silent> ,/ :nohlsearch<CR>
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP
nnoremap j gj
nnoremap k gk
"
" Restore last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"
" NERDTree
"let NERDTreeShowHidden = 1
"let NERDTreeMinimalUI = 0
"nnoremap <leader>bb :NERDTreeToggle<CR>
"nnoremap <leader>bf :NERDTreeFind<CR>

" NVIMtree
nnoremap <leader>ntt :NvimTreeToggle<CR>
nnoremap <leader>ntf :NvimTreeFindFile<CR>


" Sweet Sweet FuGITive
nmap <leader>gf :diffget //3<CR>
nmap <leader>gj :diffget //2<CR>
"nmap <leader>gs :G<CR>
" setup mapping to call :LazyGit
nnoremap <silent> <leader>lg :LazyGit<CR>
"
"move line under cursor with keys
vnoremap <A-Up> :m-2<CR>
vnoremap <A-Down> :m+<CR>
nnoremap <A-Up> :m-2<CR>
nnoremap <A-Down> :m+<CR>
inoremap <A-Up> <Esc>:m-2<CR>
inoremap <A-Down> <Esc>:m+<CR>

nnoremap <leader>ss :mks! ~/Documents/programming/vim-sessions/session.vim<CR>
nnoremap <leader>sr :so ~/Documents/programming/vim-sessions/session.vim<CR>

tnoremap <Esc> <C-\><C-n>

" Colors: {{{
" Use truecolor in the terminal, when it is supported
if has('termguicolors')
  set termguicolors
endif

let g:gruvbox_guisp_fallback = "bg"
" Changes dark mode contrast. Overrides g:gruvbox_contrast option. Possible values are soft, medium and hard.
let g:gruvbox_contrast_dark = "hard"
set background=dark
" colorscheme 256_noir
" Change highlighting of cursor line when entering/leaving Insert Mode
set cursorline
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
autocmd vimenter * ++nested colorscheme gruvbox
" autocmd vimenter * ++nested colorscheme sublimemonokai
" }}}


" define a command which runs ripgrep in the root directory
" as determined by rooter
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --glob '!node_modules/*' --no-heading --color=always --smart-case " . shellescape(<q-args>), 1,    fzf#vim#with_preview({"dir": FindRootDirectory(), 'options': '--delimiter : --nth 4..'}))

command! -bang -nargs=? -complete=dir GitFiles call fzf#vim#gitfiles(shellescape(<q-args>), fzf#vim#with_preview({'options': '-i'}), <bang>0)

command! ProjectFiles execute 'GitFiles' Find_git_root()

if executable('rg')
    let g:rg_derive_root='true'
endif


function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd BufWritePre * :call TrimWhitespace()
set showtabline=2  " 0, 1 or 2; when to use a tab pages line
set tabline=%!MyTabLine()  " custom tab pages line
function MyTabLine()
  let s = '' " complete tabline goes here
  " loop through each tab page
  for t in range(tabpagenr('$'))
    " set highlight for tab number and &modified
    let s .= '%#TabLineSel#'
    " set the tab page number (for mouse clicks)
    let s .= '%' . (t + 1) . 'T'
    " set page number string
    let s .= t + 1 . ':'
    " get buffer names and statuses
    let n = ''  "temp string for buffer names while we loop and check buftype
    let m = 0  " &modified counter
    let bc = len(tabpagebuflist(t + 1))  "counter to avoid last ' '
    " loop through each buffer in a tab
    for b in tabpagebuflist(t + 1)
      " buffer types: quickfix gets a [Q], help gets [H]{base fname}
      " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
      if getbufvar( b, "&buftype" ) == 'help'
        let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
      elseif getbufvar( b, "&buftype" ) == 'quickfix'
        let n .= '[Q]'
      else
        let n .= pathshorten(bufname(b))
      endif
      " check and ++ tab's &modified count
      if getbufvar( b, "&modified" )
        let m += 1
      endif
      " no final ' ' added...formatting looks better done later
      if bc > 1
        let n .= ' '
      endif
      let bc -= 1
    endfor
    " add modified label [n+] where n pages in tab are modified
    if m > 0
      let s .= '[' . m . '+]'
    endif
    " select the highlighting for the buffer names
    " my default highlighting only underlines the active tab
    " buffer names.
    if t + 1 == tabpagenr()
      let s .= '%#TabLine#'
    else
      let s .= '%#TabLineSel#'
    endif
    " add buffer names
    let s .= n
    " switch to no underlining and add final space to buffer list
    let s .= '%#TabLineSel#' . ' '
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLineFill#%999Xclose'
  endif
  return s
endfunction

