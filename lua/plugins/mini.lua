return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - va)  - [V]isually select [A]round [)]paren
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()
      require('mini.move').setup()

      -- Simple file explorer (with toggle mapped to <leader>fd
      require('mini.files').setup()
      vim.keymap.set('n', '<leader>fd', ':lua if not MiniFiles.close() then MiniFiles.open(...) end<CR>', { desc = 'Open [F]ile [D]irectory' })

      -- simple indent line only showing current scope
      require('mini.indentscope').setup { draw = { delay = 20, animation = require('mini.indentscope').gen_animation.none() } }

      require('mini.statusline').setup()

      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
