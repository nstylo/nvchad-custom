---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- Navigation
    ["<C-p>"] = { ":Telescope find_files<CR>" },
    ["<C-f>"] = { ":Telescope live_grep<CR>" },
    ["<C-b>"] = { ":Telescope buffers<CR>" },
    ["<leader>z"] = { ":Telescope zoxide list<CR>" },
    ["gp"] = { ":Telescope resume<CR>" },

    -- Resizing windows
    ["<Up>"] = { ":res +5<CR>" },
    ["<Down>"] = { ":res -5<CR>" },
    ["<Right>"] = { ":vertical res +5<CR>" },
    ["<Left>"] = { ":vertical res -5<CR>" },

    -- Fugitive integration
    ["<gl>"] = { ":Git blame<CR>" },
    ["<leader>m"] = { ":MarkdownPreview<CR>" },
    ["<M-o>"] = { ":ClangdSwitchSourceHeader<CR>" },

    -- LSP stuff
    ["<leader>l"] = { ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(), { 0 })<CR>" },
    ["<leader>ra"] = { ":Lspsaga rename<CR>" },
  },
}

return M
