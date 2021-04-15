local iron = require("iron")
local M = {}

M.open_iron = function(orientation)
  local old_config = iron.config.repl_open_cmd
  iron.core.set_config{repl_open_cmd = orientation}
  iron.core.repl_for(vim.api.nvim_buf_get_option(0,"ft"))
  iron.core.set_config{repl_open_cmd = old_config}
end

return M
