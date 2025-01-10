return {
  "folke/snacks.nvim",
  -- priority = 1000,
  -- lazy = false,
  event = "BufReadPre",

  config = function()
    vim.api.nvim_set_hl(0, "rainbowred", { fg = "#e06c75" })
    vim.api.nvim_set_hl(0, "rainbowyellow", { fg = "#e5c07b" })
    vim.api.nvim_set_hl(0, "rainbowblue", { fg = "#61afef" })
    vim.api.nvim_set_hl(0, "rainboworange", { fg = "#d19a66" })
    vim.api.nvim_set_hl(0, "rainbowgreen", { fg = "#98c379" })
    vim.api.nvim_set_hl(0, "rainbowviolet", { fg = "#c678dd" })
    vim.api.nvim_set_hl(0, "rainbowcyan", { fg = "#56b6c2" })

    local highlight = {
      "rainbowred",
      "rainbowyellow",
      "rainbowblue",
      "rainboworange",
      "rainbowgreen",
      "rainbowviolet",
      "rainbowcyan",
    }

    vim.g.rainbow_delimiters = { highlight = highlight }

    require("snacks").setup {
      indent = {
        only_scope = true,
        enabled = true,
        scope = {
          enabled = true,
          priority = 200,
          char = "│",
          underline = true,
          only_current = false,
          hl = highlight,
        },
        hl = highlight,
        chunk = {
          enabled = true,
          only_current = false,
          priority = 200,
          hl = highlight,
          char = {
            corner_top = "╭",
            corner_bottom = "╰",
            horizontal = "─",
            vertical = "│",
            arrow = ">",
          },
        },
        blank = { hl = highlight },
      },

      bigfile = { enabled = true },
      scroll = { enabled = true },

      -- false
      dashboard = { enabled = false },
      input = { enabled = false },
      notifier = { enabled = false },
      quickfile = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
    }
  end,
}
