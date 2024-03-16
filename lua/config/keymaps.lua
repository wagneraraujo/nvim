-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- local Util = require("lazyvim.util")

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
-- map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
-- map("n", "<leader>uf", function() Util.format.toggle() end, { desc = "Toggle auto format (global)" })
--

local Util = require("lazyvim.util")
local map = Util.safe_keymap_set
-- ["<c-m>"] = { "<cmd>NvimTreeFocus<cr>", "Open file explorer", noremap = true },
-- ["<c-Left>"] = { "<cmd>BufferLineCyclePrev<cr>", "Open file explorer", noremap = true },
-- ["<c-Right>"] = { "<cmd>BufferLineCycleNext<cr>", "Open file explorer", noremap = true },
-- ["<leader>hp"] = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk", noremap = true },
-- ["<leader>tb"] = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Blame Line", noremap = true },
-- vim.keymap.set("n", "<leader>a", require("lspimport").import, { noremap = true })
map("n", "<c-Left>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<c-Right>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
