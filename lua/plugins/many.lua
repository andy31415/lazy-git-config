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
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local actions = require("fzf-lua.actions")
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({
        -- NOTE: requires a RECENT sk version otherwise we get `index` not being available for tiebreak
        -- Currently I get "unsupported action - nil" when using skim, so I disabled it
        "skim", -- skim seems nice, even though unclear if easiest. Requires sk
        keymap = {
          fzf = {
            ["ctrl-q"] = "select-all+accept",
          },
        },
        defaults = {
          git_icons = false, -- faster
          -- file_icons = false,
        },
        files = {
          -- Optimized for CHIP
          fd_opts = [[--color=never --type f --prune --hidden -E .git -E __pycache__ -E out -E third_party ]],
        },
        grep = {
          rg_opts = "--hidden --no-ignore --column --line-number --no-heading --color=always --smart-case --max-columns=4096 -g '!out' -g '!.git' -e",
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      -- setup treesitter with config
    end,
    dependencies = {
      -- NOTE: additional parser
      -- { "nushell/tree-sitter-nu", build = ":TSUpdate nu" },
      { "willcassella/nvim-gn", build = ":TSUpdate nu" },
    },
  },
}
