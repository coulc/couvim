return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require "lspconfig"
    local mason_lspconfig = require "mason-lspconfig"
    local cmp_nvim_lsp = require "cmp_nvim_lsp"

    local keymap = vim.keymap -- for conciseness
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        --`:help vim.lsp.*`
        -- 2024.12.14   使用lspsaga 的快捷键
        local opts = { buffer = ev.buf, silent = true }
        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- 映射以在必要时重新启动lsp
      end,
    })

    -- 用于启用自动完成(指定给每个lsp服务器配置)
    local capabilities = cmp_nvim_lsp.default_capabilities()
    local signs = { Error = "󱎘", Warn = "", Hint = "󱐋 ", Info = "󰋽" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers {
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup {
          capabilities = capabilities,
        }
      end,
      ["lua_ls"] = function()
        -- -配置lua服务器(附带特殊设置)
        lspconfig["lua_ls"].setup {
          capabilities = capabilities,
          settings = {
            Lua = {
              -- 使语言服务器全局识别“vim
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        }
      end,
      ["gopls"] = function()
        lspconfig["gopls"].setup {
          cmd = { "gopls" },
          capabilities = capabilities,
          filetypes = { "go", "gomod", "gowrk", "gotmpl" },
          settings = {
            cargo = {
              allFeatures = true,
            },
          },
        }
      end,
    }
  end,
}
