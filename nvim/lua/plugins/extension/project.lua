return {
  "ahmedkhalf/project.nvim",
  event = "BufReadPre",
  config = function()
    require("project_nvim").setup {}
  end,
}
