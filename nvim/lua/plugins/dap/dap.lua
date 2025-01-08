return {
  "mfussenegger/nvim-dap",
  -- event = "VeryLazy",
  cmd = "DapContinue",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio", -- dapui
    "nvim-telescope/telescope-dap.nvim",
    { "mfussenegger/nvim-dap-python", event = "BufReadPre" },
    "leoluz/nvim-dap-go",
  },

  config = function()
    local dap = require "dap"
    local dapui = require "dapui"
    local dvt = require "nvim-dap-virtual-text"
    -- 插件自动配置
    require("dap-python").setup()
    require("dap-go").setup()

    vim.keymap.set("n", "<F5>", function()
      require("telescope").extensions.dap.configurations {}
    end)

    vim.keymap.set("n", "<F1>", function()
      require("dap").step_over()
    end)
    vim.keymap.set("n", "<F11>", function()
      require("dap").step_into()
    end)
    vim.keymap.set("n", "<F12>", function()
      require("dap").step_out()
    end)
    vim.keymap.set("n", "<Leader>b", function()
      require("dap").toggle_breakpoint()
    end)
    vim.keymap.set("n", "<Leader>B", function()
      require("dap").set_breakpoint()
    end)
    vim.keymap.set("n", "<Leader>lp", function()
      require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
    end)
    vim.keymap.set("n", "<Leader>dr", function()
      require("dap").repl.open()
    end)
    vim.keymap.set("n", "<Leader>dl", function()
      require("dap").run_last()
    end)
    vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
      require("dap.ui.widgets").hover()
    end)
    vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
      require("dap.ui.widgets").preview()
    end)
    vim.keymap.set("n", "<Leader>df", function()
      local widgets = require "dap.ui.widgets"
      widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set("n", "<Leader>ds", function()
      local widgets = require "dap.ui.widgets"
      widgets.centered_float(widgets.scopes)
    end)
    vim.keymap.set("n", "<Leader>dt", function()
      dap.terminate()
    end)

    -- dapui
    -- DapTerminate   exit dapui
    dapui = require "dapui"
    dapui.setup()
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
    --
    -- nvim-dap-virtual-text
    dvt.setup()

    -- 设置样式
    -- vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
    -- h dap.txt
    vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "󰁕 ", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = " ", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "", linehl = "", numhl = "" })
  end,
}
