return {
  'sindrets/diffview.nvim',
  config = function()
    require('diffview').setup()
    vim.api.nvim_set_keymap('n', '<leader>go', ':DiffviewOpen<CR>', { noremap = true, silent = true, desc = "Open Diffview" })
    vim.api.nvim_set_keymap('n', '<leader>gc', ':DiffviewClose<CR>', { noremap = true, silent = true, desc = "Close Diffview" })
    vim.api.nvim_set_keymap('n', '<leader>gr', ':DiffviewRefresh<CR>', { noremap = true, silent = true, desc = "Refresh Diffview" })
    vim.api.nvim_set_keymap('n', '<leader>gh', ':DiffviewFileHistory<CR>', { noremap = true, silent = true, desc = "File history Diffview" })
    vim.api.nvim_set_keymap('n', '<leader>gf', ':DiffviewFileHistory %<CR>', { noremap = true, silent = true, desc = "File history file Diffview" })
  end,
}
