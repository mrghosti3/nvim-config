local M = {}

--- @param bufs integer[] NVIM bufs
--- @return integer[]
local function filter_bufs(bufs)
    local fbufs = {}
    for _, b in ipairs(bufs) do
        if vim.bo[b].buflisted then
            table.insert(fbufs, b)
        end
    end

    return fbufs
end

--- @param bufs integer[] NVIM bufs
--- @param current_buf integer current active buf
--- @return integer? buf id, null on fail
local function find_next_buf(bufs, current_buf)
    if #bufs < 2 then
        return nil
    end

    local buf = -1

    for i, b in ipairs(bufs) do
        if b == current_buf then
            if i < #bufs then
                buf = bufs[i + 1]
            else
                buf = bufs[i - 1]
            end
        end
    end

    return buf
end

---@param bufn number? Buffer number (defaults to current buffer)
---@param force boolean? Force delete even if buffer is modified (defaults to false)
function M.bufdel(bufn, force)
    bufn = bufn or vim.api.nvim_get_current_buf()
    force = force or false

    if vim.bo[bufn].modified and not force then
        vim.notify('Unsaved changes on buf(' .. bufn .. ')!', vim.log.levels.ERROR)
        return
    end

    --- Additional actions for safe buffer deletion without changing window layout
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_buf(win) ~= bufn then goto continue end

        vim.api.nvim_win_call(win, function()
            local alt_bufn = find_next_buf(
                -- raw buf list contains unlisted bufs, which when switched to
                -- will open an empty window
                filter_bufs(vim.api.nvim_list_bufs()),
                bufn
            )

            if alt_bufn == nil or vim.fn.buflisted(alt_bufn) == 0 then
                --- Did not find alternative buf, therefore new buf must be created
                alt_bufn = vim.api.nvim_create_buf(true, false)

                local buf_opt = { buf = alt_bufn, scope = 'local' }
                vim.api.nvim_set_option_value('swapfile', true, buf_opt)
                vim.api.nvim_set_option_value('bufhidden', 'wipe', buf_opt)
                vim.api.nvim_set_option_value('buftype', '', buf_opt)
                vim.api.nvim_set_option_value('buflisted', false, buf_opt)
            end

            --- Switch to alternative buf
            vim.api.nvim_win_set_buf(win, alt_bufn)
        end)

        ::continue::
    end

    vim.api.nvim_buf_delete(bufn, { force = force })
end

return M
