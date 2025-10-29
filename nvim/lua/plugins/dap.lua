return {
  "mfussenegger/nvim-dap",
  ft = { "python" },
  dependencies = {
    -- { "mfussenegger/nvim-dap-python" },
    { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
    { "nvim-telescope/telescope-dap.nvim" },
    { "theHamsta/nvim-dap-virtual-text" },
  },
  config = function()
    vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939" })
    vim.fn.sign_define("DapBreakpoint", { text = "◆", texthl = "DapBreakpoint", linehl = "", numhl = "" })

    vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#5AADCC" })
    vim.api.nvim_set_hl(0, "DapStoppedLine", { ctermbg = 0, bg = "#3B4252" })
    vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })

    require("dapui").setup()
    -- TODO: check venv selector
    -- require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
    require("nvim-dap-virtual-text").setup({})
    require("telescope").load_extension("dap")

    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
