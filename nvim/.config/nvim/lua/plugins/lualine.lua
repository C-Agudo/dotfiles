return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, {
      function()
        if not vim.wo.spell then
          return ""
        end

        local langs = vim.opt.spelllang:get()
        if not langs or #langs == 0 then
          return ""
        end

        return "󰓆 " .. table.concat(langs, ",")
      end,
    })
  end,
}
