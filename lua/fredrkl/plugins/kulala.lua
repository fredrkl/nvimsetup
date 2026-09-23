return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  opts = {
     global_keymaps = true,
     kulala_keymaps = {
       ["Previous tab"] = {
         "<S-Tab>",
         function()
           require("kulala.ui").show_previous_tab()
         end,
         mode = { "n" },
       },
       ["Next tab"] = {
         "<Tab>",
         function()
           require("kulala.ui").show_next_tab()
         end,
         mode = { "n" },
       },
     },
  },
}
