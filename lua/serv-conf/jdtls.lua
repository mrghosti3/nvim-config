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

-- java.autobuild.enabled                                      default: true
-- java.codeGeneration.generateComments                        default: false
-- java.codeGeneration.hashCodeEquals.useInstanceof            default: false
-- java.codeGeneration.hashCodeEquals.useJava7Objects          default: false
-- java.codeGeneration.insertionLocation                       default: "afterCursor"
-- java.codeGeneration.toString.codeStyle                      default: "STRING_CONCATENATION"
-- java.codeGeneration.toString.limitElements                  default: 0
-- java.codeGeneration.toString.listArrayContents              default: true
-- java.codeGeneration.toString.skipNullValues                 default: false
-- java.codeGeneration.toString.template                       default: "${object.className} [${member.name()}=${member.value}, ${otherMembers}]"
-- java.codeGeneration.useBlocks                               default: false
-- java.completion.enabled                                     default: true
-- java.completion.favoriteStaticMembers                       default: ["org.junit.Assert.*","org.junit.Assume.*","org.junit.jupiter.api.Assertions.*","org.junit.jupiter.api.Assumptions.*","org.junit.jupiter.api.DynamicContainer.*","org.junit.jupiter.api.DynamicTest.*","org.mockito.Mockito.*","org.mockito.ArgumentMatchers.*","org.mockito.Answers.*"]
-- java.completion.filteredTypes                               default: ["java.awt.*","com.sun.*","sun.*","jdk.*","org.graalvm.*","io.micrometer.shaded.*"]
-- java.completion.guessMethodArguments                        default: false
-- java.completion.importOrder                                 default: ["java","javax","org","com"]
-- java.completion.maxResults                                  default: 0
-- java.configuration.checkProjectSettingsExclusions           default: false
-- java.configuration.maven.globalSettings                     default: null
-- java.configuration.maven.notCoveredPluginExecutionSeverity  default: "warning"
-- java.configuration.maven.userSettings                       default: null
-- java.configuration.runtimes                                 default: []
-- java.configuration.updateBuildConfiguration                 default: "interactive"
-- java.configuration.workspaceCacheLimit                      default: 90
-- java.contentProvider.preferred                              default: null
-- java.eclipse.downloadSources                                default: false
-- java.errors.incompleteClasspath.severity                    default: "warning"
-- java.foldingRange.enabled                                   default: true
-- java.format.comments.enabled                                default: true
-- java.format.enabled                                         default: true
-- java.format.onType.enabled                                  default: true
-- java.format.settings.profile                                default: null
-- java.format.settings.url                                    default: null
-- java.home                                                   default: null
-- java.implementationsCodeLens.enabled                        default: false
-- java.import.exclusions                                      default: ["**\/node_modules\/**","**\/.metadata\/**","**\/archetype-resources\/**","**\/META-INF\/maven\/**"]
-- java.import.generatesMetadataFilesAtProjectRoot             default: false
-- java.import.gradle.arguments                                default: null
-- java.import.gradle.enabled                                  default: true
-- java.import.gradle.home                                     default: null
-- java.import.gradle.java.home                                default: null
-- java.import.gradle.jvmArguments                             default: null
-- java.import.gradle.offline.enabled                          default: false
-- java.import.gradle.user.home                                default: null
-- java.import.gradle.version                                  default: null
-- java.import.gradle.wrapper.enabled                          default: true
-- java.import.maven.enabled                                   default: true
-- java.imports.gradle.wrapper.checksums                       default: []
-- java.inlayHints.parameterNames.enabled                      default: "literals"
-- java.inlayHints.parameterNames.exclusions                   default: []
-- java.jdt.ls.java.home                                       default: null
-- java.jdt.ls.lombokSupport.enabled                           default: true
-- java.jdt.ls.vmargs                                          default: "-XX:+UseParallelGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -Dsun.zip.disableMemoryMapping=true -Xmx1G -Xms100m"
-- java.maven.downloadSources                                  default: false
-- java.maven.updateSnapshots                                  default: false
-- java.maxConcurrentBuilds                                    default: 1
-- java.progressReports.enabled                                default: true
-- java.project.encoding                                       default: "ignore"
-- java.project.importHint                                     default: true
-- java.project.importOnFirstTimeStartup                       default: "automatic"
-- java.project.outputPath                                     default: ""
-- java.project.referencedLibraries                            default: ["lib\/**\/*.jar"]
-- java.project.resourceFilters                                default: ["node_modules",".git"]
-- java.project.sourcePaths                                    default: []
-- java.quickfix.showAt                                        default: "line"
-- java.recommendations.dependency.analytics.show              default: true
-- java.references.includeAccessors                            default: true
-- java.references.includeDecompiledSources                    default: true
-- java.referencesCodeLens.enabled                             default: false
-- java.saveActions.organizeImports                            default: false
-- java.selectionRange.enabled                                 default: true
-- java.server.launchMode                                      default: "Hybrid"
-- java.settings.url                                           default: null
-- java.showBuildStatusOnStart.enabled                         default: "notification"
-- java.signatureHelp.description.enabled                      default: false
-- java.signatureHelp.enabled                                  default: false
-- java.sources.organizeImports.starThreshold                  default: 99
-- java.sources.organizeImports.staticStarThreshold            default: 99
-- java.symbols.includeSourceMethodDeclarations                default: false
-- java.templates.fileHeader                                   default: []
-- java.templates.typeComment                                  default: []
-- java.trace.server                                           default: "off"
-- java.typeHierarchy.lazyLoad                                 default: false
