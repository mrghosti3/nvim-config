vim.api.nvim_create_user_command(
    "Bdelete",
    function(opts)
        local args = opts.fargs
        local buf = nil
        if #args > 1 then
            vim.notify(
                'Bdelete: too many arguments: expected 1, found ' .. #args,
                vim.log.levels.ERROR,
                {}
            )
            return
        elseif #args == 1 then
            buf = vim.fn.bufnr(args[1], false)
        end

        require('cnf.utils').bufdel(buf, opts.bang)
    end,
    {
        nargs = '*',
        bang = true,
        complete = 'buffer',
        desc = 'Delete buffer without closing window'
    }
)

vim.api.nvim_create_user_command(
    "Lspls",
    function(opts)
        local args = opts.fargs
        local bufs = { }

        if #args > 0 then
            for _, b in ipairs(args) do
                local buf, ok = pcall(vim.fn.bufnr, b, false)
                if ok and buf ~= -1 then
                    table.insert(bufs, b)
                end
            end
        else
            for _, b in ipairs(vim.api.nvim_list_bufs()) do
                if vim.bo[b].buflisted == true then
                    table.insert(bufs, b)
                end
            end
        end

        local lsps = {}
        for _, l in ipairs(vim.lsp.get_clients()) do
            for _, b in ipairs(bufs) do
                if l.attached_buffers[b] then
                    if lsps[l.name] == nil then
                        lsps[l.name] = {}
                    end

                    table.insert(lsps[l.name], b)
                end
            end
        end
        vim.print(lsps)
    end,
    {
        nargs = '*',
        bang = false,
        complete = 'buffer',
        desc = 'Delete buffer without closing window'
    }
)
