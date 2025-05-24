return {
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        features = "all"
      },
      files = {
        excludeDirs = {
          ".git",
          "node_modules",
          "build",
          "target"
        }
      },
      imports = {
        granularity = {
          group = "module"
        },
        prefix = "self"
      },
    }
  }
}
