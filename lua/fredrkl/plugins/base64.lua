return {
  { 
    "moevis/base64.nvim",
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>6', ':Base64Decode<cr>', {})
      vim.api.nvim_set_keymap('v', '<leader>6', ':Base64Decode<cr>', {})
      vim.api.nvim_set_keymap('n', '<leader>4', ':Base64Encode<cr>', {})
      vim.api.nvim_set_keymap('v', '<leader>4', ':Base64Encode<cr>', {})
    end,
  },
}
