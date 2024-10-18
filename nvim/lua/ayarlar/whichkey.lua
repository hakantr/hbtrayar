local wk = require("which-key")
wk.setup {}
local opts = {
  mode = "n", -- NORMAL modunda
  prefix = "<leader>", -- <leader> tuşu ile başlayan kısayollar
  buffer = nil, -- global kısayollar
  silent = true, -- komutları sessizce çalıştır
  noremap = true, -- eşlemeleri yeniden eşleme
  nowait = true, -- eşlemeleri beklemeden çalıştır
}
local mappings = {
  require("ayarlar.keymaps_normal")
}
wk.add(mappings, opts)