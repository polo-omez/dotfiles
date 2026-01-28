local M = {}

function M.setup()
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name

    local config = {
        -- El comando depende de que Mason haya creado el enlace simbólico 'jdtls'
        cmd = { "jdtls", "-data", workspace_dir },
        root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),
        settings = {
            java = {
                -- Tus ajustes específicos de Java aquí
            }
        },
        init_options = {
            bundles = {}
        },
    }
    require('jdtls').start_or_attach(config)
end

return M
