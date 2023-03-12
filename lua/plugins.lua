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

  -- Telescope
  use({
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  })

  -- ColorScheme
  use 'sainnhe/gruvbox-material'

  -- Tree Sitter
  use({
   'nvim-treesitter/nvim-treesitter',
   run = ':TSUpdate'
  })

  -- split window navigation
  use "christoomey/vim-tmux-navigator"

  -- split window maximizer
  use "szw/vim-maximizer"
  
  -- Sync if any changes
  if packer_bootstrap then
    require('packer').sync()
  end
  
end)
