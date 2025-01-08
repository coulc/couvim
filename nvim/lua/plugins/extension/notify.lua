return {
  "rcarriga/nvim-notify",
  event = "BufReadPre",

  config = function()
    require("notify").setup {
      stages = "slide",
      render = "minimal",
      timeout = 100,
    }
  end,
}
