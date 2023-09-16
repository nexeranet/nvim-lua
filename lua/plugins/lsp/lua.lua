local utils = require('plugins.lsp.utils')
require'lspconfig'.sumneko_lua.setup {
  on_attach = function(client, bufnr)
    utils.on_attach(client, bufnr)
  end,
  capabilities = utils.capabilities,
  -- cmd = {'/home/oleh/code/lua-language-server/bin/lua-language-server'},
  cmd = {'/opt/homebrew/bin/lua-language-server'},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
