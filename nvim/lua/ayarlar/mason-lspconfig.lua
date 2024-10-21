return {
  require("mason-lspconfig").setup({
    automatic_installation = true,
    ensure_installed = {
      "cssls",
      "eslint",
      "html",
      "jsonls",
      "ts_ls",
      "pyright",
      "tailwindcss",
    },
  })

}
