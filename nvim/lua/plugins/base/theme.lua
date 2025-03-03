return {
  "folke/tokyonight.nvim",
  lazy = false, 
  priority = 1000,
  config = function()
    vim.cmd [[colorscheme tokyonight-moon]]
    require("tokyonight").setup {
      styles = {
        sidebars = "dark", 
        floats = "dark", 
      },
    }
  end,
}

