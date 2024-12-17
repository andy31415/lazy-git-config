-- Requires `cargo install silicon`
--
-- This looks like nice themes, but background a bit uglier than codesnap
return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  main = "nvim-silicon",
  opts = {
    -- bat thems
    --   bat --list-themes | fzf --preview="bat --theme={} --color=always src/app/data-model-provider/MetadataTypes.h"
    -- theme = "gruvbox-dark",
    -- theme = "Dracula",
    theme = "Monokai Extended",
    font = "MonoLisa",
  },
  keys = {
    {
      "<leader>cp",
      function()
        require("nvim-silicon").clip()
      end,
      mode = "x",
      desc = "Silicon: code shapshot in clipboard",
    },
  },
}
