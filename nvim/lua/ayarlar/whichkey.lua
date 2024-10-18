-- ~/.config/nvim/lua/config/which-key.lua

local wk = require("which-key")

wk.setup {
  plugins = {
    marks = true, -- ' işareti ile yer imlerini göster
    registers = true, -- " yazmaçları göster
    spelling = {
      enabled = true, -- yazım denetimi için önerileri göster
      suggestions = 20, -- yazım denetimi için maksimum öneri sayısı
    },
    -- lazy.nvim eklentisiyle yüklenen eklentiler için kısayolları göster
    presets = {
      operators = false, -- 'g' gibi operatörleri gösterme
      motions = true, -- 'w' gibi hareketleri göster
      text_objects = true, -- 'iw' gibi metin nesnelerini göster
      windows = true, -- 'c' gibi pencere komutlarını göster
      nav = true, -- 'j' gibi gezinme komutlarını göster
      z = true, -- 'z' komutlarını göster
      g = true, -- 'g' komutlarını göster
    },
  },
  -- yapılandırma seçenekleri
  icons = {
    breadcrumb = "»", -- alt menüler için ayırıcı
    separator = "➜", -- ana menü ve alt menüler arasındaki ayırıcı
    group = "+", -- grup başlıkları için simge
  },
  popup = {
    window = {
      border = "rounded", -- açılır pencere kenarlığı
      position = "bottom", -- açılır pencere konumu
      margin = { 1, 0, 1, 0 }, -- açılır pencere kenar boşlukları
      padding = { 2, 2, 2, 2 }, -- açılır pencere iç boşluklar
    },
    abbreviations = {
      enabled = true, -- kısaltmaları etkinleştir
      backspace = true, -- kısaltmalarda geri tuşunu etkinleştir
      set_titles = true, -- kısaltmalar için başlıkları etkinleştir
    },
  },
  window = {
    border = "rounded", -- açılır pencere kenarlığı
    position = "bottom", -- açılır pencere konumu
    margin = { 1, 0, 1, 0 }, -- açılır pencere kenar boşlukları
    padding = { 2, 2, 2, 2 }, -- açılır pencere iç boşluklar
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- açılır pencerenin minimum ve maksimum yüksekliği
    width = { min = 20, max = 50 }, -- açılır pencerenin minimum ve maksimum genişliği
    spacing = 3, -- öğeler arasındaki boşluk
    align = "left", -- hizalama
  },
  ignore_missing = false, -- eksik eşleşmeleri yoksay
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- gizlenecek önekler
  show_help = true, -- yardım mesajını göster
  triggers = "auto", -- otomatik tetikleyiciler
  -- tetikleyici eşlemeleri
  triggers_blacklist = {
    -- her mod için liste
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  triggers = "n", -- NORMAL modunda
  prefix = "<leader>", -- <leader> tuşu ile başlayan kısayollar
  buffer = nil, -- global kısayollar
  silent = true, -- komutları sessizce çalıştır
  noremap = true, -- eşlemeleri yeniden eşleme
  nowait = true, -- eşlemeleri beklemeden çalıştır
}

local mappings = {
  require("ayarlar.keymaps")
}

wk.add(mappings, opts)