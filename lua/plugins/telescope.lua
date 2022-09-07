local status, telescope = pcall(require, "telescope")
if (not status) then return end

local builtin = require("telescope.builtin")
local previewers = require('telescope.previewers')
telescope.setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = '> ',
    color_devicons = true,

    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    },
  },
}

telescope.load_extension("ui-select")

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local openTelescopeOnSplit = function(telescope_type)
  vim.cmd('split')
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_win_set_buf(win, buf)
  vim.api.nvim_command('Telescope ' .. telescope_type)
end


map('n', '<leader>fd', '<cmd>Telescope diagnostics<CR>', opts)

map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)

vim.keymap.set('n', '<leader>fdd', function()
  builtin.diagnostics({ bufnr = 0 })
end)

map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)

map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)

vim.keymap.set('n', '<leader>fg', function()
  openTelescopeOnSplit('live_grep')
end, opts)
