local nvim_lsp = require('lspconfig')
local win = require('lspconfig.ui.windows')
local _default_opts = win.default_opts

win.default_opts = function(options)
  local opts = _default_opts(options)
  opts.border = 'single'
  return opts
end

require('lsp_signature').setup({
  hint_prefix = '',
  hint_enable = false,
})

local map = vim.keymap.set
local opts = { noremap=true, silent=true }

vim.diagnostic.config({ signs=true })

map('n', '<leader>e', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', '<leader>q', vim.diagnostic.setloclist, opts)

require('plugins.lsp.rust')
require('plugins.lsp.go')
require('plugins.lsp.lua')
-- require('plugins.lsp.python')
