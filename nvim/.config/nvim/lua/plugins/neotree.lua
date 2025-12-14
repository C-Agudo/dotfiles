return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enable = true,
    event = "VeryLazy", -- evita que se abra al inicio
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    opts = {
      filesystem = {
        follow_current_file = true,
        hijack_netrw_behavior = "disabled",
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        },
      },
      window = {
        position = "left",
        width = 30,
      },
    },
    config = function(_, opts)
      require("neo-tree").setup(opts)

      -- Colores archivos ocultos
      vim.api.nvim_set_hl(0, "NeoTreeDotfile", { fg = "#FFFFFF" })
      vim.api.nvim_set_hl(0, "NeoTreeHidden", { fg = "#FFFFFF" })
    end,
  },
}
