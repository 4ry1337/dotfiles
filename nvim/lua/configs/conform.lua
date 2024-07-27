local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    md = { "prettier" },
    html = { "prettier" },
    sql = { "sql_formatter" },
    c = { "clang-format" },
    cpp = { "clang-format" },
  },

  format_on_savey = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
