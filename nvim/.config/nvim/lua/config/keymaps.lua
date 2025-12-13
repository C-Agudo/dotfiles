-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "Add empty line below" })
vim.keymap.set("n", "<leader>O", "O<Esc>", { desc = "Add empty line above" })

vim.keymap.set("n", "<leader>ff", function()
  require("snacks").picker.files({ layout = "ivy", dirs = { vim.fn.getcwd() } })
end)
