return {
  {
    "akinsho/bufferline.nvim",     -- 缓冲区标签栏插件
    version = "*",                 -- 始终使用最新版本
    -- event = "VeryLazy",            -- 启动后懒加载
    dependencies = { "nvim-tree/nvim-web-devicons" },  -- 图标支持

    config = function()
      require("bufferline").setup {
        options = {
          mode = "buffers",             -- 也可选 "tabs"
          numbers = "none",             -- 显示编号：none、ordinal、buffer_id
          close_command = "bdelete! %d",-- 关闭 buffer 的命令
          right_mouse_command = "bdelete! %d",
          left_mouse_command = "buffer %d", -- 点击切换
          indicator = {
            style = "icon",             -- 下划线 / icon / none
            icon = "▎",
          },
          buffer_close_icon = "",
          modified_icon = "●",
          close_icon = "",
          left_trunc_marker = "",
          right_trunc_marker = "",
          diagnostics = "nvim_lsp",     -- 显示 LSP 错误诊断
          diagnostics_update_in_insert = false,
          offsets = {
            {
              filetype = "NvimTree",
--              text = "",
              text_align = "center",
              separator = true
            }
          },
          show_buffer_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          persist_buffer_sort = true,
          separator_style = "thin",     -- "slant" | "thick" | "thin"
        },
      }
    end,
  },
}

