-- Helper function to map keybindings
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local M = {}

M.setup = function()
  map("n", "<leader>fs", ":w<CR>") -- Saving files
  map("n", "<leader>qq", ":q<CR>") -- Quit a file/window
  map("n", "<leader>fP", ":lua require('settings.telescope').search_dotfiles()<CR>")
  map("n", "<leader>ft", ":NvimTreeToggle<CR>")

  -- Buffers
  map("n", "<leader>bd", ":bdelete<CR>")
  map("n", "<leader>bn", ":bn<CR>")
  map("n", "<leader>bp", ":bp<CR>")
  map("n", "<leader>bc", ":enew<CR>")

  -- Word wrap navigation
  map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
  map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

  -- LSP
  map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  map("n", "gh", '<cmd>lua require"lspsaga.hover".render_hover_doc()<CR>')
  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  map("n", "gds", '<cmd>lua require"telescope.builtin".lsp_document_symbols()<CR>')
  map("n", "gws", '<cmd>lua require"settings.telescope".lsp_workspace_symbols()<CR>')
  map("n", "<leader>cr", '<cmd>lua require"lspsaga.rename".rename()<CR>')
  map("n", "<leader>ca", '<cmd>lua require"lspsaga.codeaction".code_action()<CR>')
  map("v", "<leader>ca", '<cmd>lua require"lspsaga.codeaction".range_code_action()<CR>')
  map("n", "<leader>ws", '<cmd>lua require"metals".worksheet_hover()<CR>')
  map("n", "<leader>a", '<cmd>lua require"metals".open_all_diagnostics()<CR>')
  map("n", "<leader>d", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>") -- buffer diagnostics only
  map("n", "]c", '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_next()<CR>')
  map("n", "[c", '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_prev()<CR>')
  map("n", "<leader>ln", "<cmd>lua vim.lsp.diagnostic.get_line_diagnostics()<CR>")

  -- Lexima, nvim-compe and vsnips movements
  map("i", "<CR>", [[compe#confirm(lexima#expand('<LT>CR>', 'i'))]], { expr = true })
  vim.cmd([[imap <expr> <Tab>   pumvisible() ? "<C-n>" : vsnip#jumpable(1)   ? "<Plug>(vsnip-jump-next)" : "<Tab>"]])
  vim.cmd([[imap <expr> <S-Tab> pumvisible() ? "<C-p>" : vsnip#jumpable(-1)  ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"]])
  vim.cmd([[smap <expr> <Tab>   vsnip#jumpable(1)  ? "<Plug>(vsnip-jump-next)" : "<Tab>"]])
  vim.cmd([[smap <expr> <S-Tab> vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"]])

  -- Telescope for easy file finding
  map("n", "<leader>ff", ":Telescope find_files<CR>")
  map("n", "<leader>fg", ":Telescope live_grep<CR>")
  map("n", "<leader>bb", ":Telescope buffers<CR>")
  map("n", "<leader><space>", ":Telescope find_files<CR>") -- TODO: Have to work this out with "<leader>ff" binding.
  map("n", "<leader>pp", ":lua require'telescope'.extensions.project.project{}<CR>")
  map("n", "<leader>nf", ":lua require'settings.telescope'.search_notes()<CR>")

  -- Window management
  map("n", "<leader>ww", "<C-w>w")          -- Switch windows
  map("n", "<leader>wk", ":wincmd k<CR>")   -- Move to the window above
  map("n", "<leader>wj", ":wincmd j<CR>")   -- Move to the window below
  map("n", "<leader>wh", ":wincmd h<CR>")   -- Move to the window left
  map("n", "<leader>wl", ":wincmd l<CR>")   -- Move to the window right
  map("n", "<leader>wn", ":vnew<CR>")       -- Create new window, I've configured it to be a horizontal split
  map("n", "<leader>wd", ":q<CR>")          -- Close a window

  -- Terminal
  map("t", "<Esc>", [[<C-\><C-n>]])

  -- Iron.nvim mappings for easy REPL'ing
  map("n", "<leader>or", [[:lua require'settings.iron'.open_iron("below 15 split")<CR>]])

  -- Basically zen mode
  map("n", "<leader>tz", ":Goyo<CR>")

  map("v", "ga", ":EasyAlign)")
  map("n", "ga", ":EasyAlign)")
  vim.cmd("xmap ga <Plug>(EasyAlign)")
  vim.cmd("nmap ga <Plug>(EasyAlign)")
end

return M
