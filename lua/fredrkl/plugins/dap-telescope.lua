return {
  -- Optional: Telescope integration for DAP (if using telescope)
  "nvim-telescope/telescope-dap.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("telescope").load_extension("dap")
  end,
}
