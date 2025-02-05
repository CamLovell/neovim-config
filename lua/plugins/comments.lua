return {
  -- TODO notes etc.
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },

  -- Comment commends like gc
  { 'numToStr/Comment.nvim', opts = {} },
}
