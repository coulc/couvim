return {
  "folke/noice.nvim",

  event = "VimEnter",
  -- event = "CmdlineEnter",

  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },

  config = function()
    local noice = require "noice"

    noice.setup {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },

      views = {
        cmdline_popup = {
          position = {
            row = 5, -- 这里设置命令行的行位置
            col = "50%", -- 这里设置命令行的列位置，可以是百分比或者具体的数值
          },
          size = {
            width = 60, -- 这里设置命令行的宽度
            height = "auto", -- 这里设置命令行的高度，"auto" 表示自动高度
          },
        },
      },
    }
  end,
}
