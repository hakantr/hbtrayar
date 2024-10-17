require("config.lazy")
require("config.tanimlar")
require("autocmd")

vim.cmd("colorscheme gruvbox")
vim.schedule(function()
  require "mappings"
end)