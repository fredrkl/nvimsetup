vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
opt.eol = true -- always have and eof at the last line
vim.opt.cursorline = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- buffers
opt.splitright = true

--copy
opt.clipboard = 'unnamedplus'

-- Move back and forth between files
local keymap = vim.keymap
-- Probably because mapleader is not yet set
keymap.set("n", "<leader>nb", "<cmd>bprevious<CR>", { noremap = true })
keymap.set("n", "<leader>nf", "<cmd>bnext<CR>", { noremap = true })

-- Window navigation
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<leader>sp", "<cmd>set spell!<CR>", { desc = "Toggle spell checking" }) -- Toogle spellchecker
keymap.set('n', '<leader>ss', "z=", { noremap = true, silent = true, desc = "Spelling suggestions" })

--Lazy
keymap.set('n', '<leader>ll', "<cmd>Lazy<CR>", { noremap = true, desc = "Lazy" })

function setup_global_keymaps(bufnr)
  local keymap = vim.keymap
  local opts = { noremap = true, silent = true }
  if bufnr then
    opts.buffer = bufnr
  end
  opts.desc = "Show LSP references"
  keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
  opts.desc = "Go to declaration"
  keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

  opts.desc = "Show LSP implementations"
  keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

  opts.desc = "Show LSP type definitions"
  keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

  opts.desc = "Show diagnostic messages"
  keymap.set("n", "gd", vim.diagnostic.open_float, opts) -- show lsp type definitions

  opts.desc = "Show all diagnostic messages"
  keymap.set("n", "gad","<cmd>Telescope diagnostics<CR>", opts) -- show lsp type definitions

  opts.desc = "See available code actions"
  keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

  opts.desc = "Smart rename"
  keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

  opts.desc = "Restart LSP"
  keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
end

-- Roslyn LSP keymaps for C# files. My Roslyn LSP does not support the on_attach function, so I have to use an autocmd instead.
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'cs',
  callback = function()
      setup_global_keymaps()
  end
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.opt_local.colorcolumn = "80" -- set local colorcolumn to 80 for markdown files
  end
})
