local map = vim.api.nvim_set_keymap


local default_opts = {noremap = true, silent = true}


map('v', 'Y', '"+y', default_opts)

--Снять выделение после поиска
--completion
-- map('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   { noremap = true, expr = true })
-- map('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })


-- bufferline
-- map('n', '<Tab>', ':BufferLineCycleNext<CR>', default_opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', default_opts)
map('n', '<C-t><C-n>', ':tabnew<CR>', default_opts) --Tab new
map('n', '<C-t><C-k>', ':bd<CR>', default_opts) --Buffer close
-- <F6> дерево файлов.
map('n', '<F6>', ':NvimTreeRefresh<CR>:NvimTreeFindFileToggle<CR>', default_opts)

--telescope
map('n', '<C-f><C-f>', [[ <cmd>lua require('telescope.builtin').find_files()<cr>]], default_opts)
map('n', '<C-f><C-b>', [[ <cmd>lua require('telescope.builtin').buffers()<cr>]], default_opts)
-- <F4> Поиск слова под курсором
map('n', '<C-f><C-w>', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], default_opts)
-- <S-F4> Поиск слова в модальном окошке
map('n', '<C-f><C-g>', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], default_opts)

-- C-/ HOP
vim.api.nvim_set_keymap('', '<C-/>', "<cmd>lua require'hop'.hint_char1()<cr>", {})

-- Set layout En when leave InsertMode
--
vim.api.nvim_create_autocmd({'CmdlineEnter', 'VimEnter'}, {
  callback = function() os.execute("swaymsg input '*' xkb_switch_layout 0") end,
})

