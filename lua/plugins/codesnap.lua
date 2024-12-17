return {
  "mistricky/codesnap.nvim",
  build = "make",
  keys = {
    { "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "CodeSnap: code snapshot in clipboard" },
  },
  opts = {
    save_path = "~/Pictures/codesnap",
    has_breadcrumbs = true,
    bg_theme = "peach",
    watermark = "",
    mac_window_bar = false,
  },
}
