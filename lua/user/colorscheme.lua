-- local colorscheme = "tokyonight"
--
-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--   return
-- end
-- require("catppuccin").setup({
--   flavour = "mocha", -- latte, frappe, macchiato, mocha
--   background = {
--     -- :h background
--     light = "latte",
--     dark = "mocha",
--   },
--   compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
--   transparent_background = false,
--   term_colors = false,
--   dim_inactive = {
--     enabled = false,
--     shade = "dark",
--     percentage = 0.15,
--   },
--   styles = {
--     comments = { "italic" },
--     conditionals = { "italic" },
--     loops = {},
--     functions = {},
--     keywords = {},
--     strings = {},
--     variables = {},
--     numbers = {},
--     booleans = {},
--     properties = {},
--     types = {},
--     operators = {},
--   },
--   color_overrides = {},
--   custom_highlights = {},
--   integrations = {
--     cmp = true,
--     gitsigns = true,
--     nvimtree = true,
--     telescope = true,
--     treesitter = true,
--     which_key = true,
--     illuminate = true,
--     indent_blankline = {
--       enabled = true,
--       colored_indent_levels = false,
--     },
--     native_lsp = {
--       enabled = true,
--       virtual_text = {
--         errors = { "italic" },
--         hints = { "italic" },
--         warnings = { "italic" },
--         information = { "italic" },
--       },
--       underlines = {
--         errors = { "underline" },
--         hints = { "underline" },
--         warnings = { "underline" },
--         information = { "underline" },
--       },
--     },
--     -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--   },
-- })

local result = os.execute("defaults read -g AppleInterfaceStyle 2>/dev/null | grep -q 'Dark'")

if result == 0 then
  vim.cmd [[
    set background=dark
    colorscheme tokyonight-moon
  ]]
else
  vim.cmd [[
    set background=light
    colorscheme tokyonight-day
  ]]
end
