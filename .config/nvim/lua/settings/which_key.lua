local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    f = {
      name = "find/file",
      b = { "<cmd>NnnPicker<CR>", "Toggle file explorer" },
      f = { "<cmd>Telescope find_files<CR>", "Find File" },
			g = { "<cmd>Telescope live_grep<CR>", "Grep" },
      s = { ":w<CR>", "Save file" },
      r = { "<cmd>Telescope oldfiles<CR>", "Recent files" },
      t = { "<cmd>NnnExplorer<CR>", "Toggle file tree" },
    },

    c = {
      name = "code",
    },

    b = {
      name = "buffer",
      b = { "<cmd>Telescope buffers<CR>", "List buffers" },
      c = { ":enew<CR>", "New buffer" },
      d = { ":bdel!<CR>", "Delete buffer" },
			f = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Fuzzy find in buffer"},
      n = { "<cmd>BufferNext<CR>", "Next buffer" },
      p = { "<cmd>BufferPrevious<CR>", "Previous buffer" },
    },

    q = {
      name = "quit",
      q = { ":qa!<CR>", "Quit NeoVim" },
    },

    p = {
      name = "project",
      p = { "<cmd>lua require('session-lens').search_session()<CR>", "List projects" },
    },

    t = {
      name = "toggle",
      t = { "", "Toggle terminal" },
      f = { "<cmd>NnnPicker<CR>", "Toggle file explorer" },
    },

    u = {
      name = "update",
      u = { "<cmd>PackerSync<CR>", "Update plugins" },
    },

    w = {
      name = "window",
    },
  },
})

-- A keybinding for finding files quickly
wk.register({
  ["<leader><space>"] = { "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({layout_config={height=12}}))<CR>", "Find file" },
})
-- A binding for terminal mode and nnn.nvim
vim.api.nvim_set_keymap("t", "<leader>ft", "<cmd>NnnExplorer<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<leader>tf", "<cmd>NnnPicker<CR>", { noremap = true, silent = true })
