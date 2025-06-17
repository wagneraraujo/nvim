-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- TypeScript/JavaScript
local ts_grp = vim.api.nvim_create_augroup("TSAutocmds", {})
-- EsLintAutoFix on save
--vim.api.nvim_create_autocmd("BufWritePre", {
-- pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
--  command = "silent! EslintFixAll",
--  group = ts_grp,
--})
-- LspRestart eslint on saving package.json
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "package.json" },
  command = "LspRestart eslint",
  group = ts_grp,
})

-- Autocmds para Rust
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local rust_group = augroup("RustSettings", { clear = true })

autocmd("FileType", {
  pattern = "rust",
  group = rust_group,
  callback = function()
    vim.opt_local.colorcolumn = "100"
    vim.opt_local.textwidth = 100
  end,
})

-- Auto-format on save
autocmd("BufWritePre", {
  pattern = "*.rs",
  group = rust_group,
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
