vim.g.mapleader = " "
-- Поиск с учетом регистра (игнорирование при вводе только строчных букв)
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- -- Меньше перерисовок экрана во время макросов
vim.opt.lazyredraw = true
-- -- Разрешить Backspace удалять всё, что мы напечатали
vim.opt.backspace = 'indent,eol,start'
-- -- Всегда показывать строку статуса
vim.opt.laststatus = 2
vim.opt.statusline = '[%n]\\ %<%f%h%m' -- \\ для экранирования обратного слеша в Lua
-- -- Включить подсветку синтаксиса
vim.opt.syntax = "on"
-- vim.cmd('syntax on')
-- -- Русская раскладка в нормальном режиме (langmap)
vim.opt.langmap =
[[!№\%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!#%&*`qwertyuiop[]asdfghjkl\;'zxcvbnm\,.~QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>]]
-- -- Отключить проверку орфографии
vim.opt.spell = false
-- -- Файл с пользовательскими словами (если нужен)
vim.opt.spellfile:append(vim.fn.expand('~/.config/nvim/spell/vimspell.utf-8.add'))
-- -- Перенос строк без разрыва слов
vim.opt.wrap = true
vim.opt.linebreak = true
-- -- Системный буфер обмена (unnamedplus для Linux/Wayland)
vim.opt.clipboard = 'unnamedplus'
-- -- Вид курсора в нормальном режиме (без мигания)
vim.opt.guicursor:append('n:-blinkwait175-blinkoff150-blinkon175')
-- -- Шрифт в GUI (если актуально, для Neovide и т.п.)
vim.opt.guifont = 'Hack Nerd Font Bold 14'
-- -- Нумерация строк: абсолютная + относительная
vim.opt.number = true
vim.opt.relativenumber = true
-- -- Разрешить скрывать изменённые буферы без сохранения
vim.opt.hidden = true
-- -- Не пищать при ошибках
vim.opt.errorbells = false
-- -- Настройки табуляции и отступов
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 0
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.g.editorconfig = false
-- Перенос строк с учётом ширины текста
vim.opt.wrapmargin = 0
vim.opt.textwidth = 120
-- Подсветка результатов поиска
vim.opt.hlsearch = true
-- Не создавать swap-файлы и бэкапы
-- vim.opt.swapfile = false
-- vim.opt.backup = false
-- Постоянное undo (с хранением в отдельной папке)
vim.opt.undofile = true
vim.opt.undodir:append(vim.fn.expand('~/.config/nvim/undodir'))
-- -- Инкрементальный поиск
vim.opt.incsearch = true
-- -- 24-битные цвета (обязательно для современных тем)
vim.opt.termguicolors = true
-- -- Отступ от края экрана при скроллинге
vim.opt.scrolloff = 8
-- -- История команд и уровни undo
vim.opt.history = 1000
vim.opt.undolevels = 1000
-- -- Формат строк (автоматический перенос по textwidth, запрет разрыва после одного символа)
vim.opt.formatoptions:append('t')
vim.opt.formatoptions:remove('l')
-- Кодировка (в Neovim всегда UTF-8, можно опустить)
vim.opt.encoding = 'utf-8'
-- Высота командной строки (для плагинов вроде nvim-cmp)
vim.opt.cmdheight = 2
-- Частота обновления курсора (для плагинов автодополнения)
vim.opt.updatetime = 750
-- Поддержка мыши во всех режимах
vim.opt.mouse = 'a'
-- Не показывать лишние сообщения в меню автодополнения
vim.opt.shortmess:append('c')
-- Вертикальная линейка на 120-й колонке
vim.opt.colorcolumn = '120'
-- Вертикальное отображение diff'а
vim.opt.diffopt:append('vertical')
-- reset vim bookmarks default I will rebind them
vim.g.bookmark_no_default_key_mappings = 1
--
-- The function bellow had an important update I started using vim.keymap.set
-- which uses lua functions directly instead of vim.api.nvim_set_keymap
-- vim.api.nvim_set_keymap(mode, lhs, rhs, options)
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

local function vim_opt_toggle(opt, on, off, name)
  local message = name
  if vim.opt[opt]:get() == off then
    vim.opt[opt] = on
    message = message .. " Enabled"
  else
    vim.opt[opt] = off
    message = message .. " Disabled"
  end
  vim.notify(message)
end

map({ 'n', }, '<leader>l', function () vim_opt_toggle("list", true, false, "List") end,
  { desc = "Toggle list hidden chars" })
map({ 'n', 'i' }, '<F2>', function () vim_opt_toggle("paste", true, false, "Paste") end, { desc = "Toggle paste mode" })

-- AUTOCOMMANDS
-- Сохраняем историю, маркеры, поиск и другие данные между сессиями
vim.opt.shada = "!,'1000,<50,s10,h" -- '1000 = сохранять позиции для 1000 последних файлов
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function ()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lnum, col = mark[1], mark[2]
    if lnum > 1 and lnum <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, { lnum, col })
    else
      vim.notify("Skipped: lnum = " .. lnum, vim.log.levels.WARN)
    end
  end,
})

require("config.lazy")
require("config.keymap")()
--vim.o.background = "light"
vim.cmd([[colorscheme gruvbox]])
