return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  config = function()
    local dap, dapui = require('dap'), require('dapui')

    -- Configure UI
    dapui.setup()

    -- Automatically open UI on debugging start
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

    -- Automatically close UI on debugging end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    --- Toggle DAP UI
    vim.api.nvim_set_keymap('n', '<leader>bu', "<cmd>lua require'dapui'.toggle()<CR>", { noremap = true, silent = true, desc = "Toggle DAP UI" })

    -- Evaluate Expression
    vim.api.nvim_set_keymap('n', '<leader>be', "<cmd>lua require'dapui'.eval()<CR>", { noremap = true, silent = true, desc = "Evaluate Expression"})
  end,
}
