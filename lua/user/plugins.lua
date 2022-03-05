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
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"  -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs"  -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim"  -- Easily comment stuff
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "nvim-tree/nvim-web-devicons"
  use "nvim-tree/nvim-tree.lua"
  use { "akinsho/bufferline.nvim",
    -- after = "catppuccin",
    branch = "main",
    requires = 'nvim-tree/nvim-web-devicons',
    -- config = function()
    --   require("bufferline").setup {
    --     highlights = require("catppuccin.groups.integrations.bufferline").get()
    --   }
    -- end
  }
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use { "akinsho/toggleterm.nvim", tag = "*" }
  use "ahmedkhalf/project.nvim"
  use { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"
  use "echasnovski/mini.icons"
  use "vim-test/vim-test"
  use 'FooSoft/vim-argwrap'
  -- use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-rails'
  use 'RRethy/vim-illuminate'
  -- Colorschemes
  use "folke/tokyonight.nvim"
  use "lunarvim/darkplus.nvim"
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "dracula/vim"
  use "ellisonleao/gruvbox.nvim"
  use "rebelot/kanagawa.nvim"
  use "EdenEast/nightfox.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }
  use "sainnhe/everforest"
  -- Cmp
  use "hrsh7th/nvim-cmp"    -- The completion plugin
  use "hrsh7th/cmp-buffer"  -- buffer completions
  use "hrsh7th/cmp-path"    -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  -- use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- Snippets
  -- use "L3MON4D3/LuaSnip"             --snippet engine
  -- use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  -- use { "neovim/nvim-lspconfig", tag = "76e7c8b029e6517f3689390d6599e9b446551704" }
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim"    -- language server settings defined in json for
  -- use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "mhartington/formatter.nvim"
  use "simrat39/rust-tools.nvim"
  -- use "jose-elias-alvarez/nvim-lsp-ts-utils" -- adds import organization
  -- use "jose-elias-alvarez/typescript.nvim" -- typescript language server
  use {
    "pmizio/typescript-tools.nvim",
    requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("typescript-tools").setup {
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false

          require("user.lsp.handlers").on_attach(client, bufnr)
        end,
        settings = {
          expose_as_code_action = "all"
        }
      }
    end,
  }
  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- FZF
  use { "junegunn/fzf", run = "./install --all" }
  use "gfanto/fzf-lsp.nvim"

  use {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        ignore_filetypes = {
          "TelescopePrompt", "conf", "yaml"
        },
        condition = function()
          if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
            return true
          end

          return false
        end,
      })
    end,
  }
  -- use {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup({
  --       filetypes = {
  --         TelescopePrompt = false,
  --         conf = false,
  --         sh = function()
  --           if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
  --             -- disable for .env files
  --             return false
  --           end
  --           return true
  --         end,
  --       },
  --       suggestion = {
  --         auto_trigger = true,
  --       }
  --     })
  --   end,
  -- }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
