local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require('packer').startup(function(use)



  use {

    'wbthomason/packer.nvim',
    'LnL7/vim-nix',
    'hrsh7th/nvim-cmp',
    'hrsh7th/vim-vsnip',
    'hrsh7th/vim-vsnip-integ',
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
    'kyazdani42/nvim-web-devicons',
    'akinsho/bufferline.nvim', tag = "*",
    'majutsushi/tagbar',
    'cohama/lexima.vim',  -- Закрывает автоматом скобки
    'mattn/emmet-vim', -- Обрамляет строку в теги по ctrl- y + ,A
    'phaazon/hop.nvim',
    'nvim-lualine/lualine.nvim',
    'marko-cerovac/material.nvim', -- Theme material
    'adelarsq/vim-devicons-emoji',
    'ryanoasis/vim-devicons',
    'rcarriga/nvim-notify',
    'jghauser/mkdir.nvim',
    'lewis6991/impatient.nvim', -- speed boost
    "nathom/filetype.nvim", --speed boost
    'dstein64/vim-startuptime',
    'booperlv/nvim-gomove',



  }

require('impatient')


use {
  'karb94/neoscroll.nvim',
  config = function() require('neoscroll').setup() end
}

--Mini Framework
use { 'echasnovski/mini.nvim' }

use {
  'lukas-reineke/indent-blankline.nvim',
  config = function ()
    require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
    }
    end,
}

--SLP Installer

use {
    "williamboman/nvim-lsp-installer",
    {
        "neovim/nvim-lspconfig",
    }
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


------TODO


vim.opt.termguicolors = true


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
require("bufferline").setup{}
require'hop'.setup()
require('lualine').setup()
require("notify").setup()
-- require('mini.completion').setup({})
vim.notify = require("notify")


----Nvim-Tree
require'nvim-tree'.setup { 
update_cwd = true,
actions = {
    open_file = {
        quit_on_open = true,
        }
    }
}
-----

--





  if packer_bootstrap then
    require('packer').sync()
  end
end)


