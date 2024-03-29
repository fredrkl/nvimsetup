return {
  'mrcjkb/rustaceanvim',
  version = '^4', -- Recommended
  ft = { 'rust' },
  config = function()
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>ra", "<cmd>RustLsp codeAction<CR>", { desc = "Rust LSP Code Action"}) -- toggle file explorer
    keymap.set("n", "<leader>rh", "<cmd>RustLsp hover actions<CR>", { desc = "Rust LSP Hover Action"}) -- toggle file explorer
  end,
}
