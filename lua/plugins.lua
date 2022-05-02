
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)



  use {

    'wbthomason/packer.nvim',
    'LnL7/vim-nix',
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/vim-vsnip',
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
    'williamboman/nvim-lsp-installer',
    'kyazdani42/nvim-web-devicons',
    'akinsho/bufferline.nvim', tag = "*",
    'majutsushi/tagbar',
    'cohama/lexima.vim',  -- Закрывает автоматом скобки
    'mattn/emmet-vim', -- Обрамляет строку в теги по ctrl- y + ,A
    'ms-jpq/coq_nvim',
    'phaazon/hop.nvim',
    'nvim-lualine/lualine.nvim',
    'marko-cerovac/material.nvim', -- Theme material
    'adelarsq/vim-devicons-emoji',
    'rcarriga/nvim-notify',
    'jghauser/mkdir.nvim',

  }




-- Better escape
use {
  "max397574/better-escape.nvim",
  config = function()
    require("better_escape").setup()
  end,
}


--Telescope
 use { 'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter'} },
    config = function() require'telescope'.setup {} end, }    


--- Comment
use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
require('Comment').setup()

-- Alpha-nvim
use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
}

-- nvim-tree
use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
}

require'nvim-tree'.setup { 
update_cwd = true,
actions = {
    open_file = {
        quit_on_open = true,
        }
    }
}

------TODO


local lsp = require "lspconfig"
local coq = require "coq"

lsp.tsserver.setup{}
lsp.tsserver.setup(coq.lsp_ensure_capabilities{})
vim.cmd('COQnow -s')
vim.opt.termguicolors = true
require("bufferline").setup{}
--###
  local status_ok, alpha = pcall(require, "alpha")
  if not status_ok then
    return
  end

  theme_ok, alpha_theme = pcall(require, "alpha.themes.startify")

 if not theme_ok then

 end

 alpha.setup(alpha_theme.config)


--Start Plugins
require('telescope').setup{}
require'hop'.setup()
require('lualine').setup()
require("notify").setup()
vim.notify = require("notify")

--





  if packer_bootstrap then
    require('packer').sync()
  end
end)

