local M = {}

M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
        { name = "DiagnosticSignHint", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(
            sign.name,
            {
                texthl = sign.name,
                text = sign.text,
                numhl = ""
            }
        )
    end

    local config = {
        -- disable virtual text
        virtual_text = false,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        {
            border = "rounded",
            width = 60,
        }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        {
            border = "rounded",
            width = 60,
        }
    )
end

local function lsp_highlight_document(client)
    require("illuminate").on_attach(client)
end

local function lsp_keymaps(bufnr)
    local opts = {
        noremap = true,
        silent = true
    }
    local keymap_buf = vim.api.nvim_buf_set_keymap
    keymap_buf(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    keymap_buf(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- not all LSP servers implement!
    keymap_buf(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap_buf(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap_buf(bufnr, "n", "<F2>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    keymap_buf(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    keymap_buf(bufnr, "n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    keymap_buf(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
    keymap_buf(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    keymap_buf(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
    keymap_buf(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

    local keymap = vim.api.nvim_set_keymap
    keymap("n", "gr", "<cmd>Trouble lsp_references<CR>", opts)
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({async = true})' ]])
end

-- border: none, single, double, rounded, solid, shadow, custom-array

M.on_attach = function(client, bufnr)
    if client.name == "tsserver" then
        client.server_capabilities.documentFormattingProvider = false
    end

    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

return M
