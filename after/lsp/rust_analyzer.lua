local ra_path = vim.fn.expand("$HOME/.local/cargo/bin/rust-analyzer")

return {
  cmd = {
    ra_path,
  },
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
