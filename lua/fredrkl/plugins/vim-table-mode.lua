return {
  {
    "dhruvasagar/vim-table-mode",
    ft = { "markdown" },
    config = function()
      -- Optional: Configure Table Mode
      vim.g.table_mode_corner = '|'
    end,
  },
}
