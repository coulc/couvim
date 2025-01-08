return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  vim.keymap.set("n", "<leader>sr", "<cmd>RustRun<CR>", { noremap = true, silent = true }),
  ft = { "rust" }
}
-- rustup component add rust-analyzer
-- debug :  codelldb
