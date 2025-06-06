local jdtls = require('jdtls')

local M = {}

function M.setup()
    local home = vim.fn.expand("$HOME")
    local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

    local config = {
        cmd = {
            "java",
            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            "-Dosgi.bundles.defaultStartLevel=4",
            "-Declipse.product=org.eclipse.jdt.ls.core.product",
            "-Dlog.protocol=true",
            "-Dlog.level=ALL",
            "-Xmx1g",
            "--add-modules=ALL-SYSTEM",
            "--add-opens", "java.base/java.util=ALL-UNNAMED",
            "--add-opens", "java.base/java.lang=ALL-UNNAMED",
            "-jar", vim.fn.glob(home ..
            "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
            "-configuration", home .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
            "-data", workspace_dir
        },
        test_command = {
            ["junit"] = {
                "java",
                "-cp",
                "${classpath}",
                "org.junit.jupiter.JUnitPlatform",
                "--classpath",
                "${classpath}"
            },
            ["mocha"] = {
                "java",
                "-cp",
                "${classpath}",
                "org.mortbay.jetty.Main",
                "--reporter", "junitxml",
                "--test", "mocha"
            },
            ["jest"] = {
                "java",
                "-cp",
                "${classpath}",
                "jest",
                "--runTestsInParallel"
            }

        },
        root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "test" }),
    }

    jdtls.start_or_attach(config)
    require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    require('jdtls.dap').setup_dap_main_class_configs()
    require('jdtls.test').setup_test()


    -- Add this line to run your tests
end

return M
