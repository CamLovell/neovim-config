return {
  -- Syntax highlighting for glsl, could be removed? or moved?
  {
    'tikhomirov/vim-glsl',
    event = 'VeryLazy',
    config = function()
      -- GLSL Support
      require('lspconfig').glsl_analyzer.setup {}
    end,
  },
}
