return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
        { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
        { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Fuzzy string in cwd" },
        { "<leader>fn", "<cmd>Telescope notify<cr>", desc = "View historical information" },
        { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "View shortcut keys" },
        { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "View projects" },
    },
    config = function()
        local telescope = require "telescope"
        telescope.setup {
            defaults = {
                layout_strategy = "horizontal",
                layout_config = {
                    preview_width = 0.6,
                    width = 0.9,
                    height = 0.7,
                    prompt_position = "top",
                },
                sorting_strategy = "ascending",
                prompt_prefix = " ",
                selection_caret = " ",
                winblend = 10,
                border = true,
                borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },

                mappings = {
                    i = {
                        ["<C-j>"] = "move_selection_next",
                        ["<C-k>"] = "move_selection_previous",
                        ["<leader>f"] = "close",
                        ["<C-u>"] = "preview_scrolling_up",
                        ["<C-d>"] = "preview_scrolling_down",
                    },
                },
            },
        }

        telescope.load_extension "fzf"
    end,
}
