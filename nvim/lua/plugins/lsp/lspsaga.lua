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
    -- local opts = { noremap = true, silent = true }
    -- vim.keymap.set("n", "gl", "<cmd>Lspsaga peek_definition<cr>", opts) -- 查看声明处     o 编辑  q退出
    -- vim.keymap.set("n", "go", "<cmd>Lspsaga goto_definition<CR>", opts) -- 使用 Lspsaga 去声明地  or  <C-]>  返回 : <C-o>
    -- vim.keymap.set("n", "]d", "<Cmd>Lspsaga diagnostic_jump_next<cr>", opts) -- 跳转到下一个诊断问题
    -- vim.keymap.set("n", "[d", "<Cmd>Lspsaga diagnostic_jump_prev<cr>", opts) --跳转到上一个诊断问题
    -- vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts) -- 使用 Lsp 重命名
    -- vim.keymap.set("n", "gd", "<Cmd>Lspsaga finder<cr>", opts) -- 设置在普通模式下，使用 gd 打开 lspsaga 的查找定义功能   o 到达目的地
    -- vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- 使用 Lspsaga 查看可用代码操作，在可视模式下将应用于选择
    -- vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts) -- 使用 Lspsaga 显示文件的诊断结果
    -- vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- 使用 Lspsaga 显示本行诊断结果
    -- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- 使用 Lspsaga 显示文档以查看光标下的内容
  end,
}
