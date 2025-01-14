return {
  "ahmedkhalf/project.nvim",
  -- event = "BufReadPre",
  event = "VeryLazy",
  config = function()
    require("project_nvim").setup {}
  end,
}
