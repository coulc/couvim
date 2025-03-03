return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "BufReadPre",
  dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" },

  config = function()
    require("bufferline").setup {
      options = {
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        left_mouse_command = "buffer %d",
        close_icon = "",
        buffer_close_icon = "",
        modified_icon = "●",
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,

        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },

        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },

        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "thin", 
      },
    }
  end,
}
