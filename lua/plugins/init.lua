local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clm one', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup {
  function(use)

    -- BASE
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'

    --  AUTOCOMPLETE ENGINE
    use {
      'hrsh7th/nvim-cmp',
      config = function()
        require('plugins.cmp')
      end
    }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'

    -- LSP
    use {
      'neovim/nvim-lspconfig',
      config = function()
        require('plugins.lsp')
      end
    }
    use 'ray-x/lsp_signature.nvim' -- show function signature on type
    use 'onsails/lspkind-nvim'
    use 'simrat39/rust-tools.nvim'

    --SNIPPERTS
    -- use 'rafamadriz/friendly-snippets'
    -- use {
    --   'L3MON4D3/LuaSnip',
    --   after = 'friendly-snippets',
    --   config = function()
    --     require('luasnip/loaders/from_vscode').load({
    --       paths = { '~/.local/share/nvim/site/pack/packer/start/friendly-snippets' }
    --     })
    --   end
    -- }
    -- use 'saadparwaiz1/cmp_luasnip'

    -- COLORSHEME
    use {
      'Mofiqul/dracula.nvim',
      config = function()
        require('plugins.dracula')
      end
    }

    -- AUTO PAIRS
    use {
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup({})
      end
    }

    -- LUALINE
    use {
      'nvim-lualine/lualine.nvim',
      config = function()
        require('plugins.lualine')
      end
    }
    -- fancy icons
    use {
      'kyazdani42/nvim-web-devicons',
      config = function()
        require('nvim-web-devicons').setup({ default = true; })
      end
    }
    -- fancy buffer
    use {
      'akinsho/bufferline.nvim',
      tag = "v2.*",
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require('plugins.bufferline')
      end
    }

    -- Plugins for comments
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }

    -- indent symbols for all lines
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require('plugins.indent_blankline')
      end
    }

    -- hex colors, color highlighter
    use {
      'norcalli/nvim-colorizer.lua',
      config = function()
        require('plugins.nvim-colorizer')
      end
    }

    -- File viewer
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly', -- optional, updated every week. (see issue #1193)
      config = function()
        require('plugins.nvim-tree')
      end
    }

    -- Highlight code
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        require('plugins.treesitter')
      end
    }

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      config = function()
        require('plugins.telescope')
      end
    }
    use {'nvim-telescope/telescope-ui-select.nvim' }
    -- Greeter screen
    use {
      'goolord/alpha-nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
      end
    }


    if packer_bootstrap then
      require('packer').sync()
    end
  end,

  -- packer config
  log = { level = 'info' },
  config = {
    display = {
      prompt_border = 'single',
    },
    profile = {
      enable = true,
      threshold = 0,
    },
  },
}
