-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
vim.g.autoformat = true
if not vim.env.SSH_TTY then
  -- only set clipboard if not in ssh, to make sure the OSC 52
  -- integration works automatically. Requires Neovim >= 0.10.0
  opt.clipboard = "unnamedplus" -- Sync with system clipboard
end

if vim.g.vscode then
  opt.cursorcolumn = false
  opt.cursorline = false
else
  opt.cursorcolumn = false -- Enable highlighting of the current column
  -- Rulers
  opt.ruler = true
  opt.colorcolumn = "100"

  -- Folding
  opt.foldmethod = "expr"
  opt.foldexpr = "nvim_treesitter#foldexpr()"
  opt.foldenable = false -- don't fild everything by default
  opt.foldcolumn = "auto:3"
  opt.foldminlines = 5
  opt.fillchars = opt.fillchars + "foldopen:󰛲,foldclose:󰜄"

  opt.exrc = true

  -- Title
  opt.title = true
end
