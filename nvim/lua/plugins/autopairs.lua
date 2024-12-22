return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/nvim-cmp",
  },

  config = function()
    local autopairs = require "nvim-autopairs"
    autopairs.setup {
      ts_config = {
        lua = { "string" }, -- 不在lua的string节点中补全
        javascript = { "template_string" }, -- 不在javascript template_string节点补全
        python = { "string" }, -- 不在python的string节点中补全
        java = { "string" },
        go = { "string" }, -- 不在go的string节点中补全
      },
    }

    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    local cmp = require "cmp"

    -- 自动补全和cmp一起工作
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
