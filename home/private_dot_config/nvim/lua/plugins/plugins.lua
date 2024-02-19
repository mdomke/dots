return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    opts = {
      defaults = {
        layout_strategy = "center",
        layout_config = {
          -- prompt_position = "top",
          preview_cutoff = 30,
        },
        sorting_strategy = "ascending",
      },
    },
    init = function()
      require("telescope").load_extension("notify")
    end,
    keys = {
      {
        "<leader>uh",
        "<cmd>Telescope notify<cr>",
        desc = "Notification history",
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_z, "😄")
    end,
  },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        ensure_installed = {
          "go",
          "rust",
        },
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        always_show_bufferline = true,
        separator_style = "thick",
      },
      highlights = require("nord").bufferline.highlights({
        italic = true,
        bold = true,
      }),
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "pyright",
        "black",
        "isort",
        "gomodifytags",
      },
    },
  },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   event = "BufReadPre",
  --   dependencies = { "mason.nvim" },
  --   opts = function()
  --     local nls = require("null-ls")
  --     return {
  --       sources = {
  --         nls.builtins.diagnostics.flake8,
  --         nls.builtins.diagnostics.golangci_lint,
  --         nls.builtins.formatting.stylua,
  --         nls.builtins.formatting.isort,
  --         nls.builtins.formatting.black,
  --         nls.builtins.formatting.goimports,
  --         -- nls.builtins.formatting.prettierd,
  --         nls.builtins.formatting.buf,
  --         nls.builtins.code_actions.gomodifytags,
  --       },
  --     }
  --   end,
  -- },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "tpope/vim-abolish",
    lazy = false,
  },
  {
    "towolf/vim-helm",
    ft = {
      "helm",
    },
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {
          cmd = { "pyright-langserver", "--stdio", "--verbose" },
          settings = {
            python = {
              analysis = {
                useLibraryCodeForTypes = true,
              },
            },
          },
          lua_ls = {},
        },
      },
    },
  },
  -- {
  --   "lukas-reineke/headlines.nvim",
  --   dependencies = "nvim-treesitter/nvim-treesitter",
  --   ft = { "markdown" },
  --   opts = {
  --     markdown = {
  --       headline_highlights = {
  --         "Headline1",
  --         "Headline2",
  --         "Headline3",
  --         "Headline4",
  --         "Headline5",
  --         "Headline6",
  --       },
  --       codeblock_highlight = "CodeBlock",
  --       dash_highlight = "Dash",
  --       quote_highlight = "Quote",
  --     },
  --   },
  -- },
}
