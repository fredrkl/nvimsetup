return {
  -- Virtual Text (shows inline variable values)
  "dbinagi/nomodoro",
  dependencies = { 'nvim-lualine/lualine.nvim' },
  config = function()
    require('nomodoro').setup({
      work_time = 30,
      short_break_time = 5,
      long_break_time = 15,
      break_cycle = 4,
      menu_available = true,
      texts = {
        on_break_complete = "TIME IS UP!",
        on_work_complete = "TIME IS UP!",
        status_icon = "🍅 ",
        timer_format = '!%0M:%0S' -- To include hours: '!%0H:%0M:%0S'
      },
      on_work_complete = function() end,
      on_break_complete = function() end,
    })
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    map('n', '<leader>nw', '<cmd>NomoWork<cr>',{ noremap = true, silent = true, desc = "Start Work"})
    map('n', '<leader>nb', '<cmd>NomoBreak<cr>',{ noremap = true, silent = true, desc = "Start Break"})
    map('n', '<leader>ns', '<cmd>NomoStop<cr>',{ noremap = true, silent = true, desc = "Stop Timer"}) 
    map('n', '<leader>nt', '<cmd>NomoStatus<cr>',{ noremap = true, silent = true, desc = "Show Timer Status"})

    local lualine = require'lualine'
    lualine.setup({
      sections = {
        lualine_x = {
          require('nomodoro').status,
        }
      }
    })
  end,
}
