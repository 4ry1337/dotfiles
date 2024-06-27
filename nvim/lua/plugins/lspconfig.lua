return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   lazy = false,
  --   config = function()
  --     local lspconfig = require("lspconfig")
  --     local capabilities = vim.lsp.protocol.make_client_capabilities()
  --     capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
  --
  --     lspconfig.lua_ls.setup({
  --       settings = {
  --         Lua = {
  --           diagnostics = {
  --             globals = { "vim" },
  --             disable = { "different-requires" },
  --           },
  --         },
  --       },
  --     })
  --
  --     lspconfig.rust_analyzer.setup({})
  --
  --     lspconfig.tailwindcss.setup({
  --       settings = {
  --         includeLanguages = {
  --           templ = "html",
  --         },
  --       },
  --     })
  --   end,
  -- },
}
