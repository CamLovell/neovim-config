return {
  -- Lualine for status line
  -- mini has an option, dont think its as good
  -- could be worth checking out https://github.com/famiu/feline.nvim
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    enabled = false,
    opts = {
      options = {
        icons_enabled = true,
        theme = 'gruvbox-material',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
}
