return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/nvim-cmp",
  },

  config = function()
    local autopairs = require "nvim-autopairs"
    autopairs.setup {
      check_ts = true,
      ts_config = {
        ["*"] = { "string", "comment" }, -- "*" 表示匹配所有语言
      },
    }

    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    local cmp = require "cmp"

    -- 自动补全和cmp一起工作
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
