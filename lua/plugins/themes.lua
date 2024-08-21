return {
  {
    "ellisonleao/gruvbox.nvim",
    enabled = true,
    lazy = true,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function()
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })
    end,
  },
  {
    "liuchengxu/space-vim-dark", --space-vim-dark
  },
  { --github
    "cormacrelf/vim-colors-github",
  },
  {
    "NLKNguyen/papercolor-theme",
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    --     onedark
    -- onelight
    -- onedark_vivid
    -- onedark_dark
  },
  { "Mofiqul/vscode.nvim", priority = 1000 },

  {
    "LazyVim/LazyVim",
    config = true,
    opts = {
      colorscheme = "catppuccin",
      no_bold = true,
      background = { -- :h background
        light = "vscode",
        dark = "catppuccin",
      },
    },
  },
}
