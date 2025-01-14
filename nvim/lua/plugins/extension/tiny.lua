return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "BufReadPre", -- Or `LspAttach`
  priority = 1000, -- needs to be loaded in first
  config = function()
    require("tiny-inline-diagnostic").setup {
      theme = "simple",
    }
  end,
}
