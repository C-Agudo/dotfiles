return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, -- mostrar archivos ocultos
          hide_dotfiles = false,
        },
      },
    },
    config = function(_, opts)
      require("neo-tree").setup(opts)

      -- Cambiar color de archivos ocultos sin tocar archivos originales
      vim.api.nvim_set_hl(0, "NeoTreeDotfile", { fg = "#FFFFFF" }) -- blanco
      vim.api.nvim_set_hl(0, "NeoTreeHidden", { fg = "#FFFFFF" })  -- blanco
    end,
  },
}
