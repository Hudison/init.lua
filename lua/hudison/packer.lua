-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    --
    -- use 'folke/tokyonight.nvim' -- good
    -- use 'rebelot/kanagawa.nvim' -- ok but not much contrast
    -- use { 'catppuccin/nvim', as = 'catppuccin' }
    -- use { 'rose-pine/neovim', as = 'rose-pine' }
    -- use { 'projekt0n/github-nvim-theme', tag = 'v0.0.7' }
    use 'navarasu/onedark.nvim' -- good colors and contrast
    -- use 'shaunsingh/moonlight.nvim' -- good but it gets boring fast
    -- use { 'arturgoms/moonbow.nvim' } -- a little better than gruvbox i think
    -- use { 'ellisonleao/gruvbox.nvim' } -- fn and string have the same colocr, kinda meh

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { 'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        cond = vim.fn.executable 'make' == 1
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    use {
        'folke/which-key.nvim',
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require('which-key').setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'lewis6991/gitsigns.nvim'
    use 'nvim-lualine/lualine.nvim' -- Fancier statusline
    use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
    use 'numToStr/Comment.nvim' -- 'gc' to comment visual regions/lines
    use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
    use 'theprimeagen/harpoon' -- If you know, you know
    use 'nvim-treesitter/playground'
    use 'tpope/vim-repeat'
    use 'ggandor/lightspeed.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'echasnovski/mini.cursorword'
    use 'kkharji/sqlite.lua'
    use 'nvim-tree/nvim-web-devicons'
    use 'windwp/nvim-spectre'
    use 'gnikdroy/projections.nvim'
    use 'gelguy/wilder.nvim'

    use { 'akinsho/toggleterm.nvim', tag = '*', config = function()
        require('toggleterm').setup()
    end }

    use({
        'kylechui/nvim-surround',
        tag = '*', -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require('nvim-surround').setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    use {
        'AckslD/nvim-neoclip.lua',
        requires = {
            { 'kkharji/sqlite.lua',           module = 'sqlite' },
            -- you'll need at least one of these
            { 'nvim-telescope/telescope.nvim' },
            -- {'ibhagwan/fzf-lua'},
        },
        config = function()
            require('neoclip').setup()
        end,
    }

    use {
        'sudormrfbin/cheatsheet.nvim',

        requires = {
            { 'nvim-telescope/telescope.nvim' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
        }
    }

    use({
        'andrewferrier/debugprint.nvim',
        config = function()
            require('debugprint').setup()
        end,
    })
end)

local group = vim.api.nvim_create_augroup('packer_user_config', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | PackerSync',
    pattern = 'packer.lua', -- the name of your plugins file
    group = group,
})
