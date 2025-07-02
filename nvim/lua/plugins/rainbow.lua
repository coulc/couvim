return {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("rainbow-delimiters.setup")({
            strategy = {
                [""] = require("rainbow-delimiters.strategy.global"),
                vim = require("rainbow-delimiters.strategy.local"),
            },
            query = {
                ["lua"] = "rainbow-blocks",
                ["c"] = "rainbow-blocks",
                ["cpp"] = "rainbow-blocks",
                ["rust"] = "rainbow-blocks",
            },
            max_file_lines = 1000,
        })
    end,
}

