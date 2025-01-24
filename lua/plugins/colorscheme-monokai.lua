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
        override = function()
          -- I find black not that visisble
          return {
            WinSeparator = { fg = "#821803" },
          }
        end,
        ---@param cs Colorscheme
        ---@param p ColorschemeOptions
        ---@param config MonokaiProOptions
        ---@param hp Helper
        overrideScheme = function(cs, p, config, hp)
          local cs_override = {}
          local calc_bg = hp.blend(p.background, 0.85, "#000000")

          cs_override.editor = {
            background = calc_bg,
          }
          return cs_override
        end,
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
