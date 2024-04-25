vim.g.gitblame_enabled = 0

return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  config = function()
    vim.api.nvim_set_keymap("n", "<leader>gb", ":GitBlameToggle<cr>", { noremap = true, silent = true })
  end
}