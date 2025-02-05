return {
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
}
