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
}
