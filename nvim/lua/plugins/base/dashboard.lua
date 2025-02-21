return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function()
    local logo = [[







    ]]

    -- logo = string.rep("\n", 4) .. logo .. "\n"
    --                                              
    --       ████ ██████           █████      ██
    --      ███████████             █████ 
    --      █████████ ███████████████████ ███   ███████████
    --     █████████  ███    █████████████ █████ ██████████████
    --    █████████ ██████████ █████████ █████ █████ ████ █████
    --  ███████████ ███    ███ █████████ █████ █████ ████ █████
    -- ██████  █████████████████████ ████ █████ █████ ████ ██████
    --
    logo = string.rep("\n", 3) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = true,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit", icon = " ", key = "q" },

        },

        footer = function()
          local stats = require("lazy").stats()
          vim.api.nvim_set_hl(0, "StartupTime", { fg = "#FF5733", bg = "#282828", bold = true })
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return {
            "󱐋 neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. " ms  ",
          }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 46 - #button.desc)
      button.key_format = "  %s"
    end

    -- open dashboard after closing lazy
    if vim.o.filetype == "lazy" then
      vim.api.nvim_create_autocmd("WinClosed", {
        pattern = tostring(vim.api.nvim_get_current_win()),
        once = true,
        callback = function()
          vim.schedule(function()
            vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
          end)
        end,
      })
    end

    return opts
  end,
}
