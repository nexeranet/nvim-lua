local cmp = require('cmp')
local lspkind = require('lspkind')

-- local has_words_before = function()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
-- end

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
    })
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },

    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
    -- ['<Tab>'] = function(fallback)
    --   if not cmp.select_next_item() then
    --     if vim.bo.buftype ~= 'prompt' and has_words_before() then
    --       cmp.complete()
    --     else
    --       fallback()
    --     end
    --   end
    -- end,
    --
    -- ['<S-Tab>'] = function(fallback)
    --   if not cmp.select_prev_item() then
    --     if vim.bo.buftype ~= 'prompt' and has_words_before() then
    --       cmp.complete()
    --     else
    --       fallback()
    --     end
    --   end
    -- end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = "treesitter" },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  })
})
