return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "Issafalcon/neotest-dotnet"
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-dotnet")({
          dap = {
            -- Extra arguments for nvim-dap configuration
            -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
            args = {justMyCode = false },
            -- Enter the name of your dap adapter, the default value is netcoredbg
            adapter_name = "netcoredbg"
          },
          -- Let the test-discovery know about your custom attributes (otherwise tests will not be picked up)
          -- Note: Only custom attributes for non-parameterized tests should be added here. See the support note about parameterized tests
          custom_attributes = {
            xunit = { "MyCustomFactAttribute" },
            nunit = { "MyCustomTestAttribute" },
            mstest = { "MyCustomTestMethodAttribute" }
          },
          -- Provide any additional "dotnet test" CLI commands here. These will be applied to ALL test runs performed via neotest. These need to be a table of strings, ideally with one key-value pair per item.
          dotnet_additional_args = {
            "--verbosity detailed"
          },
          -- Tell neotest-dotnet to use either solution (requires .sln file) or project (requires .csproj or .fsproj file) as project root
          -- Note: If neovim is opened from the solution root, using the 'project' setting may sometimes find all nested projects, however,
          --       to locate all test projects in the solution more reliably (if a .sln file is present) then 'solution' is better.
          discovery_root = "project" -- Default

          -- Keymappings for neotest-dotnet
        })
      }
    })

    vim.api.nvim_set_keymap('n', '<leader>tn', ':lua require("neotest").run.run()<CR>', { noremap = true, silent = true, desc = "Run all tests" })
    vim.api.nvim_set_keymap('n', '<leader>tf', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', { noremap = true, silent = true, desc = "Run tests in current file" })
    vim.api.nvim_set_keymap('n', '<leader>ts', ':lua require("neotest").run.stop()<CR>', { noremap = true, silent = true, desc = "Stop test run" })
    vim.api.nvim_set_keymap('n', '<leader>to', ':lua require("neotest").summary.open()<CR>', { noremap = true, silent = true, desc = "Open test output" })
    vim.api.nvim_set_keymap('n', '<leader>tc', ':lua require("neotest").summary.close()<CR>', { noremap = true, silent = true, desc = "Close test output" })
    vim.api.nvim_set_keymap('n', '<leader>tt', ':lua require("neotest").summary.toggle()<CR>', { noremap = true, silent = true, desc = "Toggle test output" })
    vim.api.nvim_set_keymap('n', '<leader>tnf', ':lua require("neotest").jump.next({ status = "failed" })<CR>', { noremap = true, silent = true, desc = "Jump to next failed test" })
    vim.api.nvim_set_keymap('n', '<leader>tpf', ':lua require("neotest").jump.prev({ status = "failed" })<CR>', { noremap = true, silent = true, desc = "Jump to previous failed test" })
    vim.api.nvim_set_keymap('n', '<leader>to', ':lua require("neotest").output.open({ enter = true })<CR>', { noremap = true, silent = true, desc = "Open test output" })
    vim.api.nvim_set_keymap('n', '<leader>td', ':lua require("neotest").run.run({ strategy = "dap" })<CR>', { noremap = true, silent = true, desc = "Debug all tests" })
  end,
}
