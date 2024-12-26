return {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",

  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup {
      view = {
        --宽度
        width = 30,
        side = "left",
      },
      -- 更改文件夹箭头图标
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- 文件夹关闭时
              arrow_open = "", -- 文件夹打开时
            },
          },
        },
      },
      -- 禁用窗口选择器 ，使浏览器能够在窗口分割时正常工作
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      git = {
        ignore = false,
      },
    }
  end,
}
