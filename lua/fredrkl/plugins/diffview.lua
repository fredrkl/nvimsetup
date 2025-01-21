return {
  'sindrets/diffview.nvim',
  config = function()
    require('diffview').setup()
    vim.api.nvim_set_keymap('n', '<leader>do', ':DiffviewOpen<CR>', { noremap = true, silent = true, desc = "Open Diffview" })
    vim.api.nvim_set_keymap('n', '<leader>dc', ':DiffviewClose<CR>', { noremap = true, silent = true, desc = "Close Diffview" })
    vim.api.nvim_set_keymap('n', '<leader>dr', ':DiffviewRefresh<CR>', { noremap = true, silent = true, desc = "Refresh Diffview" })
    vim.api.nvim_set_keymap('n', '<leader>dh', ':DiffviewFileHistory<CR>', { noremap = true, silent = true, desc = "File history Diffview" })
    vim.api.nvim_set_keymap('n', '<leader>df', ':DiffviewFileHistory %<CR>', { noremap = true, silent = true, desc = "File history file Diffview" })
  end,
}
