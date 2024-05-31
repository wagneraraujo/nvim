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
  { "Mofiqul/adwaita.nvim", priority = 1000 },
  { "rmehri01/onenord.nvim", priority = 1000 },
  { "arzg/vim-colors-xcode", priority = 1000 }, --xcodelight
  {
    "uloco/bluloco.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    --bluloco-light
    config = function()
      -- your optional config goes here, see below.
      require("bluloco").setup({
        style = "auto", -- "auto" | "dark" | "light"
        transparent = false,
        italics = false,
        terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
        guicursor = true,
      })
    end,
  },
  {
    "oxfist/night-owl.nvim",
    config = function()
      require("night-owl").setup()
    end,
  },

  {
    "LazyVim/LazyVim",
    config = true,
    opts = {
      colorscheme = "night-owl",
      no_bold = true,
      background = { -- :h background
        light = "vscode",
        dark = "adwaita",
      },
    },
  },
}
