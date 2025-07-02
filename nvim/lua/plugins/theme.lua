-- return{
    --     tokyonight  -------------
    -- "folke/tokyonight.nvim",
    -- lazy = false, 
    -- priority = 1000,
    -- config = function()
    --         vim.cmd [[colorscheme tokyonight]]
    -- end,

    --     onedark  -------------
--     "navarasu/onedark.nvim",
--     priority = 1000, 
--     config = function()
--         require('onedark').setup {
--             style = 'light'  -- deep cool dark deep warmer light
--         }
--         require('onedark').load()
--     end
-- }

return {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    config = function ()
        vim.cmd [[colorscheme catppuccin]] 
    end
}

-- other theme  
-- unokai  -> good!

