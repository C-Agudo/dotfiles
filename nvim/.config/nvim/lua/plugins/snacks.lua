return {
  "folke/snacks.nvim",
  dependencies = { "folke/tokyonight.nvim" },
  priority = 1001,
  opts = {
    picker = {
      enabled = true, -- ACTIVA el sistema de búsqueda Snacks Picker
      sources = {
        files = {
          hidden = false
        },
      },
    },
    explorer = {
      hidden = true,
      -- Example: Prevent conflicts with netrw
      replace_netrw = true,
      enabled = false
    },
    dashboard = { enabled = true },
  },
  keys = {
    {
      "<leader>fh",
      function()
        Snacks.picker.files({
          cwd = vim.loop.cwd(), hidden = true,
        })
      end,
      desc = "Find files in cwd including hidden",
    }
  },
  config = function(_, opts)
    -- Aplica colorscheme primero
    vim.cmd("colorscheme tokyonight-night")
    -- Inicializa Snacks después
    local snacks_ok, snacks = pcall(require, "snacks")
    if snacks_ok and not snacks.did_setup then
      snacks.setup(opts)
    end
  end,
}
