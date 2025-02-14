--This file is for lsp thingslsp

return {
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- lsp installation automated
      {
        'williamboman/mason.nvim',
        opts = {
          ui = {
            icons = {
              package_installed = '✓',
              package_pending = '➜',
              package_uninstalled = '✗',
            },
          },
        },
      },
      {
        'williamboman/mason-lspconfig.nvim',
        opts = {
          {
            ensure_installed = {
              'stylua',
              'debugpy',
              'prettier',
            },
          },
        },
      },
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Completions
      'saghen/blink.cmp',

      -- Additional lua configuration
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself
          -- many times.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          -- Jump to the implementation of the word under your cursor.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          -- Jump to the type of the word under your cursor.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
          -- Fuzzy find all the symbols in your current document.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          -- Fuzzy find all the symbols in your current workspace
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
          -- Rename the variable under your cursor
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          -- Execute a code action, usually your cursor needs to be on top of an error or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          -- Opens a popup that displays documentation about the word under your cursor
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
          -- INFO: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        end,
      })

      -- Let neovim know the capabilities we have
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities())

      -- Enable the following language servers
      local servers = {
        clangd = {},
        basedpyright = {
          -- Disable semantic tokens because they SUCK (atleast for basedpyright)
          on_init = function(client)
            client.server_capabilities.semanticTokensProvider = nil
          end,

          settings = {
            basedpyright = {
              disableOrganizeImports = true,
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'openFilesOnly',
                typeCheckingMode = 'standard',

                -- Diabble features provided by ruff
                diagnosticSeverityOverrides = {
                  reportUnusedImport = false,
                  reportMissingImports = false,
                  reportMissingTypeStubs = false,
                  reportUnusedVariable = false,
                  reportUnusedFunction = false,
                  reportDuplicateImport = false,
                  reportUnnecessaryCast = false,
                  reportUnnecessaryComparison = false,
                  reportUnnecessaryIsInstance = false,
                  reportUnnecessaryTypeIgnoreComment = false,
                  reportUnreachable = false,
                },
              },
            },
          },
        },

        ruff = {
          init_options = {
            settings = {
              configuration = vim.fn.stdpath 'config' .. '/ruff.toml',
            },
          },
        },
        rust_analyzer = {},
        cmake = {},
        marksman = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Ensure the deired servers are installed and setup mason
      local server_list = vim.tbl_keys(servers or {})
      require('mason-lspconfig').setup {
        ensure_installed = server_list,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
