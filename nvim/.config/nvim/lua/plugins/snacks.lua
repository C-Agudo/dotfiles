return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      enabled = true, -- ACTIVA el sistema de búsqueda Snacks Picker
    },
    explorer = {
      hidden = true,
      -- Example: Prevent conflicts with netrw
      replace_netrw = true,
    },
    dashboard = { enabled = true },
  },
}
