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
-- map("n", "<Leader>/", "<CMD>FzfLua live_grep_glob<cr>")
map("n", "<Leader>/", function()
  require("telescope.builtin").live_grep({
    vimgrep_arguments = {
      "rg",
      -- options required by ripgrep
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      -- options for my own search
      "--hidden",
      "--no-ignore",
      "--max-columns=4096",
      "-g",
      "!out",
      "-g",
      "!.git",
    },
  })
end, { desc = "RipGrep" })

-- I am used to lunar vim key bindings and also
-- I probably do not need the lazy view as often
local normal_map_keys = vim.api.nvim_get_keymap("n")
for i, v in pairs(normal_map_keys) do
  if v["lhs"] == " l" then
    vim.keymap.del("n", "<Leader>l")
    break
  end
end

map("n", "<Leader>ll", "<CMD>Lazy<CR>")
map("n", "<Leader>lx", "<CMD>LazyExtras<CR>")

map({ "n", "v" }, "<Leader>lf", function()
  require("conform").format()
end, { desc = "Format code" })

map({ "n" }, "<Leader>ci", function()
  -- TODO: no idea how to write this
  local cmp = require("blink.cmp.config.keymap")
  print(vim.inspect(cmp))
end, { desc = "Ollama complete" })

-- Taken from `Advanced telescope.nvim` Examples, searhc plugins
map({ "n" }, "<Leader>fp", function()
  require("telescope.builtin").find_files({
    cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
  })
end, { desc = "Find plugin files via telescope" })
