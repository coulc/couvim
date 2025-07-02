return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },

    config = function()
        local lspconfig = require "lspconfig"
        local cmp_nvim_lsp = require "cmp_nvim_lsp"

        local keymap = vim.keymap 
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }
                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) 
            end,
        })

        vim.diagnostic.config({
            virtual_text = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "󱎘",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.INFO] = "",
                    [vim.diagnostic.severity.HINT] = "󱐋",
                },
            },
            underline = false,
            severity_sort = true,
        })
        local capabilities = cmp_nvim_lsp.default_capabilities()
    end,
}

