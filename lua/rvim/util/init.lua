---@class RVimUtil
---@field cmp rvim.util.cmp
---@field lsp rvim.util.lsp
---@field ui rvim.util.ui
local M = {}

setmetatable(M, {
  __index = function(table, key)
    ---@diagnostic disable-next-line: no-unknown
    table[key] = require("rvim.util." .. key)
    return table[key]
  end,
})

return M
