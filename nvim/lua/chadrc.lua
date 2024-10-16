-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "github_dark",
  transparency = true,
}

M.ui = {
   statusline = {
     theme = "default",
     separator_style = "default",
     order = { "mode", "f", "git", "%=", "lsp_msg", "%=", "lsp", "cwd", "xyz", "abc" },
     modules = {
       abc = function()
         return "hi"
       end,

       xyz =  "hi",
       f = "%F"
     }
   },

  cmp = {
    style = "default",
    icons_left = true,
  },
  tabufline = {
       enabled = true,
       lazyload = true,
       order = { "treeOffset", "buffers", "tabs", "btns" },
       modules = nil,
     },
}

return M
