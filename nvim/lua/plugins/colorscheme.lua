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
return {
  "sainnhe/everforest",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.everforest_diagnostic_line_highlight = 1
    vim.cmd "colorscheme everforest"

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- Normal 背景透明
    -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" }) -- NormalNC 背景透明
    -- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" }) -- SignColumn 背景透明
    -- vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" }) -- 垂直分隔线背景透明
    -- vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" }) -- 状态栏背景透明
    -- vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" }) -- 非活动状态栏背景透明
    -- vim.api.nvim_set_hl(0, "TabLine", { bg = "none" }) -- TabLine 背景透明
    -- vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" }) -- TabLine 填充背景透明
    -- vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" }) -- TabLineSel 背景透明
    -- -- 设置 nvim-tree 透明背景
    -- vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" }) -- nvim-tree 正常背景透明
    -- vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" }) -- nvim-tree 非活动窗口背景透明
    -- vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" }) -- nvim-tree buffer 末尾背景透明
    -- vim.api.nvim_set_hl(0, "NvimTreeStatusLine", { bg = "none" }) -- nvim-tree 状态栏背景透明
    -- vim.api.nvim_set_hl(0, "NvimTreeStatusLineNC", { bg = "none" }) -- nvim-tree 非活动状态栏背景透明
  end,
}
