require("configs.remap")
require("configs.set")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    'folke/tokyonight.nvim',
    'tpope/vim-fugitive',
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
    { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },

    --- Uncomment these if you want to manage LSP servers from neovim
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- LSP Support
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
        },
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
        }
    }
})

vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')
