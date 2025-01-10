return {
  "nvimdev/lspsaga.nvim",
  event = "Lspattach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },

  keys = {
    { "gl", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek definition" },
    { "go", "<cmd>Lspsaga goto_definition<CR>", desc = "Go to definition" },
    { "]d", "<Cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next diagnostic" },
    { "[d", "<Cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Previous diagnostic" },
    { "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename symbol" },
    { "gd", "<Cmd>Lspsaga finder<cr>", desc = "Find definition" },
    { "<leader>ca", "<cmd>Lspsaga code_action<CR>", mode = { "n", "v" }, desc = "Code action" },
    { "<leader>D", "<cmd>Lspsaga show_buf_diagnostics<CR>", desc = "Show buffer diagnostics" },
    { "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show line diagnostics" },
    { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover documentation" },
  },
  after = "nvim-lspconfig",
  config = function()
    require("lspsaga").setup {
      ui = {
        -- code_action = " ",
        code_action = " ",
        border = "rounded",
      },
    }
  end,
}
