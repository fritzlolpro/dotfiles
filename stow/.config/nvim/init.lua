vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
-- Поиск с учетом регистра (игнорирование при вводе только строчных букв)
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Меньше перерисовок экрана во время макросов
vim.opt.lazyredraw = true
-- Разрешить Backspace удалять всё, что мы напечатали
vim.opt.backspace = 'indent,eol,start'
-- Всегда показывать строку статуса
vim.opt.laststatus = 2
vim.opt.statusline = '[%n]\\ %<%f%h%m'  -- \\ для экранирования обратного слеша в Lua
-- Включить подсветку синтаксиса
vim.cmd('syntax on')
-- Русская раскладка в нормальном режиме (langmap)
vim.opt.langmap = [[!№\%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!#%&*`qwertyuiop[]asdfghjkl\;'zxcvbnm\,.~QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>]]
-- Отключить проверку орфографии
vim.opt.spell = false
-- Файл с пользовательскими словами (если нужен)
vim.opt.spellfile:append(vim.fn.expand('~/.config/nvim/spell/vimspell.utf-8.add'))
-- Перенос строк без разрыва слов
vim.opt.wrap = true
vim.opt.linebreak = true
-- Системный буфер обмена (unnamedplus для Linux/Wayland)
vim.opt.clipboard = 'unnamedplus'
-- Вид курсора в нормальном режиме (без мигания)
vim.opt.guicursor:append('n:-blinkwait175-blinkoff150-blinkon175')
-- Шрифт в GUI (если актуально, для Neovide и т.п.)
vim.opt.guifont = 'Hack Nerd Font Bold 14'
-- Нумерация строк: абсолютная + относительная
vim.opt.number = true
vim.opt.relativenumber = true
-- Разрешить скрывать изменённые буферы без сохранения
vim.opt.hidden = true
-- Не пищать при ошибках
vim.opt.errorbells = false
-- Настройки табуляции и отступов
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
-- Перенос строк с учётом ширины текста
vim.opt.wrapmargin = 0
vim.opt.textwidth = 120
-- Подсветка результатов поиска
vim.opt.hlsearch = true
-- Не создавать swap-файлы и бэкапы
vim.opt.swapfile = false
vim.opt.backup = false
-- Постоянное undo (с хранением в отдельной папке)
vim.opt.undofile = true
vim.opt.undodir:append(vim.fn.expand('~/.config/nvim/undodir'))
-- Инкрементальный поиск
vim.opt.incsearch = true
-- 24-битные цвета (обязательно для современных тем)
vim.opt.termguicolors = true
-- Отступ от края экрана при скроллинге
vim.opt.scrolloff = 8
-- История команд и уровни undo
vim.opt.history = 1000
vim.opt.undolevels = 1000
-- Формат строк (автоматический перенос по textwidth, запрет разрыва после одного символа)
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
require("config.lazy")
require("config.keymap")()
print("After require")
--vim.o.background = "light" 
vim.cmd([[colorscheme gruvbox]])
