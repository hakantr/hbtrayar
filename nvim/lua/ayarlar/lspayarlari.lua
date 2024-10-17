local lspconfig = require 'lspconfig'

-- Genel on_attach fonksiyonu
local on_attach = function(client, bufnr)
    -- TSServer ve diğer sunucularda formatlamayı kapatma
    if client.name == "tsserver" or client.name == "html" or client.name == "cssls" then
        client.server_capabilities.documentFormattingProvider = false
    end
end

-- Rust için rust-analyzer
lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                command = "clippy"
            },
        },
    },
})

-- HTML için
lspconfig.html.setup({
    on_attach = on_attach,
    filetypes = { "html" },
    init_options = {
        provideFormatter = true,
    },
})

-- CSS için
lspconfig.cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        css = { validate = true },
        less = { validate = true },
        scss = { validate = true },
    },
})

-- JavaScript ve TypeScript için
lspconfig.ts_ls.setup({
    on_attach = on_attach,
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    cmd = { "typescript-language-server", "--stdio" },
})

-- Deno için
lspconfig.denols.setup({
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
    init_options = {
        lint = true,
        unstable = true,
    },
})

-- Lua için
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = { enable = false },
        },
    },
})
