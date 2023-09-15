return {
    autostart = true,
    cmd = {
        "/usr/bin/rust-analyzer",
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
