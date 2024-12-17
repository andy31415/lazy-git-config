-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      local lspconfig = require("lspconfig")

      -- lspconfig.bash.setup({
      --   opts = {
      --     autoformat = false,
      --   },
      -- })

      lspconfig.clangd.setup({
        opts = {
          autoformat = false,
        },
      })
    end,
  },
  { "godlygeek/tabular" },
  {
    "ntpeters/vim-better-whitespace",
    init = function()
      -- Dashboard has lots of whitespace for some reason. Do not mess it up and make it red
      vim.g.better_whitespace_filetypes_blacklist = { "dashboard" }
    end,
  },
  {
    "willcassella/nvim-gn",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
