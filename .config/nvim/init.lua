require('base')
require('maps')
require('highlights')
require('plugins')

local has = function(x)
    return vim.fn.has(x) == 1
end

local ismac = has 'macunix'
--local is_win = has 'win32'

if is_mac then
    require('macos')
end
--if is_win then
--	require('windows')
--end
