-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "clangd",
  "html",
  "cssls",
  "sqlls",
  "dockerls",
  "tailwindcss",
  "eslint",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
on_attach = nvlsp.on_attach,
on_init = nvlsp.on_init,
capabilities = nvlsp.capabilities,
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
