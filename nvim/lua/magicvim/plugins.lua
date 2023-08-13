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
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
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

-- Install your plugins here
return packer.startup(function(use)

-- Plugin Manager
use 'wbthomason/packer.nvim'

-- StatusLine/Buffer
--[[ use 'vim-airline/vim-airline' ]]
--[[ use 'vim-airline/vim-airline-themes' ]]
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}
use 'noib3/nvim-cokeline'
-- Fuzzy Finder
use 'junegunn/fzf'
use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}

-- Code Completion
use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  }
}
use 'Exafunction/codeium.vim'
-- use {
--     "jcdickinson/codeium.nvim",
--     requires = {
--         "nvim-lua/plenary.nvim",
--         "hrsh7th/nvim-cmp",
--     },
--     config = function()
--         require("codeium").setup({
--         })
--     end
-- }
-- Language Support

-- Themes
use 'Mofiqul/dracula.nvim'
use 'RRethy/nvim-base16'

-- File Managers
use 'nvim-tree/nvim-tree.lua'
use 'kevinhwang91/rnvimr'
--[[ use 'rafaqz/ranger.vim' ]]

-- Lua Plugins
use 'nvim-lua/plenary.nvim'

-- Look & Layout
use 'kamykn/popup-menu.nvim'
use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
use 'kyazdani42/nvim-web-devicons'
use 'sanfusu/neovim-undotree'
use 'norcalli/nvim-colorizer.lua'
use 'jceb/vim-orgmode'
use 'sgtpep/pmenu'
use 'goolord/alpha-nvim'
use({
  "folke/noice.nvim",
  requires = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
})
use {
  'lewis6991/gitsigns.nvim',
  -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
}
-- Other Plugins
use 'jiangmiao/auto-pairs'
use 'numToStr/Comment.nvim'
use 'gelguy/wilder.nvim'
use 'lambdalisue/suda.vim'
use 'gbprod/yanky.nvim'
use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 100
  end
}
-- Vim Wiki
use 'vimwiki/vimwiki'

use {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
}
use 'stevearc/dressing.nvim'
use({
  'mrjones2014/legendary.nvim',
  -- sqlite is only needed if you want to use frecency sorting
  -- requires = 'kkharji/sqlite.lua'
})
-- use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
use {"akinsho/toggleterm.nvim", tag = '*'}
-- use {
--     "SmiteshP/nvim-navbuddy",
--     requires = {
--         "neovim/nvim-lspconfig",
--         "SmiteshP/nvim-navic",
--         "MunifTanjim/nui.nvim"
--     }
-- }
-- use 'kdheepak/lazygit.nvim'
-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
