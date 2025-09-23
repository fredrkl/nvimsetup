return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      local harpoon = require("harpoon")
      -- REQUIRED
      harpoon:setup()

      -- basic telescope configuration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
          local file_paths = {}
          for _, item in ipairs(harpoon_files.items) do
              table.insert(file_paths, item.value)
          end
      
          require("telescope.pickers").new({}, {
              prompt_title = "Harpoon",
              finder = require("telescope.finders").new_table({
                  results = file_paths,
              }),
              previewer = conf.file_previewer({}),
              sorter = conf.generic_sorter({}),
          }):find()
      end

      vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon: Add file" })
      vim.keymap.set("n", "<leader>hr", function() harpoon:list():remove() end, { desc = "Harpoon: Remove file" })
      vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: Toggle menu" })
      vim.keymap.set("n", "<leader>ht",function() toggle_telescope(harpoon:list()) end, { desc = "Harpoon: Open Harpoon window" })
      vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Harpoon: Go to file 1" })
      vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Harpoon: Go to file 2" })
      vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Harpoon: Go to file 3" })
      vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Harpoon: Go to file 4" })
      vim.keymap.set("n", "<leader>hj", function() harpoon:list():prev() end, { desc = "Harpoon: Go to previous file" })
      vim.keymap.set("n", "<leader>hk", function() harpoon:list():next() end, { desc = "Harpoon: Go to next file" })
    end
}
