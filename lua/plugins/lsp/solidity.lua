local utils = require('plugins.lsp.utils')

require'lspconfig'.solidity.setup{
  on_attach = function(client, bufnr)
    utils.on_attach(client, bufnr)
  end,
  capabilities = utils.capabilities
}
