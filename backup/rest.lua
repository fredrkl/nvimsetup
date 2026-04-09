return {
  "rest-nvim/rest.nvim",
  ft = "http",
  dependencies = { "luarocks.nvim" },
  config = function()
    require("rest-nvim").setup()
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>rr", "<cmd>Rest run<CR>", { desc = "Run request under cursor" })
    keymap.set("n", "<leader>rl", "<cmd>Rest last<CR>", { desc = "Run last request" })
  end,
}
