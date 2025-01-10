return {
  "kevinhwang91/nvim-ufo",
  event = "bufread",
  dependencies = "kevinhwang91/promise-async",
  version = "v1.4.0",
  config = function()
    -- vim.o.foldcolumn = "1"
    -- vim.o.foldcolumn = "auto:9"
    vim.o.foldcolumn = "0"
    vim.o.foldlevel = 99 -- using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.foldmethod = "manual"
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

    local handler = function(virttext, lnum, endlnum, width, truncate)
      local newvirttext = {}
      local suffix = (" 󰁂 %d "):format(endlnum - lnum)
      local sufwidth = vim.fn.strdisplaywidth(suffix)
      local targetwidth = width - sufwidth
      local curwidth = 0
      for _, chunk in ipairs(virttext) do
        local chunktext = chunk[1]
        local chunkwidth = vim.fn.strdisplaywidth(chunktext)
        if targetwidth > curwidth + chunkwidth then
          table.insert(newvirttext, chunk)
        else
          chunktext = truncate(chunktext, targetwidth - curwidth)
          local hlgroup = chunk[2]
          table.insert(newvirttext, { chunktext, hlgroup })
          chunkwidth = vim.fn.strdisplaywidth(chunktext)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curwidth + chunkwidth < targetwidth then
            suffix = suffix .. (" "):rep(targetwidth - curwidth - chunkwidth)
          end
          break
        end
        curwidth = curwidth + chunkwidth
      end
      table.insert(newvirttext, { suffix, "moremsg" })
      return newvirttext
    end

    require("ufo").setup {
      fold_virt_text_handler = handler,
    }
  end,
}
