return {
  "stevearc/aerial.nvim",
  cmd = "Aerial",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>o", "<cmd>AerialToggle<CR>", desc = "Toggle Aerial" },
  },
  config = function()
    require("aerial").setup {
      backends = { "lsp", "treesitter", "markdown" },
      layout = {
        default_direction = "prefer_right",
        width = 35,
        min_width = 20,
        max_width = 50,
      },
      show_guides = true,
      guides = {
        mid_item = "├ ",
        last_item = "└ ",
        nested_top = "│ ",
        whitespace = "  ",
      },
      attach_mode = "window",
      close_automatic_events = { "unsupported" },
      keymaps = {
        ["{"] = "actions.prev",
        ["}"] = "actions.next",
      },
      filter_kind = false,
    }
    -- 快捷键绑定
    -- vim.api.nvim_set_keymap("n", "<leader>o", ":AerialToggle<CR>", { noremap = true, silent = true })
  end,
}
