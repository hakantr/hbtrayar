-- Yedek dosyalarını temizleyen fonksiyon
local function eski_yedekleri_temizle(gun)
    local backup_dir = vim.fn.expand("~/.cache/nvim/yedek/")
    
    -- Yedekleme süresi (gun) 0 ise temizleme yapma
    if gun == 0 then
        return
    end
    
    -- 'gun' gününden eski yedek dosyalarını bul ve sil
    local command = 'find ' .. backup_dir .. ' -type f -mtime +' .. tostring(gun)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()

    -- Eğer silinecek dosya varsa temizle
    if result ~= "" then
        os.execute(command .. ' -delete')
    end
end

-- Fonksiyonu dışa aktar
return {
    eski_yedekleri_temizle = eski_yedekleri_temizle
}

