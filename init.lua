--Set <space> as the leader key local and global
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set vim options
require 'options'

-- Set custom keymaps
require 'keymaps'

-- Install Lazy plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration

  -- Git functionality related stuff (for visual representations see plugins.visual)
  require 'plugins.git',

  -- Plugins from the mini ecosystems
  require 'plugins.mini',

  -- All the lsp things
  require 'plugins.lsp',

  -- Visual things (colorscheme, indenting, status line, etc.)
  require 'plugins.visual',

  -- An actually good theme which I can read, ahhh being colour blind
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.g.gruvbox_material_background = 'medium'
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_foreground = 'material'
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },

  -- TODO notes etc.
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },

  -- Comment commends like gc
  { 'numToStr/Comment.nvim', opts = {} },

  require 'plugins.telescope',
  require 'plugins.treesitter',
  {
    'windwp/nvim-autopairs',
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  -- TODO: look into the below things (not in that location anymore)
  --       want to set up auto format and debug stuff

  -- require 'kickstart.plugins.autoformat',
  -- require('plugins.debug'),
}, {})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Configure nvim-cmp
-- require 'plugins.nvim_cmp_config'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
