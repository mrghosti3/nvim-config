local ra_path = vim.fn.expand("$HOME/.cargo/bin/rust-analyzer")

return {
    autostart = true,
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
