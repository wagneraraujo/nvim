return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      branch = "v3.x",
      window = {
        position = "right",
        width = 30,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
      },
      -- git_status = {
      --   symbols = {
      --     -- Change type
      --     added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
      --     modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
      --     deleted = "✖", -- this can only be used in the git_status source
      --     renamed = "󰁕", -- this can only be used in the git_status source
      --     untracked = "",
      --     ignored = "",
      --     unstaged = "󰄱",
      --     staged = "",
      --     conflict = "",
      --   },
      -- },
    },
  },
  {
    "mg979/vim-visual-multi",
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      top_down = false,
    },
  },
  {
    "p00f/nvim-ts-rainbow",
  },
  {
    "akinsho/git-conflict.nvim",
    tag = "*",
    config = function()
      require("git-conflict").setup()
    end,
  },
  { "jaredgorski/spacecamp" },
}
