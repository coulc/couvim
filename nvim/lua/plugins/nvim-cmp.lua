return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/cmp-buffer", -- 推荐当前缓冲区文本源
    "hrsh7th/cmp-path", -- 文件路径源
    "L3MON4D3/LuaSnip", -- 片段引擎
    "saadparwaiz1/cmp_luasnip", -- 片段完成源
    "rafamadriz/friendly-snippets", -- 一组许多不同的有用片段
    "hrsh7th/cmp-cmdline", -- 浮窗命令行
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require "cmp"
    local luasnip = require "luasnip"
    local lspkind = require "lspkind"

    -- 加载代码片段
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup {
      formatting = {
        format = lspkind.cmp_format {
          mode = "symbol_text", -- shjk:ow only symbol annotations   显示图标和文字
          -- preset = "codicons", -- 设置风格为 vsc 这里我自定义图标

          maxwidth = {
            -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- can also be a function to dynamically calculate max width such as
            -- menu = function() return math.floor(0.45 * vim.o.columns) end,
            menu = 50, -- leading text (labelDetails)
            abbr = 50, -- actual suggestion item
          },
          ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          show_labelDetails = true, -- show labelDetails in menu. Disabled by default
          symbol_map = { -- 自定义图标映射
            Text = "󰉿",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰜢",
            Variable = "󰀫",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "󰑭",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "󰈇",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "󰙅",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "",
          },
        },
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- 配置cmp如何与引擎交互
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- 向上移动
        ["<C-j>"] = cmp.mapping.select_next_item(), -- 向下移动
        ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- 在预览窗口中下移动
        ["<C-f>"] = cmp.mapping.scroll_docs(4), -- 在预览窗口中上移动
        ["<C-Space>"] = cmp.mapping.complete(), -- 显示cmp提示
        ["<C-e>"] = cmp.mapping.abort(), -- 关闭cmp提示
        ["<CR>"] = cmp.mapping.confirm { select = false }, -- 确认选择
      },
      -- 添加补全源
      sources = cmp.config.sources { -- 源的顺序决定了优先级
        { name = "nvim_lsp" }, -- lsp
        { name = "luasnip" }, -- 片段补全源
        { name = "buffer" }, -- 缓冲区文本补全源
        { name = "path" }, -- 文件系统路径
      },
      -- `:` cmdline setup.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
          },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      }),
    }
  end,
}
