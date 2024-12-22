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
      -- 供mason安装的服务器列表
      ensure_installed = {
        "clangd",
        "lua_ls",
        "pyright",
        "jdtls",
        --        "rust_analyzer", -- rust  这里使用rustaceanvim 就不用在这里安装了   rustup component add rust-analyzer
        --  下载不了gopls就设置代理
        "gopls", -- export GO111MODULE=on    export GOPROXY=https://goproxy.io
      },
      -- 自动安装已配置的服务器
      automatic_installation = true,
    }

    mason_tool_installer.setup {
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
        "codelldb", -- rust dap
      },
    }
  end,
}
