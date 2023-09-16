require('nvim-tree').setup({
  open_on_setup = false,
  sort_by = "case_sensitive",
  hijack_cursor = true,
  view = {
    adaptive_size = false,
    side = "left",
    mappings = {
      list = {
        { key = "i", action = "split" },
        { key = "v", action = "vsplit" },
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
