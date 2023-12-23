vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
opt.eol = true -- always have and eof at the last line

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- Move back and forth between files
local keymap = vim.keymap
-- Probably because mapleader is not yet set
keymap.set("n", "<leader>nb", "<cmd>bprevious<CR>", { noremap = true })
keymap.set("n", "<leader>nf", "<cmd>bnext<CR>", { noremap = true })
