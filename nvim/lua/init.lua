vim.api.nvim_create_autocmd({"VimEnter"}, {
  callback = function()
    local pid, WINCH = vim.fn.getpid(), vim.loop.constants.SIGWINCH
    vim.defer_fn(function() vim.loop.kill(pid, WINCH) end, 20)
  end
})


require('plugins')
require('settings')
require('keymaps')
require('_mason')
--require('.lsp-installer')
--require('.treesitter')
require('.coc')
