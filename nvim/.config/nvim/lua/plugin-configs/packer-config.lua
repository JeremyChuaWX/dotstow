local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- automatically run :PackerCompile when saving this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer-config.lua source <afile> | PackerSync
  augroup end
]])

return packer.startup(function(use)

    -- general
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "kyazdani42/nvim-web-devicons"
    use "onsails/lspkind.nvim"

    -- editor
    use "lukas-reineke/indent-blankline.nvim"
    use "windwp/nvim-autopairs"
    use "JeremyChuaWX/surround.nvim"
    use "norcalli/nvim-colorizer.lua"

    -- interface
    use { "akinsho/bufferline.nvim", branch = "main" }
    use { "akinsho/toggleterm.nvim", branch = "main" }
    use "nvim-lualine/lualine.nvim"

    -- git
    use "lewis6991/gitsigns.nvim"

    -- telescope
    use "nvim-telescope/telescope.nvim"
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

    -- treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    -- lsp
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "jose-elias-alvarez/null-ls.nvim"
    use "ray-x/lsp_signature.nvim"

    -- java
    use "mfussenegger/nvim-jdtls"

    -- snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- cmp
    use "hrsh7th/nvim-cmp"

    -- cmp sources
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"

    -- colorschemes
    use "rebelot/kanagawa.nvim"

    if packer_bootstrap then
        packer.sync()
    end
end)
