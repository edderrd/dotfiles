local runners = {
  python = function()
    local ok, venv = pcall(require, "venv-selector")
    return (ok and venv.python()) or "python3"
  end,
  sh = "bash",
  lua = "lua",
  typescript = "tsx",
  javascript = "node",
  go = "go run",
  rust = "cargo run",
}

return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>rr",
      function()
        local ft = vim.bo.filetype
        if ft == "" then
          vim.notify("No filetype detected", vim.log.levels.WARN)
          return
        end

        local runner = runners[ft]
        if not runner then
          vim.notify('No runner configured for "' .. ft .. '"', vim.log.levels.WARN)
          return
        end

        local cmd = type(runner) == "function" and runner() or runner
        local file = vim.fn.expand("%")

        Snacks.terminal({ cmd, file }, {
          win = { title = ft .. " runner" },
          auto_close = false,
        })
      end,
      desc = "Run File",
    },
  },
}
