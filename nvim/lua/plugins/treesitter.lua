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
        "css",
        "typescript",
        "json",
      },
      -- 增量选择
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    }
    -- 开启 Folding 模块  zc 折叠  zo 展开
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    -- 默认不要折叠
    -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
    vim.opt.foldlevel = 99
  end,
}
