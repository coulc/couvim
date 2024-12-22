return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
  config = function()
    require("mini.indentscope").setup {
      symbol = "│",
    }
  end,
}
