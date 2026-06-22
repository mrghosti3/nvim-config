return {
  settings = {
    java = {
      codeGeneration = {
        generateComments = true
      },
      configuration = {
        runtimes = {
          {
            name = "JavaSE-25",
            path = "/usr/lib/jvm/jre-openjdk"
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
