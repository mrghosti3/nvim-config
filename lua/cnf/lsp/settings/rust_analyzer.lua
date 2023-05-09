return {
  settings = {
    rust_analyzer = {
      cargo = {
        buildScripts = {
          enabled = true
        },
      },
      files = {
        excludeDirs = {
          ".git",
          "node_modules",
          "build",
        }
      },
      procMacro = {
        enabled = true
      },
      imports = {
        granularity = {
          group = "module"
        },
        prefix = "self"
      }
    }
  }
}
