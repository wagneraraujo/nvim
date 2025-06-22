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
-- map("<C-y>", "<cmd>%y+<cr>", { desc = "Next buffer" })
-- map("n", "<leader>ci", "<cmd>TypescriptAddMissingImports<cr>", { desc = "Import missing type" })
vim.keymap.set("n", "<leader>y", '<cmd>"+y<cr>')
--"<leader>ci", "<cmd>TypescriptAddMissingImports<cr>"
vim.keymap.set("n", "<leader>ls", require("auto-session.session-lens").search_session, {
  noremap = true,
})

-- Adicione no seu arquivo de keymaps
vim.keymap.set(
  { "n", "v" },
  "<Leader>cc",
  "<cmd>CodeCompanionActions<cr>",
  { noremap = true, silent = true, desc = "CodeCompanion Actions" }
)
vim.keymap.set(
  { "n", "v" },
  "<Leader>ce",
  "<cmd>CodeCompanion<cr>",
  { noremap = true, silent = true, desc = "CodeCompanion Chat" }
)
vim.keymap.set(
  "v",
  "<Leader>ca",
  "<cmd>CodeCompanionAdd<cr>",
  { noremap = true, silent = true, desc = "CodeCompanion Add" }
)
vim.keymap.set(
  "n",
  "<Leader>ct",
  "<cmd>CodeCompanionToggle<cr>",
  { noremap = true, silent = true, desc = "CodeCompanion Toggle" }
)

-- nnoremap <F5> :UndotreeToggle<CR>
vim.keymap.set("n", "<F5>", "<cmd>:UndotreeToggle<cr>")

local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Rust específico
map("n", "<leader>rr", ":RustRun<CR>", { desc = "Rust Run" })
map("n", "<leader>rt", ":RustTest<CR>", { desc = "Rust Test" })
map("n", "<leader>rd", ":RustDebuggables<CR>", { desc = "Rust Debuggables" })
map("n", "<leader>rp", ":RustParentModule<CR>", { desc = "Rust Parent Module" })
map("n", "<leader>rm", ":RustExpandMacro<CR>", { desc = "Rust Expand Macro" })
map("n", "<leader>rc", ":RustOpenCargo<CR>", { desc = "Rust Open Cargo.toml" })
map("n", "<leader>rg", ":RustViewCrateGraph<CR>", { desc = "Rust View Crate Graph" })

-- CodeCompanion
vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })

-- Menu principal de ações
vim.keymap.set(
  { "n", "v" },
  "<leader>cc",
  "<cmd>CodeCompanionActions<cr>",
  vim.tbl_extend("force", opts, { desc = "CodeCompanion Actions" })
)
