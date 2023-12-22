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
        auto_trigger = true
      }
    })
  end,
}
