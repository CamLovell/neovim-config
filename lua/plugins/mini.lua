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

      require('mini.statusline').setup {
        content = {
          active = function()
            local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
            local git = MiniStatusline.section_git { trunc_width = 40 }
            local diff = MiniStatusline.section_diff { trunc_width = 75 }
            local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
            local lsp = MiniStatusline.section_lsp { trunc_width = 75 }
            local filename = MiniStatusline.section_filename { trunc_width = 140 }
            local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
            local location = MiniStatusline.section_location { trunc_width = 75 }
            local search = MiniStatusline.section_searchcount { trunc_width = 75 }
            local recording = vim.fn.reg_recording()

            return MiniStatusline.combine_groups {
              { hl = mode_hl, strings = { mode } },
              { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
              '%<', -- Mark general truncate point

              -- Shows filename unless a macro recoding is in progress, shows macro instead
              { hl = 'MiniStatuslineFilename', strings = { recording == '' and filename or string.format('Recording @%s', recording) } },
              '%=', -- End left alignment
              { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
              { hl = mode_hl, strings = { search, location } },
            }
          end,
        },
      }

      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
