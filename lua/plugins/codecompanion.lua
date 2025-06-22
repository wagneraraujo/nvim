return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "ollama",
            roles = {
              llm = "CodeCompanion",
              user = "You",
            },
          },
          inline = {
            adapter = "ollama",
          },
          agent = {
            adapter = "gemini",
          },
        },
        adapters = {
          ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
              schema = {
                model = {
                  default = "codellama:7b",
                  choices = {
                    "codellama:7b",
                    "codellama:13b",
                    "deepseek-coder:6.7b",
                    "llama3.1:8b",
                    "mistral:7b",
                  },
                },
                temperature = {
                  default = 0.3,
                },
              },
            })
          end,
          gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
              env = {
                api_key = "AIzaSyBHgtsQFHJYFhYtCE6nmb_BmfBpvtBwXYA",
              },
              headers = {
                ["Content-Type"] = "application/json",
              },
              schema = {
                model = {
                  default = "gemini-2.0-flash",
                },
                temperature = {
                  default = 0.7,
                },
                max_tokens = {
                  default = 8192,
                },
                top_p = {
                  default = 0.95,
                },
              },
            })
          end,
        },
        display = {
          action_palette = {
            width = 95,
            height = 10,
          },
          chat = {
            window = {
              layout = "vertical",
              width = 0.45,
              height = 0.8,
              relative = "editor",
              opts = {
                breakindent = true,
                cursorcolumn = false,
                cursorline = false,
                foldcolumn = "0",
                linebreak = true,
                list = false,
                signcolumn = "no",
                spell = false,
                wrap = true,
              },
            },
          },
        },
        opts = {
          log_level = "ERROR",
          send_code = true,
          use_default_actions = true,
          use_default_prompts = true,
        },
      })
    end,
  },
}
