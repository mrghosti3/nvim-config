local log_path = vim.fn.stdpath('log') .. '/texlab.log'
local tl_path = vim.fn.stdpath('data') .. '/mason/bin/texlab'

return {
--[[     cmd = { ]]
--[[         tl_path, "-vvvv", "--log-file", log_path ]]
--[[     }, ]]
}
