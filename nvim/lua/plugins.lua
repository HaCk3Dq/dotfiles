local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  execute("packadd packer.nvim")
end

vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use("nordtheme/vim")
  use("lewis6991/impatient.nvim")

  -- LSP
  use({
    "neovim/nvim-lspconfig",
    requires = {
      "onsails/lspkind-nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("plugins.lsp")
    end,
  })
  use({ "williamboman/mason.nvim" })
  use({ "ray-x/lsp_signature.nvim" })
  use({ "jose-elias-alvarez/null-ls.nvim" })
  use({ "AckslD/swenv.nvim" })

  -- Autocomplete
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "onsails/lspkind-nvim",
    },
    config = function()
      require("plugins.cmp")
    end,
  })

  use({
    "L3MON4D3/LuaSnip",
    config = function()
      require("plugins.luasnips")
    end,
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "lukas-reineke/indent-blankline.nvim",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "romgrk/nvim-treesitter-context",
    },
    run = function()
      vim.cmd("TSUpdate")
    end,
    config = function()
      require("plugins.treesitter")
    end,
  })

  -- Status Line and Bufferline
  use("kyazdani42/nvim-web-devicons")
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("plugins.lualine_conf")
    end,
  })
  use({
    "romgrk/barbar.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  })

  -- Tree
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        enable_git_status = false,
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            enable_diagnostics = false,
          },
        },
      })
    end,
  })

  -- Color
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        filetypes = { "*" },
        user_default_options = {
          RGB = true,
          RRGGBB = true,
          css = true,
        },
      })
    end,
  })

  -- Git
  use("kdheepak/lazygit.nvim")
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  })

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
    },
    config = function()
      require("plugins.telescope")
    end,
  })

  -- Syntax
  use({
    "b3nj5m1n/kommentary",
    config = function()
      require("kommentary.config").configure_language("default", { prefer_single_line_comments = true })
    end,
  })
  use("tpope/vim-surround")
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })

  -- UI
  use("nacro90/numb.nvim")
  use("karb94/neoscroll.nvim")
  use("rrethy/vim-illuminate")
  use("Pocco81/true-zen.nvim")

  use({
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({})
    end,
  })

  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  })

  use("wsdjeg/vim-fetch") -- Allows nvim file:line

  use({
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/" },
        session_lens = {
          load_on_setup = true,
          path_display = { "shorten" },
        },
      })
    end,
  })
end)
