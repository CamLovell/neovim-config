--Set <space> as the leader key local and global
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set custom keymaps
require 'keymaps'
require 'config.lazy'

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

-- Choose where to put help window (bottom or right) depending on window width
-- takes into account window NOT whole session so if you have multiple vertical
-- splits it will open it up on the bottom where it is easier to read
vim.api.nvim_create_autocmd({ 'WinNew', 'BufWinEnter' }, {
  callback = function()
    if vim.bo.filetype ~= 'help' then
      return
    end

    -- Current window (not screen/session) width
    -- local width = vim.api.nvim_win_get_width(0)
    local width = vim.o.columns
    if width > 100 then
      vim.cmd 'wincmd L' -- Move help to the right if screen is wide
    else
      vim.cmd 'wincmd J' -- Move help to the bottom if screen is narrow
    end
  end,
})

-- Set vim options
require 'options'
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
