return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require "nvim-treesitter.configs"

    treesitter.setup {
      -- 启用语法高亮
      highlight = {
        enable = true,
      },
      -- 启用缩进
      indent = {
        enable = true,
      },
      -- 启用自动标记
      autotag = {
        enable = true,
      },
      -- 语言解析器 TSInstall ...
      ensure_installed = {
        "vim",
        "lua",
        "bash",
        "c",
        "vimdoc",
        "cpp",
        "java",
        "javascript",
        "python",
        "go",
        "xml",
        "toml",
        "markdown",
        "html",
        "rust",
        "ron",
        "css",
        "typescript",
        "json",
      },
    }
  end,
}
