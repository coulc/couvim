return {
  "folke/which-key.nvim",
  event = "BufRead",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 200
  end,
  opts = { -- 配置
  },
}
