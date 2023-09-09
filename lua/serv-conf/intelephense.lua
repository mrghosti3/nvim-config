return {
  settings = {
    intelephense = {
      diagnostics = {
        run = "onSave"
      },
      files = {
        exclude = {
          "**/.git/**",
          "**/.svn/**",
          "**/.hg/**",
          "**/CVS/**",
          "**/.DS_Store/**",
          "**/node_modules/**",
          "**/bower_components/**",
          "**/vendor/**/{Tests,tests}/**",
          "**/.history/**",
          "**/vendor/**/vendor/**",
          "**/var/**"
        }
      },
      references = {
        exclude = {
          "**/vendor/**",
          "**/var/**"
        }
      },
      rename = {
        exclude = {
          "**/vendor/**",
          "**/var/**"
        },
        namespaceMode = "all"
      }
    }
  }
}
