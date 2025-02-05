return {
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_organize_imports', 'ruff_format' },
        -- rust = { 'rustfmt' },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
      -- formatters = {
      --   ruff = {
      --     command = 'ruff',
      --     args = { 'format', '--line-length', '120', '--force-exclude', '--stdin-filename', '$FILENAME', '-' },
      --   },
      -- },
    },
  },
}
