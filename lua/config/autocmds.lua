-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("no_auto_fmt"),
  pattern = {
    "sh",
    "cpp", -- I will manually format as needed
    "cmake", -- Should not be formatted directly
    "yaml", -- these are not standardized in chip
  },
  callback = function(_)
    vim.b.autoformat = false
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("space_sw_4"),
  pattern = {
    "cpp",
  },
  callback = function(_)
    vim.bo.sw = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("pyfiles"),
  pattern = {
    "python",
  },
  callback = function(_)
    require("lspconfig").pylsp.setup({
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              -- ignore = { "W391" },
              maxLineLength = 120,
            },
          },
        },
      },
    })
  end,
})
