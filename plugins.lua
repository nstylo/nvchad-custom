local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- format
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { { "biome", "prettier" } },
        typescript = { { "biome", "prettier" } },
        javascriptreact = { { "biome", "prettier" } },
        typescriptreact = { { "biome", "prettier" } },
        json = { "prettier" },
      },
      -- Set up format-on-save
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
    },
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "nvim-treesitter/playground",
  },

  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && yarn install",
  },

  {
    "tpope/vim-fugitive",
    -- TODO: should probably support all commands
    cmd = { "Git", "G" },
  },

  {
    "lark-parser/vim-lark-syntax",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "lark" },
  },

  {
    "raimon49/requirements.txt.vim",
    ft = { "requirements" },
    -- TODO: this is temporary until the shebang detection is not buggy anymore
    commit = "f3f13b9fdcb09a0903169c18014d413cbbb46c7b",
  },

  {
    "jvgrootveld/telescope-zoxide",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "vyperlang/vim-vyper",
    ft = { "vyper" },
  },

  {
    "gpanders/editorconfig.nvim",
  },

  {
    "stevearc/aerial.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("aerial").setup {
        layout = {
          max_width = { 40, 0.2 },
          min_width = 20,
        },
      }
      vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
    end,
    -- TODO: this will always load Aerial,
    -- but we need a more dynamic way
    lazy = false,
  },

  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup {
        lightbulb = {
          enable = false,
        },
      }
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
    event = "LspAttach",
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

-- TODO: this is just a temporary fix, because forge fmt does not work with conform.nvim
vim.api.nvim_create_autocmd(
  "BufWritePost",
  { pattern = "*/**/*.sol", command = string.format("silent !forge fmt %s", vim.api.nvim_buf_get_name(0)) }
)

return plugins
