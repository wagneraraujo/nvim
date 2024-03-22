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
    -- config = function()
    --   require("git-conflict").setup()
    -- end,
  },
  { "jaredgorski/spacecamp" },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({})
    end,
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  {
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup({
        mappings = {
          set_next = "m,",
          next = "m<Down>",

          preview = "m:",
          set_bookmark0 = "<leader>md",
          toggle = "<leader>mt",
          prev = false, -- pass false to disable only this default mapping
        },
      })
    end,
  },
}
