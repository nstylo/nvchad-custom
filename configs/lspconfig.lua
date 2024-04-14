local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "clangd",
  "pyright",
  "volar",
  "tsserver",
  "yamlls",
  "dockerls",
  "gopls",
  "rust_analyzer",
  "solidity_ls_nomicfoundation",
  "graphql",
  "svelte",
  "bashls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Open float diagnostics under cursor
vim.cmd [[autocmd! CursorHold * lua vim.diagnostic.open_float(nil, {focus=false, scope="line"})]]

vim.cmd [[ do User LspAttachBuffers ]]

vim.diagnostic.config {
  virtual_text = false,
}

-- Disable semantic token highlighting -> overriding treesitter (and is just worse)
-- TODO: can't really override this for nvchad so just quickfix it like this
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})
