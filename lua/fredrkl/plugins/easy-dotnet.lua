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
  end
}
