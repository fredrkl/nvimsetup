return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install { 'c_sharp', 'lua', 'json' }
  end,
}
--
--
--
--
--
--return {
--  -- Highlight, edit, and navigate code
--  'nvim-treesitter/nvim-treesitter',
--  event = "BufRead",
--  branch = 'main',
--  dependencies = {
--    'nvim-treesitter/nvim-treesitter-textobjects',
--  },
--  build = ':TSUpdate',
--  config = function()
--    require("nvim-treesitter.config").setup {
--      ensure_installed = {"bicep", "terraform", "c_sharp", "rust", "lua", "xml", "http", "json", "graphql", "diff"},
--      highlight = {
--        enable = true,
--      },
--      incremental_selection = {
--        enable = true,
--        keymaps = {
--          init_selection = "gnn",          -- Start selection
--          node_incremental = "grn",        -- Increment to next node
--          scope_incremental = "grc",       -- Increment to next scope
--          node_decremental = "grm",        -- Decrement to previous node
--        },
--      },
--    }
--  end,
--}
