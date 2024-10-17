-- lua/eklentiler/renkleri_bul.lua

local M = {}

-- Bir yardımcı fonksiyon: highlight grubu bilgilerini alır
local function get_highlight(group)
  local hl = vim.api.nvim_get_hl_by_name(group, true)
  return {
    fg = hl.foreground and string.format("#%06x", hl.foreground) or nil,
    bg = hl.background and string.format("#%06x", hl.background) or nil,
    sp = hl.special and string.format("#%06x", hl.special) or nil,
  }
end

-- Tema renklerini almak için bir fonksiyon
function M.get_colors()
  return {
    Normal = get_highlight("Normal"),             -- Normal metin rengi (fg, bg)
    LineNr = get_highlight("LineNr"),             -- Satır numarası
    CursorLine = get_highlight("CursorLine"),     -- İmlecin olduğu satır
    Visual = get_highlight("Visual"),             -- Görsel seçim rengi
    StatusLine = get_highlight("StatusLine"),     -- Durum çubuğu (statusline) rengi
    Comment = get_highlight("Comment"),           -- Yorumlar
  }
end

return M
