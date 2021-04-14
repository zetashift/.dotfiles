local M = {}

M.search_notes = function()
  require("telescope.builtin").find_files({
    prompt_title = "Browse Notes",
    cwd = "~/dev/vaults/"
  })
end

M.search_dotfiles = function()
  require("telescope.builtin").find_files({
    prompt_title = "NeoVim Config",
    cwd = vim.fn.stdpath("config"),
  })
end

M.setup = function()
  -- I'll be using Telescope for project management too
  require("telescope").setup()
  require("telescope").load_extension("project")
  require("telescope").load_extension("fzy_native")
end

return M
