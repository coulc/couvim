return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim", -- 安装非语言服务器的其他内容
  },
  config = function()
    -- 导入 mason
    local mason = require "mason"
    local mason_tool_installer = require "mason-tool-installer"
    -- 导入mason-lspconfig
    local mason_lspconfig = require "mason-lspconfig"

    -- 启动mason和configure图标
    mason.setup {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    }

    mason_lspconfig.setup {
      -- 自动安装已配置的服务器
      automatic_installation = true,
      -- 供mason安装的服务器列表
      ensure_installed = {
        "clangd",
        "lua_ls",
        "pyright",
        "jdtls",
        "gopls",
        -- 下载不了gopls就设置代理
        -- export GO111MODULE=on    export GOPROXY=https://goproxy.io
      },
    }

    mason_tool_installer.setup {
      automatic_installation = true,
      ensure_installed = {
        "prettier", -- 标准格式
        "stylua", -- lua
        "isort", -- python
        "black", -- python
        "pylint", -- python
        "debugpy", -- python debug
        "checkstyle", -- java
        "cpplint", -- c cpp
        "eslint_d", -- js ts
        "goimports", -- go
        "delve", -- go 的调试器
        "prosemd-lsp", -- md
        "codelldb", -- rust dap
      },
    }
  end,
}
