require('nvim-treesitter.configs').setup {
  ensure_installed = { 'go', 'rust', 'lua', 'python', 'make', 'yaml', 'sql', 'proto', 'markdown',
    'gomod', 'gowork', 'regex', 'toml' },
  highlight = {
    enable = true,
    -- disable = {"python"},
  }
}
