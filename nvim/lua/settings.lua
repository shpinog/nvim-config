local cmd = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec  -- execute Vimscript
local g = vim.g                 -- global variables
local opt = vim.opt             -- global/buffer/windows-scoped

opt.cursorline = false               -- Подсветка строки с курсором
opt.number = true                   -- Включаем нумерацию строк
opt.undofile = true                 -- Возможность отката назад
opt.mouse = 'a'
opt.encoding= 'utf-8'
opt.guifont = {"iosevka", "11" }
opt.swapfile = false
opt.autochdir = true
opt.scrolloff=7
opt.keymap="russian-jcukenwin"
opt.iminsert=0
opt.imsearch=0


opt.termguicolors = true      --  24-bit RGB colors

vim.g.material_style = "oceanic"
vim.cmd[[colorscheme material]]


cmd([[
filetype indent plugin on
syntax enable
]])

-- Проблелы вместо табов

opt.expandtab = true      -- use spaces instead of tabs
opt.smartindent = true    -- autoindent new lines
opt.smarttab = true
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces


