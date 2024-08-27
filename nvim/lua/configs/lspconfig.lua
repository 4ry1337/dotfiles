-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
-- local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend(
  "force",
  capabilities,
  require("cmp_nvim_lsp").default_capabilities()
)
local servers = {
  "clangd",
  "html",
  "cssls",
  "sqlls",
  "dockerls",
  "tailwindcss",
  "eslint",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

--rust
lspconfig.rust_analyzer.setup {}

--java
lspconfig.jdtls.setup {
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-21",
            path = "/opt/jdk-21",
            default = true,
          },
        },
      },
    },
  },
}

--tailwindcss
lspconfig.tailwindcss.setup {
  settings = {
    includeLanguages = {
      templ = "html",
    },
  },
}

-- lspconfig.clangd.setup {
--   on_attach = function(client, bufnr)
--     client.server_capabilities.signatureHelpProvider = false
--     on_attach(client, bufnr)
--   end,
--   capabilities = capabilities,
-- }
