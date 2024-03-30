return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "buffer",
      separator_style = "slant" or "padded_slant",
      diagnostics = "nvim_lsp",
      color_icons = true,
      enforce_regular_tabs = false,
    },
  },
}
