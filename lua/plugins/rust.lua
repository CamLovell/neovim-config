return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    ['rust-analyzer'] = {
      cargo = {
        features = { 'all' },
      },
    },
  },
  {
    'saecki/crates.nvim',
    tag = 'stable',
    opts = {},
  },
}
