return {
  -- Main Debugging Plugin (DAP)
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require('dap')

    -- Setup .NET debugger using netcoredbg
    dap.adapters.coreclr = {
      type = 'executable',
      command = '/usr/local/bin/netcoredbg/netcoredbg',
      args = { '--interpreter=vscode' },
    }

    dap.configurations.cs = {
      {
        type = 'coreclr',
        name = 'launch - netcoredbg',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/net8.0/', 'file')
        end,
      },
    }

    -- Shortcuts
    --local keymap = vim.keymap -- for conciseness
    -- Toggle Breakpoint
    vim.api.nvim_set_keymap('n', '<leader>B', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { noremap = true, silent = true, desc = "Set breakpoint" })
    vim.api.nvim_set_keymap('n', '<F5>', "<cmd>lua require'dap'.continue()<CR>", { noremap = true, silent = true, desc = "Start/Continue" })
    vim.api.nvim_set_keymap('n', '<F6>', "<cmd>lua require'dap'.pause()<CR>", { noremap = true, silent = true, desc = "Pause" })
    vim.api.nvim_set_keymap('n', '<F8>', "<cmd>lua require'dap'.terminate()<CR>", { noremap = true, silent = true, desc = "Terminate" })
    vim.api.nvim_set_keymap('n', '<F9>', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, silent = true, desc = "Toggle Breakpoint" })
    vim.api.nvim_set_keymap('n', '<F10>', "<cmd>lua require'dap'.step_over()<CR>", { noremap = true, silent = true, desc = "Step Over" })
    vim.api.nvim_set_keymap('n', '<F11>', "<cmd>lua require'dap'.step_into()<CR>", { noremap = true, silent = true, desc = "Step Into" })
    vim.api.nvim_set_keymap('n', '<S-F11>', "<cmd>lua require'dap'.step_out()<CR>", { noremap = true, silent = true , desc = "Step Out"})
  
    --vim.api.nvim_set_keymap('n', '<leader>bh', "<cmd>lua require'dap'.continue()<CR>", { noremap = true, silent = true, desc = "Start/Continue" })
    vim.api.nvim_set_keymap('n', '<leader>bb', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, silent = true, desc = "Toggle breakpoint" })
    --vim.api.nvim_set_keymap('n', '<leader>bo', "<cmd>lua require'dap'.step_over()<CR>", { noremap = true, silent = true, desc = "Step Over" })
    --vim.api.nvim_set_keymap('n', '<leader>bi', "<cmd>lua require'dap'.step_into()<CR>", { noremap = true, silent = true, desc = "Step Into" })
    --vim.api.nvim_set_keymap('n', '<leader>bt', "<cmd>lua require'dap'.step_out()<CR>", { noremap = true, silent = true, desc ="Step Out" })  
    --vim.api.nvim_set_keymap('n', '<F12>', "<cmd>lua require'dap'.step_out()<CR>", { noremap = true, silent = true })

---- Evaluate Expression
--vim.api.nvim_set_keymap('n', '<Leader>e', "<cmd>lua require'dap.ui.widgets'.hover()<CR>", { noremap = true, silent = true })
--    ---- Toggle Breakpoint
--    --vim.api.nvim_set_keymap('n', '<leader>b', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, silent = true })
--    --
--    ---- Restart Debugging Session
--    --vim.api.nvim_set_keymap('n', '<leader>dr', "<cmd>lua require'dap'.restart()<CR>", { noremap = true, silent = true })
--    --
--    ---- Toggle DAP UI
--    --vim.api.nvim_set_keymap('n', '<leader>du', "<cmd>lua require'dapui'.toggle()<CR>", { noremap = true, silent = true })
--    --
--    ---- Evaluate Expression
--    --vim.api.nvim_set_keymap('n', '<leader>de', "<cmd>lua require'dapui'.eval()<CR>", { noremap = true, silent = true })

  end,
}
