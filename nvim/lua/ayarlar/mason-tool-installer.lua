return {
  require("mason-tool-installer").setup({
    ensure_installed = {
      "prettier",
      "stylua", -- lua formatter
      "isort",  -- python formatter
      "black",  -- python formatter
      "pylint",
      "eslint_d",
    },
  })

}
