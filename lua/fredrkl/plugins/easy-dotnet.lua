return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim', },
--  opts = {
--     lsp = {
--       config = {
--         settings = {
--           ["csharp|code_lens"] = {
--             dotnet_enable_references_code_lens = true,
--           },
--         },
--       },
--     },
--  },
  config = function()
    require("easy-dotnet").setup()
    setup_global_keymaps()
    vim.api.nvim_set_keymap('n', '<F5>', "<cmd>lua require'dap'.continue()<CR>", { noremap = true, silent = true, desc = "Start/Continue" })
    vim.api.nvim_set_keymap('n', '<F7>', "<cmd>lua require'dap'.step_over()<CR>", { noremap = true, silent = true, desc = "Step Over" })
    vim.api.nvim_set_keymap('n', '<F8>', "<cmd>lua require'dap'.step_into()<CR>", { noremap = true, silent = true, desc = "Step Into" })
  end
}
