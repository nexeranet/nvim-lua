local utils = require('plugins.lsp.utils')
local map = vim.keymap.set

require'lspconfig'.gopls.setup{
  on_attach = function(client, bufnr)
    utils.on_attach(client, bufnr)
    map('n', '<leader>ca', '<cmd>GoCodeAction<CR>', { buffer = bufnr, noremap=true, silent=true })
    map('n', '<leader>l', '<cmd>GoLint<CR>', { buffer = bufnr, noremap=true, silent=true })
  end,
  capabilities = utils.capabilities
}
