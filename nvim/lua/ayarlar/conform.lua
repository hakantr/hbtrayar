local options = {
  formatters_by_ft = {
    rust = { "rustfmt" },            -- Rust için rustfmt kullanılır
    lua = { "stylua" },              -- Lua için stylua
    javascript = { "prettier" },     -- JavaScript için Prettier
    typescript = { "prettier" },     -- TypeScript için Prettier
    html = { "prettier" },           -- HTML için Prettier
    css = { "prettier" },            -- CSS için Prettier
    scss = { "prettier" },           -- SCSS için Prettier
    deno = { "deno_fmt" },           -- Deno için Deno'nun kendi formatlayıcısı
  },

  -- Kaydetmeden önce otomatik formatlama
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
      require("conform").format()
    end,
  }),
}

return options
