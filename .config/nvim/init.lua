-- This config is made possible by the people in the Doom Emacs Discord and @ckipp01
local cmd     = vim.cmd
local g       = vim.g
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
   execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

cmd [[packadd packer.nvim]]

-----------------
--Plugins Setup--
-----------------
require 'plugins'

require("settings.compe").setup()             -- For autocompletion
require("nvim-treesitter.configs").setup{
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
  ensure_installed = "maintained",
  highlight = { enable = true },
}

require("settings.lsp").setup()               -- Make NeoVim an IDE!
require("settings.telescope").setup()
require("lspsaga").init_lsp_saga({
  server_filetype_map = { metals = { "sbt", "scala" } },
  code_action_prompt  = { sign = false, virtual_text = true },
})

require("lualine").setup{
  options = {theme = "gruvbox_material", icons_enabled = true},
  sections = {
          lualine_a = { {'mode', upper = true} },
          lualine_b = { {'branch', icon = ''} },
          lualine_c = { {'filename', file_status = true, 'filetype' } },
          lualine_x = { {'diagnostics', color_error = "#FFA500", sources = {'nvim_lsp'}} },
          lualine_y = { {'g:metals_status', 'bo:filetype'} },
          lualine_z = { 'location'},
        },
        inactive_sections = {
          lualine_a = {  },
          lualine_b = {  },
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {  },
          lualine_z = {   }
        }
}

require"toggleterm".setup{
  size = 20,
  open_mapping = [[`]],
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  persist_size = true,
  direction = 'horizontal',
  insert_mappings = false,
}
require"nvim-autopairs".setup()
require"gitsigns".setup()

require"hop".setup({ keys = "etovxqpdygfbzcisuran" })

g.rainbow_active = 1

-- Theming
vim.o.termguicolors = true
cmd [[let g:gruvbox_material_background = 'soft']]
cmd [[colorscheme gruvbox-material]]

-- Options
-- local indent      = 2

cmd 'set nocompatible'
cmd 'set clipboard+=unnamedplus' -- Is this really a good idea?
cmd 'set undofile'
cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
vim.o.completeopt = "menuone,noselect"

cmd [[set tabstop=2 shiftwidth=2 expandtab]] -- https://github.com/neovim/neovim/issues/12978

vim.o.wrap         = true -- Wrap when it doesn't fit the screen
vim.o.linebreak    = true -- Only break lines when I actually press "Enter"
vim.o.confirm      = true -- Don't fail the command but give a prompt
vim.o.hidden       = true -- Do not save when switching buffers
vim.wo.number      = true -- Enable line numbers by default
vim.o.conceallevel = 2    -- Hide certain text, mostly useful for Markdown
vim.o.shortmess    = string.gsub(vim.o.shortmess, "F", "") .. "c"
vim.o.hlsearch     = false
vim.o.incsearch    = true
vim.o.splitright   = true -- When doing a vertical split, new window ends up right.

-- Case insensitive searching
vim.o.ignorecase   = true
vim.o.smartcase    = true

-- Preview panes are opened below
g.splitbelow = 0

vim.o.updatetime = 250 -- Decrease update time
vim.o.autoread = true -- Reload files changed outside of vim

-- Some markdown globals
cmd [[autocmd BufRead,BufNewFile *.md setlocal spell]]
cmd [[let g:mkdx#settings = { 'highlight': { 'enable': 1 } }]]
cmd "let g:vim_markdown_fenced_languages = ['elixir', 'scala', 'javascript=js', 'nim', 'python', 'r']"

-- Keybindings, using Spacemacs-esque bindings
g.mapleader = " " -- Here we set our leader to <Space>!

require("keybindings").setup()

-- LSP setup for Metals
cmd [[augroup lsp]]
cmd [[au!]]
cmd [[au FileType scala,sbt lua require("metals").initialize_or_attach(Metals_config)]]
cmd [[augroup end]]

require("colorizer").setup() -- Colorizer needs to be set as last, else termguicolors acts up
