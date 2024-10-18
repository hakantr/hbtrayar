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
            indent = { char = "│", fg = IblKarakter },
            scope = { char = "│", fg = IblKapsamKarakteri },
        },
        config = function(_, opts)
            require("ayarlar.renkleri_bul")
            local hooks = require "ibl.hooks"
            hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
            require("ibl").setup(opts)
        end,
    },

}
