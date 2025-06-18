-- ~/.config/nvim/lua/plugins/nvim-cmp.lua

return {
  -- Configuração principal do nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- Fontes de completion
      "hrsh7th/cmp-nvim-lsp", -- LSP completion
      "hrsh7th/cmp-buffer", -- Buffer completion
      "hrsh7th/cmp-path", -- Path completion
      "hrsh7th/cmp-cmdline", -- Command line completion
      "hrsh7th/cmp-nvim-lua", -- Neovim Lua API completion
      "hrsh7th/cmp-emoji", -- Emoji completion
      "hrsh7th/cmp-calc", -- Calculator completion
      "f3fora/cmp-spell", -- Spell completion

      -- Snippets
      "L3MON4D3/LuaSnip", -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- LuaSnip completion source
      "rafamadriz/friendly-snippets", -- Snippet collection

      -- Ícones
      "onsails/lspkind.nvim", -- VSCode-like pictograms
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      -- Carrega snippets do friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Merge com as configurações existentes do LazyVim
      opts = opts or {}

      -- Configuração do snippet engine
      opts.snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      }

      -- Configuração da janela de completion
      opts.window = opts.window or {}
      opts.window.completion = cmp.config.window.bordered({
        border = "rounded",
        winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
      })
      opts.window.documentation = cmp.config.window.bordered({
        border = "rounded",
        winhighlight = "Normal:CmpDoc",
      })

      -- Preserva formatação existente e adiciona customizações
      local existing_format = opts.formatting and opts.formatting.format
      opts.formatting = opts.formatting or {}
      opts.formatting.format = function(entry, vim_item)
        -- Aplica formatação existente primeiro (importante para Tailwind)
        if existing_format then
          vim_item = existing_format(entry, vim_item)
        end

        -- Aplica lspkind
        vim_item = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
          show_labelDetails = true,
        })(entry, vim_item)

        -- Customiza o menu dos sources
        local source_names = {
          nvim_lsp = "[LSP]",
          luasnip = "[Snip]",
          buffer = "[Buf]",
          path = "[Path]",
          nvim_lua = "[Lua]",
          emoji = "[Emoji]",
          calc = "[Calc]",
          spell = "[Spell]",
        }
        vim_item.menu = source_names[entry.source.name] or "[" .. entry.source.name .. "]"

        return vim_item
      end

      -- Mapeamentos de teclas
      opts.mapping = vim.tbl_extend(
        "force",
        opts.mapping or {},
        cmp.mapping.preset.insert({
          -- Navegação
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),

          -- Scroll da documentação
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),

          -- Ações
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false, -- Não seleciona automaticamente o primeiro item
          }),

          -- Tab para completion e navegação de snippets
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        })
      )

      -- Fontes de completion (merge com existentes)
      local custom_sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "nvim_lua", priority = 500 },
        { name = "path", priority = 250 },
      }, {
        { name = "buffer", priority = 250, keyword_length = 3 },
        { name = "emoji", priority = 100 },
        { name = "calc", priority = 100 },
        { name = "spell", priority = 100 },
      })

      -- Merge sources preservando as existentes
      if opts.sources then
        for _, source_group in ipairs(custom_sources) do
          for _, source in ipairs(source_group) do
            table.insert(opts.sources, source)
          end
        end
      else
        opts.sources = custom_sources
      end

      -- Configurações experimentais
      opts.experimental = opts.experimental or {}
      opts.experimental.ghost_text = {
        hl_group = "CmpGhostText",
      }

      -- Comparadores para ordenação
      opts.sorting = opts.sorting or {}
      opts.sorting.priority_weight = 2
      opts.sorting.comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      }

      return opts
    end,

    -- Configuração adicional após o setup
    config = function(_, opts)
      local cmp = require("cmp")
      cmp.setup(opts)

      -- Configuração para command line
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      -- Integração adicional com autopairs se estiver instalado
      local ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
      if ok then
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end

      -- Define highlights customizados
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      vim.api.nvim_set_hl(0, "CmpPmenu", { bg = "#1e1e2e", fg = "#cdd6f4" })
      vim.api.nvim_set_hl(0, "CmpSel", { bg = "#45475a", fg = "#cdd6f4" })
      vim.api.nvim_set_hl(0, "CmpDoc", { bg = "#1e1e2e", fg = "#cdd6f4" })
    end,
  },

  -- Configuração do LuaSnip (engine de snippets)
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    keys = {
      {
        "<C-l>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<C-l>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      {
        "<C-l>",
        function()
          require("luasnip").jump(1)
        end,
        mode = "s",
      },
      {
        "<C-h>",
        function()
          require("luasnip").jump(-1)
        end,
        mode = { "i", "s" },
      },
    },
  },

  -- Auto-pairs integration
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = {
      check_ts = true, -- treesitter integration
      ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
        java = false,
      },
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
      },
    },
  },
}
