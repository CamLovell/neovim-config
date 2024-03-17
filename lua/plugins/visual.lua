-- This file contains everything relating to the visual nice to haves
-- this includes colorscheme, status lines, indicators etc.
return {
  -- Detect tabstop and shiftwidth automatically
  -- make sure use have a .editorconfig in the root directory that sets
  -- tabstop to 4 otherwise this will be annoying not helpful
  -- good when editing other peoples files though
  {'tpope/vim-sleuth'},

  -- Shows potential and pending keybinds, useful while still learning
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
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

  -- Adds git related signs to the gutter, as well as utilities for managing changes
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  -- An actually good theme which I can read, ahhh being colour blind
  {
    "sainnhe/gruvbox-material",
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

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'gruvbox-material',
        component_separators = '|',
        -- section_separators = '',
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },

  -- TODO notes etc.
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
}
