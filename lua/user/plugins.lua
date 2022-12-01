local fn = vim.fn

-- Automatically install packer
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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	use({ "wbthomason/packer.nvim", commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim", commit = "968a4b9afec0c633bc369662e78f8c5db0eba249" }) -- Useful lua functions used by lots of plugins
  use({ 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }})
  use({ 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'})
  use({ "phaazon/hop.nvim" })
  use({ "ryanoasis/vim-devicons" })
  use({ "nfvs/vim-perforce" })
  use({ "BurntSushi/ripgrep" })
  use({ "nvim-telescope/telescope.nvim", tag="0.1.0" })
  use({ 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons', }})
  use({ "akinsho/toggleterm.nvim", tag="*"})
  use({ "mhinz/vim-signify"})

  -- Alpha (Home Screen)
  use({ "goolord/alpha-nvim", requires = { "kyazdani42/nvim-web-devicons" } })

  -- Completion
  use "hrsh7th/nvim-cmp"    -- Completion Plugin
  use "hrsh7th/cmp-buffer"  -- Buffer Completions
  use "hrsh7th/cmp-path"    -- Path Completions
  use "hrsh7th/cmp-cmdline" -- Commandline Completions
  use "hrsh7th/cmp-nvim-lsp" -- LSP completions
  use "hrsh7th/cmp-nvim-lua"
  use "saadparwaiz1/cmp_luasnip" -- Snippet completions

  -- -- snippets
  use "L3MON4D3/LuaSnip" -- snippet engine
  -- use "rafamadriz/friendly-snippets" -- a bunch of snippets

  -- LSP
  use { "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" } -- enable LSP
  use { "williamboman/mason.nvim", commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12"}
  use { "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" }
  use { "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" } -- for formatters and linters
  use { "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" }
  use { "windwp/nvim-ts-autotag" }
  use { "windwp/nvim-autopairs" }

  -- Commenting
  use { 'numToStr/Comment.nvim' }
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "5d11dfc27849e3d7435c32dbd8ea9be35bcd990b",
	})
  use({ "p00f/nvim-ts-rainbow"})

  -- Which Key
  use { "folke/which-key.nvim" }

  -- Color Schemes
  use "lunarvim/Colorschemes"
  use 'doums/darcula'
  use { "briones-gabriel/darcula-solid.nvim", requires = "rktjmp/lush.nvim" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
	require("packer").sync()
  end
end)


