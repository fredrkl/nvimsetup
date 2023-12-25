return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      filetypes = {
        markdown = true
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<C-f>",
          accept_word = false,
          accept_line = false,
          next = "<C-l>",
          prev = "<C-h>",
          dismiss = "<C-i>",
        },
      },
    })
  end,
}
