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
        local opts = { buffer = ev.buf, silent = true }
        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- 映射以在必要时重新启动lsp
      end,
    })

    -- 高亮行 但是得配合everforset主题使用
    -- local diagnostics = {
    --   Error = { icon = "󱎘", hl = "DiagnosticSignError", linehl = "ErrorLine" },
    --   Warn = { icon = "", hl = "DiagnosticSignWarn", linehl = "WarningLine" },
    --   Info = { icon = "󰋽", hl = "DiagnosticSignInfo", linehl = "InfoLine" },
    --   Hint = { icon = "󱐋", hl = "DiagnosticSignHint", linehl = "HintLine" },
    -- }
    --
    -- for type, data in pairs(diagnostics) do
    --   vim.fn.sign_define("DiagnosticSign" .. type, {
    --     text = data.icon,
    --     texthl = data.hl,
    --     linehl = data.linehl,
    --   })
    -- end

    local diagnostics = {
      Error = { icon = "󱎘", hl = "DiagnosticSignError" },
      Warn = { icon = "", hl = "DiagnosticSignWarn" },
      Info = { icon = "", hl = "DiagnosticSignInfo" },
      Hint = { icon = "󱐋", hl = "DiagnosticSignHint" },
    }
    for type, data in pairs(diagnostics) do
      vim.fn.sign_define("DiagnosticSign" .. type, {
        text = data.icon,
        texthl = data.hl,
      })
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    mason_lspconfig.setup_handlers {
      function(server_name)
        lspconfig[server_name].setup {
          capabilities = capabilities,
        }
      end,
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup {
          capabilities = capabilities,
          settings = {
            Lua = {
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
  vim.diagnostic.config {
    virtual_text = {
      prefix = " 󰊠 ", --    󰑊
      spacing = 4,
    },
    signs = true,
    underline = false,
    severity_sort = true,
  },
}
