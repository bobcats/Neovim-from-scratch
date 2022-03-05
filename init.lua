vim.loader.enable()

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99
vim.o.foldnestmax = 3
vim.o.foldenable = false

require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.dap"
require "user.telescope"
require "user.gitsigns"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.nvim-tree"
require "user.vimtest"
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.rails"
require "user.project"
require "user.indentline"
require "user.formatter"
require "user.alpha"
require "user.whichkey"
require "user.autocommands"
require "user.dingllm"
require "user.dingllmsetup"
