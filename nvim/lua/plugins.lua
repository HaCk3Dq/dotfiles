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
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'

  -- Autocomplete
  use 'hrsh7th/nvim-compe'
  use 'windwp/nvim-autopairs'
  use 'AndrewRadev/tagalong.vim'
  use 'andymass/vim-matchup'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'lukas-reineke/indent-blankline.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'romgrk/nvim-treesitter-context' 

  -- Status Line and Bufferline
  use 'famiu/feline.nvim'
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use 'airblade/vim-gitgutter'

  -- Color
  use 'norcalli/nvim-colorizer.lua'

  -- Explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require'nvim-tree'.setup {
        auto_close = false,
        disable_netrw = false,
        hijack_netrw = true,
        highlight_opened_files = true,
        auto_resize = false,
      }
    end
  }

  -- Git
  use 'kdheepak/lazygit.nvim'
 
  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'

  -- Syntax
  use {
    "b3nj5m1n/kommentary",
    config = function()
      require("kommentary.config").configure_language(
        "default",
        {prefer_single_line_comments = true}
      )
    end,
  }
  use 'nfnty/vim-nftables'
  use 'chr4/nginx.vim'

  use {
    "sbdchd/neoformat",
    config = function() require("plugins.neoformat") end,
  }
  use 'jiangmiao/auto-pairs'

  -- UI
  use 'mg979/vim-visual-multi'
  use 'nacro90/numb.nvim'
  use 'karb94/neoscroll.nvim'
  use 'rrethy/vim-illuminate'

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        
      }
    end
  }

  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'

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
