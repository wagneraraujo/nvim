return {
  {
    "zaldih/themery.nvim",
    config = function()
      require("themery").setup({
        themes = {
          "gruvbox",
          "ayu",
          "onedark",
          "kanagawa",
          "gruvbox-material",
          "space-vim-dark",
          "github",
          "catppuccin",
          "minimal-base16",
          "monokai-nightasty",
          "vim-colors-github",
          "papercolor-theme",
        }, -- Your list of installed colorschemes
        -- themeConfigFile = "~/.config/nvim/lua/settings/theme.lua", -- Described below
        livePreview = true, -- Apply theme while browsing. Default to true.
      })
    end,
  },
}
