local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "python",
    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",
    "comment",
    "bash",
    "yaml",
    "json",
    "markdown",
    "haskell",
    "json",
    "c",
    "cpp",
    "dockerfile",
    "go",
    "graphql",
    "vue",
    "query", -- treesitter query
    "sql",
    "rust",
    "svelte",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    "css-lsp",
    "dockerfile-language-server",
    "go-debug-adapter",
    "gofumpt",
    "goimports",
    "gopls",
    "html-lsp",
    "lua-language-server",
    "pyright",
    "python-lsp-server",
    "rust-analyzer",
    "rustfmt",
    "shfmt",
    "stylua",
    "typescript-language-server",
    "vue-language-server",
    "yaml-language-server",
    "clangd",
    "clang-tidy",
    "black",
    "isort",
    "prettier",
    "prettierd",
    "svelte-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--fixed-strings",
      "-g",
      "!Music",
      "-g",
      "!Bulk",
      "-g",
      "!node_modules",
      "-g",
      "!.git",
    },
    file_ignore_patterns = { "node_modules", "venv" },
    path_display = { "truncate" },
    dynamic_preview_title = true,
  },

  pickers = {
    find_files = {
      find_command = {
        "rg",
        "--color=never",
        "--files",
        "--hidden",
        "--smart-case",
        "-g",
        "!Music",
        "-g",
        "!Bulk",
        "-g",
        "!node_modules",
        "-g",
        "!.git",
      },
    },
  },

  extensions_list = {
    "zoxide",
  },
}

return M
