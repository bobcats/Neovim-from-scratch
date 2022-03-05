-- return {
--   rubylsp = {
--     diagnostics = false,
--   },
--   init_options = {
--     formatting = false,
--     references = false,
--     formatter = 'standard',
--     linters = { 'standard' },
--   },
--   on_attach = function(client, buffer)
--     pcall(require("user.lsp.handlers").on_attach, client, buffer)
--
--     -- local diagnostic_handler = function()
--     --   local params = vim.lsp.util.make_text_document_params(buffer)
--     --
--     --   client.request(
--     --     'textDocument/diagnostic',
--     --     { textDocument = params },
--     --     function(err, result)
--     --       if err then
--     --         local err_msg = string.format("ruby-lsp - diagnostics error - %s", vim.inspect(err))
--     --         vim.lsp.log.error(err_msg)
--     --       end
--     --       if not result then return end
--     --
--     --       vim.lsp.diagnostic.on_publish_diagnostics(
--     --         nil,
--     --         vim.tbl_extend('keep', params, { diagnostics = result.items }),
--     --         { client_id = client.id, method = 'textDocument/publishDiagnostics' }
--     --       )
--     --     end
--     --   )
--     -- end
--     --
--     -- diagnostic_handler() -- to request diagnostics when attaching the client to the buffer
--     --
--     -- local ruby_group = vim.api.nvim_create_augroup('rubylsp', { clear = false })
--     -- vim.api.nvim_create_autocmd(
--     --   { 'BufEnter', 'BufWritePre', 'InsertLeave', 'TextChanged' },
--     --   {
--     --     buffer = buffer,
--     --     callback = diagnostic_handler,
--     --     group = ruby_group
--     --   }
--     -- )
--   end
-- }

return {
  settings = {
    init_options = {
      formatter = 'standard',
      linters = { 'standard' },
    },
  }
}
