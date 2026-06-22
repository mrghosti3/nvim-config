

vim.api.nvim_create_user_command(
    "Bdelete",
    function(opts)
        local args = opts.fargs
        local buf = nil
        if #args > 1 then
            vim.notify(
                'Too many arguments: ' .. opts.nargs,
                vim.log.levels.ERROR,
                {}
            )
        elseif #args == 1 then
            buf = vim.fn.bufnr(args[1], false)
        end

        require('cnf.utils').bufdel(buf, opts.bang)
    end,
    {
        nargs = '?',
        bang = true,
        complete = 'buffer',
        desc = 'Delete buffer without closing window'
    }
)
