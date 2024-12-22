-- return {
--   "akinsho/bufferline.nvim",
--   version = "*",
--   dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" },
--   config = function()
--     require("bufferline").setup {
--       options = {
--
--         -- 悬停事件
--         hover = {
--           enabled = true,
--           delay = 200,
--           reveal = { "close" },
--         },
--         offsets = {
--           {
--             filetype = "NvimTree",
--             text = "File Explorer",
--             highlight = "Directory",
--             text_align = "left",
--           },
--         },
--       },
--     }
--   end,
-- }
--
return {
  "akinsho/bufferline.nvim",
  version = "*",
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

        -- 悬停事件
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },

        -- 偏移相关设置，用于和其他插件（如文件管理器等）的布局配合
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },

        -- 显示相关设置，展示 buffer 的各种信息，这里展示图标、序号、名称等
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "thin", -- slant padded_slant slope padded_slop thick thin
      },
    }
  end,
}
