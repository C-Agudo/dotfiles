-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>o", "<cmd>normal! o<CR>", { desc = "Add empty line below" })
vim.keymap.set("n", "<leader>O", "<cmd>normal! O<CR>", { desc = "Add empty line above" })

vim.keymap.set("n", "<leader>ff", function()
  local cwd = vim.fn.getcwd()
  -- If we're in the config directory, search from home
  if cwd:match("dotfiles") or vim.bo.filetype == "dashboard" then
    require("snacks.picker").files({ cwd = "~" })
  else
    -- Otherwise, use the default LazyVim picker which respects root detection
    require("lazyvim.util").telescope("files")()
  end
end, { desc = "Find Files (Smart)" })
