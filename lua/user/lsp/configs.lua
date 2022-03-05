local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local lspconfig = require("lspconfig")


local installable_servers = {
  "jsonls",
  "lua_ls",
  -- "tsserver",
  "tailwindcss",
  "eslint",
  "prismals",
  "gopls",
  "bashls",
  "yamlls",
  "denols",
}

local uninstallable_servers = {
  -- "solargraph",
  "rust_analyzer",
  -- "standardrb",
  "ruby_lsp",
  "elixirls",
  "zls",
  "sorbet",
  "terraformls",
  -- "ts_ls",
}

local servers = {}
servers = vim.list_extend(servers, installable_servers)
servers = vim.list_extend(servers, uninstallable_servers)

lsp_installer.setup {
  ensure_installed = installable_servers
}

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
    test = "test"
  }
  local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end
  lspconfig[server].setup(opts)
end

local opts = {
  tools = {
    -- rust-tools options
    autoSetHints = true,
    inlay_hints = {
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },
  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
  server = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy"
        },
        imports = {
          granularity = {
            group = "module",
          }
        }
      }
    }
  },
}

require('rust-tools').setup(opts)

--[[ lspconfig.solargraph.setup { ]]
--[[   flags = { debounce_text_changes = 400, }, ]]
--[[   on_attach = require("user.lsp.handlers").on_attach, ]]
--[[   capabilities = require("user.lsp.handlers").capabilities, ]]
--[[ } ]]
-- -- require("typescript").setup {
--   server = {
--     on_attach = require("user.lsp.handlers").on_attach,
--     capabilities = require("user.lsp.handlers").capabilities,
--   }
-- }
