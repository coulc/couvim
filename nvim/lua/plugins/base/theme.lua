-- return {
--   -- the colorscheme should be available when starting Neovim
--   "folke/tokyonight.nvim",
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     -- load the colorscheme here
--     vim.cmd [[colorscheme tokyonight-moon]]
--     require("tokyonight").setup {
--       styles = {
--         -- Background styles. Can be "dark", "transparent" or "normal"
--         sidebars = "dark", -- style for sidebars, see below
--         floats = "dark", -- style for floating windows
--       },
--     }
--   end,
-- }

-- return {
--   "morhetz/gruvbox",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd [[colorscheme gruvbox]]
--   end,
-- }

-- return {
--     "sainnhe/everforest",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.g.everforest_diagnostic_line_highlight = 1
--     vim.cmd "colorscheme everforest"
--   end,
-- }
return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd [[colorscheme catppuccin]]
  end,
}
