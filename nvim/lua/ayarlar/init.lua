local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- options ------------------------------------------
o.laststatus = 3
o.showmode = false

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- <leader> tuşunu boşluk tuşuna atama
--g.mapleader = " "  -- Leader tuşunu boşluk olarak ayarla
--g.maplocalleader = " " -- Yerel leader tuşunu da boşluk olarak ayarlar


-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH

vim.cmd [[colorscheme tokyonight-storm]]

-- `lua/eklentiler/renkleri_bul.lua` dosyasını yükleyip fonksiyonu çalıştırıyoruz
renk_modul = require("ayarlar.renkleri_bul")

-- Autocmd ile renk şeması değiştiğinde `renkleri_bul.lua` dosyasını çalıştır
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",  -- Tüm renk şeması değişikliklerinde
  callback = function()
      -- Lua dosyasını çalıştır
      renk_modul.blankline_renkleri()
  end,
})