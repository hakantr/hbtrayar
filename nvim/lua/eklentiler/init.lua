return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "ayarlar.conform",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "ayarlar.lspayarlari" -- LSP ayarlarını buradan yükle
        end,
        -- Eklentiyi belirli bir olaya bağlı olarak yükleyin
        event = { "BufReadPre", "BufNewFile" }, -- Bir dosya okunduğunda veya yeni bir dosya açıldığında yükle
    },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    -- nvim-web-devicons kurulumu
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true, -- Yalnızca gerektiğinde yüklensin
    },

    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require "ayarlar.nvimtree" -- nvim-tree ayarlarını buradan yükle
        end,
    },

    -- indent-blankline.nvim kurulumu
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "User FilePost",
        opts = {
          indent = { char = "│", highlight = "IblKarakter" },
          scope = { char = "│", highlight = "IblKapsamKarakteri" },
        },
        config = function(_, opts)
          renk_modul.blankline_renkleri()
          local hooks = require "ibl.hooks"
          hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
          require("ibl").setup(opts)
        end,
    },

    { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },
  
      -- Document existing key chains
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },
      
    { 
        "echasnovski/mini.nvim", version = "*",
    },
    
    {
        'anuvyklack/windows.nvim',
        dependencies = { 'anuvyklack/middleclass' },
        config = function()
          vim.o.winwidth = 10
          vim.o.winminwidth = 10
          vim.o.equalalways = false
          require('windows').setup()
        end,
    },
      
    {
        "yorickpeterse/nvim-window",
        event = "VeryLazy",
        config = function()
            require("nvim-window").setup({
                -- The characters available for hinting windows.
                chars = {
                    "a",
                    "b",
                    "c",
                    "d",
                    "e",
                    "f",
                    "g",
                    "h",
                    "i",
                    "j",
                    "k",
                    "l",
                    "m",
                    "n",
                    "o",
                    "p",
                    "q",
                    "r",
                    "s",
                    "t",
                    "u",
                    "v",
                    "w",
                    "x",
                    "y",
                    "z",
                },
    
                -- normal_hl = "Normal",
    
                -- hint_hl = 'Bold',
    
                border = "single",
    
                -- - "float" (default): renders the hints using floating windows
                -- - "status": renders the hints to a string and calls `redrawstatus`,
                --   allowing you to show the hints in a status or winbar line
                render = "float",
            })
        end,
    },

}
