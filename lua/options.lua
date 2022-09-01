local g = vim.g
local o = vim.opt
-- local cmd = vim.cmd
-- local exec = vim.api.nvim_exec

local hl = function(thing, opts)
  vim.api.nvim_set_hl(0, thing, opts)
end

g.mapleader = ','
o.cursorline = true
o.termguicolors = true
o.clipboard = 'unnamedplus'
o.nu = true
o.relativenumber = false
o.hidden = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.wrap = false
o.hidden = true
o.swapfile = false
o.backup = false
o.hlsearch = false
o.incsearch = true
o.scrolloff = 8
