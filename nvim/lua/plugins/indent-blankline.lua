return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",     
  event = { "BufReadPre", "BufNewFile" }, 
  config = function()
    require("ibl").setup({
      indent = {
        char = "│", 
        tab_char = "│",
      },
      scope = {
        enabled = true, 
        show_start = false,
        show_end = false,
        highlight = { "Function", "Label" },
      },
      exclude = {
        filetypes = {
          "help", "terminal", "dashboard", "lazy", "NvimTree",
          "TelescopePrompt", "Trouble", "alpha",
        },
      },
    })
  end,
}

