local utils = require('plugins.lsp.utils')
local map = vim.keymap.set
local options = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = false,
        inlay_hints = {
            auto = true,
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
    hover_actions = {
      auto_focus = false,
    },
    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer

    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        standalone = false,
        capabilities = utils.capabilities,
        on_attach = function(client, bufnr)
          utils.on_attach(client, bufnr)
          map("n", "K", '<cmd>RustHoverActions<CR>' , { buffer = bufnr, noremap=true, silent=true })
          map('n', '<leader>ca', '<cmd>RustCodeAction<CR>', { buffer = bufnr, noremap=true, silent=true })
        end,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(options)
