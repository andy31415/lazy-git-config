vim.api.nvim_create_user_command("OverseerRestartLast", function()
  local overseer = require("overseer")
  local tasks = overseer.list_tasks({ recent_first = true })
  if vim.tbl_isempty(tasks) then
    vim.notify("No tasks found", vim.log.levels.WARN)
  else
    overseer.run_action(tasks[1], "restart")
  end
end, {})

return {
  {
    "andy31415/chip-build.nvim",
    config = function()
      require("chip-build").setup({
        -- development = true
      })
    end,
    dependencies = {
      { "stevearc/overseer.nvim", opts = {} },
    },
  },
}
