return {
  -- auto pairing of quotes, brackets, etc.
  {
    'windwp/nvim-autopairs',
    enabled = false,
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}

      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', function(event)
        local filetype = vim.bo.filetype
        if filetype ~= 'rust' then
          cmp_autopairs.on_confirm_done()(event)
        end
      end)
    end,
  },
}
