return {
  "mbbill/undotree",
  config = function()
    local keymap = vim.keymap
    keymap.set('n', '<leader>uu', vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })
    keymap.set('n', '<leader>uf', vim.cmd.UndotreeFocus, { desc = "Focus on undotree" })
  end,
}
