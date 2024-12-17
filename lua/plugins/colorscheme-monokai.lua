return {
  {
    "loctvl842/monokai-pro.nvim",
    dependencies = {
      "nvim-treesitter",
    },
    config = function()
      require("monokai-pro").setup({
        plugins = {
          bufferline = {

            underline_selected = false,
            underline_visible = false,
          },
          indent_blankline = {
            context_highlight = "pro", -- default | pro
            context_start_underline = false,
          },
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro-spectrum",
    },
  },
}
