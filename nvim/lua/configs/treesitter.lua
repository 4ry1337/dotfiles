return {
  ensure_installed = {
    "lua",
    "rust",
    "bash",
    "markdown",
    "markdown_inline",
    "sql",
    "html",
    "css",
    "javascript",
    "yaml",
    "json",
    "toml",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
    filetypes = { "html", "xml" },
  },
}
