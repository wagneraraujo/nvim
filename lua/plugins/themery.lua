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
          "everforest",
          "space-vim-dark",
          "space-vim-dark",
          "github",
          "catppuccin",
        }, -- Your list of installed colorschemes
        -- themeConfigFile = "~/.config/nvim/lua/settings/theme.lua", -- Described below
        livePreview = true, -- Apply theme while browsing. Default to true.
      })
    end,
  },
}
