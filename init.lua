--Set <space> as the leader key local and global
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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
  -- An actually good theme which I can read, ahhh being colour blind
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.g.gruvboxf_material_background = 'medium'
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

  -- auto pairing of quotes, brackets, etc.
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
  -- Detect tabstop and shiftwidth automatically
  -- make sure use have a .editorconfig in the root directory that sets
  -- tabstop to 4 otherwise this will be annoying not helpful
  -- good when editing other peoples files though
  { 'tpope/vim-sleuth' },

  -- Shows potential and pending keybinds, useful while still learning
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VeryLazy', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      }
    end,
  },

  -- Lualine for status line
  -- mini has an option, dont think its as good
  -- could be worth checking out https://github.com/famiu/feline.nvim
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'gruvbox-material',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  -- harpoon for better file nav
  { 'ThePrimeagen/harpoon' },

  -- markdown preview
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },

  -- All the lsp things
  require 'plugins.lsp',

  -- Git stuff
  require 'plugins.git',

  -- Plugins from the mini ecosystems
  require 'plugins.mini',

  -- TODO: look into the below things (not in that location anymore)
  --       want to set up auto format and debug stuff
  require 'plugins.debug',
  require 'plugins.telescope',
  require 'plugins.treesitter',
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

-- Set vim options
require 'options'
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
