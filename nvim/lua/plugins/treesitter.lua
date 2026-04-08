return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  config = function()
    require("nvim-treesitter").setup({ install_dir = vim.fn.stdpath("data") .. "/site" })
    require("nvim-treesitter-textobjects").setup({
      select = {
        lookahead = true,
      },
    })

    require("nvim-treesitter").install({ "python" })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
