return {
  "rrethy/vim-illuminate",
  "wsdjeg/vim-fetch",
  "xzbdmw/colorful-menu.nvim",
  "chrisgrieser/nvim-spider",
  "nordtheme/vim",
  "aznhe21/actions-preview.nvim",
  { "jghauser/fold-cycle.nvim", opts = {} },
  { "j-hui/fidget.nvim", opts = { notification = { window = { winblend = 0 } } } },
  { "gbprod/substitute.nvim", opts = {} },
  { "kdheepak/lazygit.nvim", lazy = true, cmd = { "LazyGit" } },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "xiyaowong/transparent.nvim", priority = 1000 },
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
  { "kylechui/nvim-surround", event = "VeryLazy" },
  { "folke/todo-comments.nvim", opts = {} },
  { "numToStr/Comment.nvim", opts = { ignore = "^$" } },
  { "linux-cultist/venv-selector.nvim", opts = {} },
  { "levouh/tint.nvim", config = true },
  { "folke/which-key.nvim", opts = {} },
  { "lewis6991/gitsigns.nvim", config = true },
  { "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" }, config = true },

  {
    "ptdewey/pendulum-nvim",
    config = function()
      package.preload["pendulum.handlers"] = function()
        local path = vim.api.nvim_get_runtime_file("lua/pendulum/handlers.lua", false)[1]
        local source = table.concat(vim.fn.readfile(path), "\n")

        local function replace(original, replacement)
          local start = source:find(original, 1, true)
          source = source:sub(1, start - 1) .. replacement .. source:sub(start + #original)
        end
        -- store only active sessions
        replace("project = git_project(),", "project = vim.fs.basename(vim.loop.cwd()),")
        replace("log_activity(true, opts, last_active_time)", "return")
        replace("    log_activity(is_active, opts)", "    if is_active then\n        log_activity(true, opts)\n    end")

        return loadstring(source, "@" .. path)()
      end

      require("pendulum").setup({
        log_file = vim.fn.stdpath("data") .. "/pendulum-log.csv",
        gen_reports = false,
        time_format = "24h",
      })
    end,
  },

  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = { "nvim-neo-tree/neo-tree.nvim" },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      input = { enabled = true },
      picker = { enabled = true },
      quickfile = { enabled = true },
      notifier = { enabled = true },
      scope = { enabled = true },
      indent = { enabled = true, scope = { hl = "Function" } },
      scroll = { enabled = true },
    },
  },

  {
    "hack3dq/git-conflict.nvim",
    version = "*",
    config = function()
      require("git-conflict").setup({
        default_mappings = false,
        disable_diagnostics = true,
      })
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        filetypes = { "*" },
        user_default_options = { RGB = true, RRGGBB = true, css = true, names = false },
      })
    end,
  },
}
