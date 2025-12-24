return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      solidity = { "forge_fmt" },
    },
    format_on_save = {
      -- These options are optional but recommended.
      -- They enable formatting on save with a fallback to the LSP formatter if needed.
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
