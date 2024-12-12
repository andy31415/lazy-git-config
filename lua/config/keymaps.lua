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

-- Taken from `Advanced telescope.nvim` Examples, search plugin
-- TODO: move this somewhere else
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local conf = require("telescope.config").values
local live_multigrep = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  local finder = finders.new_async_job({
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end

      local pieces = vim.split(prompt, "  ")
      local args = {
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
      }

      if pieces[1] then
        table.insert(args, "-e")
        table.insert(args, pieces[1])
      end

      if pieces[2] then
        table.insert(args, "-g")
        table.insert(args, pieces[2])
      end

      return args
    end,
    entry_marker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  })

  pickers
    .new(opts, {
      debounce = 100,
      prompt_title = "MultiGrep (double space for path glob)",
      finder = finder,
      previewer = conf.grep_previewer(opts),
      sorter = require("telescope.sorters").empty(),
    })
    :find()
end

-- map("n", "<Leader>/", "<CMD>FzfLua live_grep_glob<cr>")
map("n", "<Leader>/", function()
  live_multigrep()
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

-- Taken from `Advanced telescope.nvim` Examples, search plugin
map({ "n" }, "<Leader>fp", function()
  require("telescope.builtin").find_files({
    cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
  })
end, { desc = "Find plugin files via telescope" })
