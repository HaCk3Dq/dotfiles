local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'hack3dq/nord-vim'

  -- LSP
  use({
    'neovim/nvim-lspconfig',
    requires = {
      'onsails/lspkind-nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('plugins.lsp')
    end,
  })
  use { "williamboman/mason.nvim" }

  -- Autocomplete
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'onsails/lspkind-nvim',
    },
    config = function()
      require('plugins.cmp')
    end,
  })

  use({
    'L3MON4D3/LuaSnip',
    config = function()
      require('plugins.luasnip')
    end,
  })

  use({
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'lukas-reineke/indent-blankline.nvim',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'romgrk/nvim-treesitter-context',
    },
    run = function()
      vim.cmd('TSUpdate')
    end,
    config = function()
      require('plugins.treesitter')
    end,
  })

  -- Status Line and Bufferline
  use 'famiu/feline.nvim'
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- Color
  use({
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({'!*'})
    end,
  })

  -- Git
  use 'kdheepak/lazygit.nvim'
  use 'airblade/vim-gitgutter'
 
  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
    },
    config = function()
      require('plugins.telescope')
    end,
  })

  -- Syntax
  use {
    'b3nj5m1n/kommentary',
    config = function()
      require('kommentary.config').configure_language(
        'default',
        {prefer_single_line_comments = true}
      )
    end,
  }
  use 'tpope/vim-surround'

  -- UI
  use 'nacro90/numb.nvim'
  use 'karb94/neoscroll.nvim'
  use 'rrethy/vim-illuminate'
  use 'Pocco81/true-zen.nvim'

  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup{}
    end
  }

  use 'wsdjeg/vim-fetch' -- Allows nvim file:line

  use {
    'rmagatti/session-lens',
    requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
    config = function()
    require('session-lens').setup {
      path_display={'shorten'},
    }
  end
}
end)
