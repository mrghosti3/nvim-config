return {
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        buildScripts = {
          enabled = true
        },
        features = "all"
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
