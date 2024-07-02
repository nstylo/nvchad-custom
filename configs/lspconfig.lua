local configs = require "plugins.configs.lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  html = {},
  cssls = {},
  clangd = {},
  pyright = {},
  volar = {},
  tsserver = {
    init_options = {
      preferences = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
        importModuleSpecifierPreference = "non-relative",
      },
    },
  },
  yamlls = {},
  dockerls = {},
  gopls = {},
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
  solidity_ls = {},
  graphql = {},
  svelte = {},
  bashls = {},
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
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
