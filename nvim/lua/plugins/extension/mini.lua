return {
  "echasnovski/mini.indentscope",
  event = "BufRead",
  config = function()
    require("mini.indentscope").setup {
      symbol = "│",
    }
  end,
}
