-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Press `-` to edit directory using oil
map("n", "-", "<CMD>Oil<CR>")

-- Move visual selection up/down with CTRL + j/k
map("v", "<C-j>", ":m '>+1<CR>gv-gv")
map("v", "<C-k>", ":m '<lt>-2<CR>gv-gv")

map("n", "<Leader>or", "<CMD>OverseerRestartLast<CR>")
map("n", "<Leader>of", "<CMD>ClangdSwitchSourceHeader<CR>")

map("n", "<Leader>*", "<CMD>FzfLua grep_cword<CR>")
map("n", "<Leader>/", "<CMD>FzfLua live_grep_glob<cr>")

-- I am used to lunar vim key bindings and also
-- I probably do not need the lazy view as often
vim.keymap.del("n", "<Leader>l")
map("n", "<Leader>ll", "<CMD>Lazy<CR>")
map("n", "<Leader>lf", "cf", { desc = "Format by calling cf" })
