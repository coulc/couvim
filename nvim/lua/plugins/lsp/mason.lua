return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  cmd = { "Mason", "MasonInstall", "MasonUninstall" },
  config = function()
    local mason = require "mason"
    local mason_tool_installer = require "mason-tool-installer"
    local mason_lspconfig = require "mason-lspconfig"

    mason.setup {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    }
    --  Rust Go Java C C++ Lua Python JavaScript TypeScript HTML CSS
    mason_lspconfig.setup {
      automatic_installation = true,
      ensure_installed = {
        "lua_ls", -- Lua LSP
        "clangd", -- Clangd (C/C++ LSP)
        "pyright", -- Pyright (Python LSP)
        "jdtls", -- Java LSP (JDTLS)
        "gopls", -- Go LSP
        "html", -- HTML LSP
        "cssls", -- CSS LSP
        "ts_ls", -- TypeScript JavaScript Lsp
      },
    }

    mason_tool_installer.setup {
      automatic_installation = true,
      ensure_installed = {
        "debugpy", -- Python 调试器
        "codelldb", -- LLDB 调试器
        "delve", -- Go 调试器
        "stylua", -- Stylua (Lua 格式化工具)
        --  --------------------------------------
        "prettier", -- 标准格式
        "isort", -- python
        "black", -- python
        "goimports", -- go
      },
    }
  end,
}
