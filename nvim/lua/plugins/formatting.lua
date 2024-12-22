return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require "conform"

    conform.setup {
      -- 每种不同文件类型的格式化程序
      formatters_by_ft = {
        javascript = { "prettier" },
        java = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "goimports" },
        rust = { "rustfmt" },
      },
      -- 启动保存功能的格式
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    }

    -- 使用快捷键格式化特定范围的文本
    vim.keymap.set({ "n", "v" }, "<leader>gs", function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      }
    end, { desc = "Format file or range(in visual mode)" })
  end,
}
