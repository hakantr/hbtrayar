-- Backup temizleme fonksiyonunu yüklüyoruz
local yedek_temizle = require('otomatik.yedek_temizle')

-- Yedekleme klasörünü kontrol eden ve gerekirse oluşturan fonksiyon
local function yedek_klasor_kontrolu()
    local yedek_klasoru = vim.fn.expand("~/.cache/nvim/yedek")
    
    -- Eğer dizin yoksa oluştur
    if vim.fn.isdirectory(yedek_klasoru) == 0 then
        os.execute("mkdir -p " .. yedek_klasoru)
    end
    
    -- Yedekleme dizinini Neovim'e ayarla
    vim.opt.backupdir = yedek_klasoru
end


-- Yedekleme işlemi aktifse ilgili ayarları yap
if yedek_al then
    -- Yedekleme klasörünü kontrol edip oluşturuyoruz
    yedek_klasor_kontrolu()
    
    -- Yedeklemeyi etkinleştir
    vim.opt.backup = true
else
    -- Yedeklemeyi devre dışı bırak
    vim.opt.backup = false
end

-- Yedek dosyalarını temizleme işlemi için arka planda çalıştırma
vim.defer_fn(function()
    yedek_temizle.eski_yedekleri_temizle(yedek_gun)
end, 5000)  -- Neovim açıldıktan 5 saniye sonra temizlik yapılacak

