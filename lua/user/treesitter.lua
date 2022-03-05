local M = {
}
function M.config()
  local treesitter = require "nvim-treesitter"
  local configs = require "nvim-treesitter.configs"

  configs.setup {
    ensure_installed = "all",
    -- ensure_installed = "all", -- one of "all" or a list of languages
    ignore_install = { "" }, -- List of parsers to ignore installing
    sync_install = false,    -- install languages synchronously (only applied to `ensure_installed`)

    highlight = {
      enable = true,       -- false will disable the whole extension
      disable = { "css" }, -- list of language that will be disabled
      additional_vim_regex_highlighting = true,
    },
    autopairs = {
      enable = true,
    },
    indent = { enable = true, disable = { "python", "css", "yaml" } },

    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },

    fold = {
      enable = true,
    },

    text_objects = {
      enable = true,
    }
  }
end

-- vim.g.skip_ts_context_commentstring_module = true
return M
