return {
  "mrcjkb/rustaceanvim",
  version = "^5", -- Recommended
  lazy = false, -- This plugin is already lazy
  vim.keymap.set("n", "<leader>sr", "<cmd>RustRun<CR>", { noremap = true, silent = true }),

  config = function()
    vim.g.rustaceanvim = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            diagnostics = {
              disabled = { "unlinked-file" }, -- 禁用 unlinked-file 警告
            },
          },
        },
      },
    }
  end,
}
-- rustup component add rust-analyzer
-- debug :  codelldb
