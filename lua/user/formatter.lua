local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
  return
end

-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
formatter.setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier,
    },
    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettier,
    },
    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },
    json = {
      require("formatter.filetypes.json").prettier,
    },
    html = {
      require("formatter.filetypes.html").prettier,
    },
    css = {
      require("formatter.filetypes.css").prettier,
    },
    rust = {
      require("formatter.filetypes.rust").rustfmt,
    },
    ruby = {
      require("formatter.filetypes.ruby").standardrb,
    },

    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    }
  }
}
