return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "romgrk/nvim-treesitter-context",
  },
  config = function ()
    require("nvim-treesitter.configs").setup({
      sync_install = false,
      auto_install = true,
      indent = { enable = true },
      highlight = { enable = true },
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
        "json", "yaml", "javascript", "html", "css", "typescript", "graphql",
        "bash", "comment", "cmake", "csv", "diff", "dockerfile", "editorconfig",
        "git_config", "gitignore", "ini", "nix", "passwd", "python", "regex", "sql",
        "ssh_config", "terraform", "tmux", "toml", "udev", "xml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-Space>",
          node_incremental = "<C-Space>",
          scope_incremental = false,
          node_decremental = "<BS>",
        },
      },
    })
  end
}
