return {
   ["nvim-telescope/telescope-fzf-native.nvim"] = {
      requires = {
         { "nvim-telescope/telescope.nvim" },
      },
      run = "make",
      -- cmd = "Telescope",
      config = function()
         require("telescope").load_extension("fzf")
      end,
   },
   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.configs.null-ls").setup()
      end,
   },
   ["tpope/vim-fugitive"] = {
      -- TODO: should probably support all commands
      cmd = { "Git", "G" },
   },
   ["iamcco/markdown-preview.nvim"] = {
      ft = { "markdown" },
      run = "cd app && yarn install",
   },
   ["lark-parser/vim-lark-syntax"] = {
      setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
      ft = { "lark" },
   }
}
