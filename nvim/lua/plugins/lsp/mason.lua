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

    mason_lspconfig.setup {
      automatic_installation = true,
      ensure_installed = {
        "lua_ls", 
        "clangd", 
      },
    }

    mason_tool_installer.setup {
      automatic_installation = true,
      ensure_installed = {
        "stylua", 
        "prettier"
      },
    }
  end,
}
