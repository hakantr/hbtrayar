-- lua/eklentiler/renkleri_bul.lua

-- Onaltılık (hexadecimal) renk formatını çözen bir yardımcı fonksiyon
local function hex_den_rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

-- RGB renklerini onaltılık formata geri çeviren yardımcı fonksiyon
local function rgb_den_hex(r, g, b)
  return string.format("#%02X%02X%02X", r, g, b)
end

-- Her bir renk kanalının %15 daha açık hale getirilmesi
local function acik_renk(hex, percent)
  local r, g, b = hex_den_rgb(hex)
  local function ac(kanal)
    -- Eğer kanal 0 ise, sabit bir minimum artış uygula (örneğin 15)
    if kanal == 0 then
      return math.min(255, math.floor(15)) -- Tamamen siyah olan renkler için minimum parlaklık
    else
      return math.min(255, math.floor(kanal + (kanal * (percent / 100))))
    end
  end
  return rgb_den_hex(ac(r), ac(g), ac(b))
end

-- Bir yardımcı fonksiyon: highlight grubu bilgilerini alır
local function highlight_bul(grup)
  local hl = vim.api.nvim_get_hl_by_name(grup, true)
  return {
    fg = hl.foreground and string.format("#%06x", hl.foreground) or nil,
    bg = hl.background and string.format("#%06x", hl.background) or nil,
    sp = hl.special and string.format("#%06x", hl.special) or nil,
  }
end

-- Tema renklerini almak için bir fonksiyon
function renkleri_al()
  return {
    Normal = highlight_bul("Normal"),         -- Normal metin rengi (fg, bg)
    LineNr = highlight_bul("LineNr"),         -- Satır numarası
    CursorLine = highlight_bul("CursorLine"), -- İmlecin olduğu satır
    Visual = highlight_bul("Visual"),         -- Görsel seçim rengi
    StatusLine = highlight_bul("StatusLine"), -- Durum çubuğu (statusline) rengi
    Comment = highlight_bul("Comment"),       -- Yorumlar
  }
end

function blankline_renkleri()
    -- Tema renklerini `renkler` değişkenine ata
    local renkler = renkleri_al()

    IblKarakter = acik_renk(renkler.CursorLine.bg, 10)
    IblKapsamKarakteri = acik_renk(renkler.CursorLine.bg, 10)
    -- IblKarakter için bir highlight grubu tanımlama
    vim.api.nvim_set_hl(0, "IblKarakter", {
        fg = IblKarakter, -- GUI ön plan rengi (guifg)
        ctermfg = nill, -- Cterm ön plan rengi (ctermfg)
        bg = nill,     -- Arka plan (NONE olarak bırakılıyor)
        ctermbg = nill, -- Cterm arka planı (NONE olarak bırakılıyor)
        cterm = nocombine, -- Terminal modunda nocombine
        gui = nocombine -- GUI modunda nocombine
    })

    -- IblKapsamKarakteri için bir highlight grubu tanımlama
    vim.api.nvim_set_hl(0, "IblKapsamKarakteri", {
        fg = IblKapsamKarakteri, -- GUI ön plan rengi (guifg)
        ctermfg = nill,    -- Cterm ön plan rengi (ctermfg)
        bg = nill,         -- Arka plan (NONE olarak bırakılıyor)
        ctermbg = nill,    -- Cterm arka planı (NONE olarak bırakılıyor)
        cterm = nocombine, -- Terminal modunda nocombine
        gui = nocombine    -- GUI modunda nocombine
    })
end

-- Modül olarak fonksiyonları dışa aktarma
return {
  renkleri_al = renkleri_al,
  blankline_renkleri = blankline_renkleri
}