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
  require("telescope").setup({
    extensions = {
      fzf = {
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    }
  })
  require("telescope").load_extension("frecency")
  require("telescope").load_extension("project")
  require("telescope").load_extension("fzf")
end

return M
