local map = vim.api.nvim_set_keymap

local default_opts = {noremap = true, silent = true}

map('v', 'Y', '"+y', default_opts)
--Снять выделение после поиска



--NeoScroll
local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['<C-w>'] = {'scroll', {'-0.10', 'false', '100'}}
t['<C-e>'] = {'scroll', { '0.10', 'false', '100'}}

require('neoscroll.config').set_mappings(t)

--completion COC



--nvim-gomove
require("gomove").setup {
  -- whether or not to map default key bindings, (true/false)
  map_defaults = false,
  -- whether or not to reindent lines moved vertically (true/false)
  reindent = true,
  -- whether or not to undojoin same direction moves (true/false)
  undojoin = true,
  -- whether to not to move past end column when moving blocks horizontally, (true/false)
  move_past_end_col = false,
}

local map = vim.api.nvim_set_keymap


map( "x", "<S-h>", "<Plug>GoVSMLeft", {} )
map( "x", "<S-j>", "<Plug>GoVSMDown", {} )
map( "x", "<S-k>", "<Plug>GoVSMUp", {} )
map( "x", "<S-l>", "<Plug>GoVSMRight", {} )

map( "x", "<C-h>", "<Plug>GoVSDLeft", {} )
map( "x", "<C-j>", "<Plug>GoVSDDown", {} )
map( "x", "<C-k>", "<Plug>GoVSDUp", {} )
map( "x", "<C-l>", "<Plug>GoVSDRight", {} )

-- bufferline
-- map('n', '<Tab>', ':BufferLineCycleNext<CR>', default_opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', default_opts)
map('n', '<C-t><C-n>', ':tabnew<CR>', default_opts) --Tab new
map('n', '<C-t><C-k>', ':bd<CR>', default_opts) --Buffer close
-- <F6> дерево файлов.
map('n', '<F6>', ':NvimTreeRefresh<CR>:NvimTreeFindFileToggle<CR>', default_opts)

--telescope
map('n', '<C-f><C-f>', [[ <cmd>lua require('telescope.builtin').find_files()<cr>]], default_opts)
map('n', '<C-f><C-e>', [[ <cmd>lua require('telescope.builtin').oldfiles()<cr>]], default_opts)
map('n', '<C-f><C-b>', [[ <cmd>lua require('telescope.builtin').buffers()<cr>]], default_opts)
-- <F4> Поиск слова под курсором
map('n', '<C-f><C-w>', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], default_opts)
-- <S-F4> Поиск слова в модальном окошке
map('n', '<C-f><C-g>', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], default_opts)

-- C-/ HOP
vim.api.nvim_set_keymap('', '<C-/>', "<cmd>lua require'hop'.hint_char1()<cr>", {})

-- Set layout En when leave InsertMode
--
vim.api.nvim_create_autocmd({'InsertLeave', 'VimEnter'}, {
  callback = function() os.execute("swaymsg input '*' xkb_switch_layout 0") end,
})

require'mapx'.setup{ global = "skip" }

nmap("H", "b")
nmap("L", "e")

--yanky.nvim
vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set({"n","x"}, "y", "<Plug>(YankyYank)")

map('n', '<C-p>', [[ <cmd>lua require("telescope").extensions.yank_history.yank_history()<CR>]], default_opts)


require("telescope").load_extension("yank_history")

local utils = require("yanky.utils")
local mapping = require("yanky.telescope.mapping")

require("yanky").setup({
   highlight = {
    on_put = true,
    on_yank = true,
    timer = 100,
  },
})


