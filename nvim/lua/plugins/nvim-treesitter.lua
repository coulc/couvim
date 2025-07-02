return{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",  
    event = { "BufReadPost", "BufNewFile" },  

    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "lua", "vim", "vimdoc", "bash", "markdown", "markdown_inline",
                "python", "javascript", "typescript", "html", "css", "json"
            },
            auto_install = true,
            highlight = { enable = true },
            indent = {
                enable = true,
            },
        }
    end

}

