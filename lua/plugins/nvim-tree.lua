require('nvim-tree').setup({
  open_on_setup = false,
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
map('n', '<F3>', ':NvimTreeToggle<CR>', opts)
