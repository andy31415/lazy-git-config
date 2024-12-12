return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- NOTE: requires a RECENT sk version otherwise we get `index` not being available for tiebreak
    -- Currently I get "unsupported action - nil" when using skim, so I disabled it
    "skim", -- skim seems nice, even though unclear if easiest. Requires sk
    fzf_opts = {
      ["--no-scrollbar"] = false,
    },
    keys = {
      { "<leader>/", "<CMD>FzfLua live_grep_glob<cr>", desc = "Live Grep Glob" },
    },
    keymap = {
      fzf = {
        true, -- inherit (e.g. alt+a selects all)
        -- For fzf "select-all+accept is sufficient, but for skim we seem to need enter"
        ["ctrl-q"] = "select-all+accept(enter)",
      },
    },
    -- "telescope", -- skim seems nice, even though unclear if easiest. Requires sk
    defaults = {
      git_icons = false, -- faster
      -- file_icons = false,
    },
    files = {
      -- Optimized for CHIP
      fd_opts = [[--color=never --type f --prune --hidden -E .git -E __pycache__ -E out -E third_party ]],
    },
    grep = {
      rg_opts = "--hidden --no-ignore --column --line-number --no-heading --color=always --smart-case --max-columns=4096 -g '!out' -g '!.git' -g '!third_party' -e",
    },
  },
}
