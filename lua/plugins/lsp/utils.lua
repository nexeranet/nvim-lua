local utils = {}
local map = vim.keymap.set

utils.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

function utils.on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map('n', 'gd', vim.lsp.buf.definition, bufopts)
  map('n', 'K', vim.lsp.buf.hover, bufopts)
  map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  map('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  map('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  map('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  map('n', 'gr', vim.lsp.buf.references, bufopts)
  map('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#3B4252", fg = "#5E81AC" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#3B4252" })
end

return utils
