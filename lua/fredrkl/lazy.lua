local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- Example using a list of specs with the default options

require("lazy").setup({
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
})


--  use 'wbthomason/packer.nvim'
--  use {
--	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
--	  -- or                            , branch = '0.1.x',
--         requires = { {'nvim-lua/plenary.nvim'} }
--  }
--  use 'nvim-tree/nvim-tree.lua'
--  use 'mbbill/undotree'
