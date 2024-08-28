---@class rvim.util.cmp
local M = {}

-- This is a better implementation of `cmp.confirm`:
--  * Check if the completion menu is visible without waiting for running sources
--  * Create an undo point before confirming
-- This function is both faster and more reliable.
---@diagnostic disable-next-line
---@param opts? {select: boolean, behavior: cmp.ConfirmBehavior}
function M.confirm(opts)
  local cmp = require("cmp")
  opts = vim.tbl_extend("force", {
    select = true,
    behavior = cmp.ConfirmBehavior.Insert,
  }, opts or {})
  return function(fallback)
    if cmp.core.view:visible() or vim.fn.pumvisible() == 1 then
      if cmp.confirm(opts) then
        return
      end
    end
    return fallback()
  end
end

function M.visible()
  ---@module 'cmp'
  local cmp = package.loaded["cmp"]
  return cmp and cmp.core.view:visible()
end

return M
