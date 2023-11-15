local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- Markup
  b.formatting.prettierd.with { filetypes = { "html", "markdown", "css", "yaml" } },

  -- JS
  b.formatting.prettier.with {
    filetypes = { "javascript", "typescript", "vue", "javascriptreact", "typescriptreact", "svelte" },
  },

  -- Solidity
  b.formatting.forge_fmt.with { filetypes = { "solidity" }, args = { "fmt", "$FILENAME" } },

  -- Lua
  b.formatting.stylua.with { filetypes = { "lua" } },

  -- Shell
  b.formatting.shfmt.with { args = { "-filename", "$FILENAME", "-i", "4" } },

  -- Python
  b.formatting.black,
  b.formatting.isort,

  -- Go
  b.formatting.gofumpt,
  b.formatting.goimports,

  -- cpp
  b.formatting.clang_format,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = true,
  sources = sources,

  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { async = false }
        end,
      })
    end
  end,
}
