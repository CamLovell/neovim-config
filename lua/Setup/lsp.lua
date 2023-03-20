-- Recomended lsp setup
local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

-- Some LSP servers have been installed manually as they do not work here, not too fused right now
lsp.ensure_installed({
  'clangd',
  'cmake',
  'kotlin_language_server',
  'lua_ls',
  'rust_analyzer',
})

lsp.setup()
