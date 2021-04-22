local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'

local M = {}

M.setup = function()
  -- Check if it's already defined for when reloading this file
  if not lspconfig.ltex_ls then
    configs.ltex_ls = {
      default_config = {
        cmd = { "/home/rishi/bin/langservs/ltex-ls-12.0.0/bin/ltex-ls" };
        filetypes = { "markdown", "org", "latex" };
        root_dir = function(fname)
          return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
        end;
        settings = {};
      };
    }
  end
  lspconfig.ltex_ls.setup({})
end

return M



