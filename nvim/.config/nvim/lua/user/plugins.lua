local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

-- automatically run :PackerCompile when saving this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return packer.startup(function(use)
	-- general
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("onsails/lspkind.nvim")
	use("antoinemadec/FixCursorHold.nvim")
	use("lewis6991/impatient.nvim")

	-- editor
	use("lukas-reineke/indent-blankline.nvim")
	use("windwp/nvim-autopairs")
	use("tpope/vim-surround")
	use("norcalli/nvim-colorizer.lua")

	-- comment
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- interface
	use({ "akinsho/bufferline.nvim", branch = "main" })
	use({ "akinsho/toggleterm.nvim", branch = "main" })
	use("nvim-lualine/lualine.nvim")
	use("stevearc/dressing.nvim")
	use("kyazdani42/nvim-tree.lua")
	use("folke/zen-mode.nvim")

	-- git
	use("lewis6991/gitsigns.nvim")

	-- telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("windwp/nvim-ts-autotag")

	-- lsp
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("jose-elias-alvarez/null-ls.nvim")

	-- lsp plugins
	use("ray-x/lsp_signature.nvim")
	use("RRethy/vim-illuminate")
	use("j-hui/fidget.nvim")
	use("simrat39/symbols-outline.nvim")

	-- java
	use("mfussenegger/nvim-jdtls")

	-- typescript
	use("jose-elias-alvarez/typescript.nvim")

	-- json
	use("b0o/schemastore.nvim")

	-- dap
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- cmp
	use("hrsh7th/nvim-cmp")

	-- cmp sources
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- colorschemes
	use("rebelot/kanagawa.nvim")

	-- icon picker
	use({
		"ziontee113/icon-picker.nvim",
		config = function()
			require("icon-picker")
		end,
	})

	if PACKER_BOOTSTRAP then
		packer.sync()
	end
end)
