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
  "ts_ls",
  "rust_analyzer",
  "jdtls",
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

--tailwindcss
lspconfig.tailwindcss.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    includeLanguages = {
      templ = "html",
    },
  },
}

--java
-- lspconfig.jdtls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
--   settings = {
--     java = {
--       configuration = {
--         runtimes = {
--           {
--             name = "JavaSE-17",
--             path = "/usr/lib/jvm/java-17-openjdk",
--           },
--           {
--             name = "JavaSE-8",
--             path = "/usr/lib/jvm/java-8-openjdk/jre",
--             default = true,
--           },
--         },
--       },
--     },
--   },
-- }
