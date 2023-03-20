-- Check if packer installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd[[
  augroup Packer_aug
  autocmd!
  autocmd BufWritePost plugins.lua PackerSync
  augroup END
]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Supporting plugin for others
  use "nvim-lua/plenary.nvim"

  -- Telescope
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use ({'nvim-telescope/telescope.nvim', branch = '0.1.x'})

  -- ColorScheme
  use 'sainnhe/gruvbox-material'

  -- Tree Sitter
  use({
   'nvim-treesitter/nvim-treesitter',
   run = ':TSUpdate'
  })

  -- split window maximizer
  use "szw/vim-maximizer"

  -- Better Comments
  use "numToStr/Comment.nvim"

  -- Nvim-tree
  use "nvim-tree/nvim-tree.lua"

  -- Dev Icons
  use "kyazdani42/nvim-web-devicons"

  -- lua line
  use "nvim-lualine/lualine.nvim"

  -- lsp autocomplete MAY WANT TO CHANGE THIS IMPLEMENTATION TO A CUSTOM ONE NOT USING LSP-ZERO - look at the log video for this
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = { -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  }

  -- Auto closing brackets etc
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- git signs
  use("lewis6991/gitsigns.nvim")

  -- Sync if not installed
  if packer_bootstrap then
    require('packer').sync()
  end
  
end)
