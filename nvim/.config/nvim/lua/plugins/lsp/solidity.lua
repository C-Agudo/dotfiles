-- ~/.config/nvim/lua/plugins/solidity.lua
-- AGGRESSIVE DIRECT CONFIGURATION
return {
  {
    "neovim/nvim-lspconfig",
    -- Use 'config' not 'opts' for direct control
    config = function()
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig.configs")
      local util = require("lspconfig.util")

      -- 1. MANUALLY REGISTER the server if not already known
      local server_name = "solidity_ls_nomicfoundation"
      if not configs[server_name] then
        configs[server_name] = {
          default_config = {
            cmd = { "vscode-solidity-server", "--stdio" },
            -- cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
            filetypes = { "solidity" },
            root_dir = util.root_pattern(".git", "foundry.toml", "hardhat.config.*"),
            settings = {}, -- Start with empty, will fill in setup
          },
        }
        vim.notify("Manually registered server: " .. server_name, vim.log.levels.INFO)
      end

      -- 2. SETUP with EXPLICIT settings
      lspconfig[server_name].setup({
        -- These settings are passed directly to the server on startup
        settings = {
          solidity = {
            solc = {
              path = "/home/carlos22/.local/bin/solc", -- Your verified compiler path
            },
          },
        },
      })
      vim.notify("Server setup called with settings.", vim.log.levels.INFO)
    end,
    -- Load this plugin early, before LSP starts
    priority = 1000,
  },
}
