local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

map('n', 'Q', '<nop>', opts)
map('n', '<C-J>', '<C-W><C-J>', opts)
map('n', '<C-K>', '<C-W><C-K>', opts)
map('n', '<C-L>', '<C-W><C-L>', opts)
map('n', '<C-H>', '<C-W><C-H>', opts)

-- better indenting
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)
