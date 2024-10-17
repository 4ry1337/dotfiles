return {
  {
    "mfussenegger/nvim-jdtls",
    config = function()
      local config = {
        cmd = { vim.fn.expand "~/.local/share/nvim/mason/bin/jdtls" },
        root_dir = vim.fs.dirname(
          vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]
        ),
        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  name = "JavaSE-17",
                  path = "/usr/lib/jvm/java-17-openjdk/",
                  default = true,
                },
                {
                  name = "JavaSE-1.8",
                  path = "/usr/lib/jvm/java-8-openjdk/",
                },
              },
            },
          },
        },
      }
      require("jdtls").start_or_attach(config)
    end,
  },
  -- {
  --   "nvim-java/nvim-java",
  --   config = function()
  --     require("java").setup {}
  --   end,
  -- },
}
