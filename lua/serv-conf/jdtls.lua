return {
  autostart = false,
  settings = {
    java = {
      codeGeneration = {
        generateComments = true
      },
      configuration = {
        runtimes = {
          {
            name = "JavaSE-21",
            path = "/usr/lib/jvm/java-21/"
          }
        }
      },
      format = {
        enabled = false,
      },
      import = {
        exclusions = {
          "**/node_modules/**",
          "**/.metadata/**",
          "**/archetype-resources/**",
          "**/META-INF/maven/**",
          "**/build/**",
          "**/bin/**"
        }
      }
    }
  }
}
