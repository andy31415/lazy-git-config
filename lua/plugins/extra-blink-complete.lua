return {
  {
    "saghen/blink.compat",
    -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
    version = "*",
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {
      impersonate_nvim_cmp = true,
    },
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
  -- {
  --   "tzachar/cmp-ai",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   init = function()
  --     local cmp_ai = require("cmp_ai.config")
  --     cmp_ai:setup({
  --       max_lines = 100,
  --       provider = "ollama",
  --       provider_options = {
  --         model = "codellama:13b-code",
  --         -- model = "deepseek-coder:33b",
  --         -- model = "qwen2.5-coder:latest",
  --         -- model = "codegemma:7b",
  --         prompt = function(lines_before, lines_after)
  --           return lines_before
  --         end,
  --         suffix = function(lines_after)
  --           return lines_after
  --         end,
  --       },
  --       notify = true,
  --       notify_callback = function(msg)
  --         vim.notify(msg)
  --       end,
  --       -- run_on_every_keystroke = true,
  --       run_on_every_keystroke = true,
  --       ignored_file_types = {
  --         -- default is not to ignore
  --         -- uncomment to ignore in lua:
  --         -- lua = true
  --       },
  --     })
  --   end,
  -- },
  {
    "saghen/blink.cmp",
    dependencies = {
      { "saghen/blink.compat" },
      { "mikavilpas/blink-ripgrep.nvim" },
      -- { "tzachar/cmp-ai", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    opts = {
      sources = {
        completion = {
          enabled_providers = {
            -- "ripgrep", -- may use a LOT of ram and crash vim
            -- "cmp_ai" -- slow and not reliable TBH
          },
        },
        providers = {
          ripgrep = {
            module = "blink-ripgrep",
            name = "Ripgrep",
            opts = {
              prefix_min_len = 3,
              context_size = 5,
              max_filesize = "10K",
            },
          },
          cmp_ai = {
            name = "cmp_ai", -- IMPORTANT: use the same name as you would for nvim-cmp
            module = "blink.compat.source",
            opts = {},
          },
        },
      },
    },
  },
}
