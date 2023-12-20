return {
  "mbbill/undotree",
  config = function()
    local keymap = vim.keymap
    keymap.set('n', '<leader>uu', vim.cmd.UndotreeToggle)
    keymap.set('n', '<leader>uf', vim.cmd.UndotreeFocus)
  end,
}
