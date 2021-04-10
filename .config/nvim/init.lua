-- This config is made possible by the people in the Doom Emacs Discord
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

vim.cmd [[let g:lexima_no_default_rules = v:true]]
vim.cmd [[call lexima#set_default_rules()]]
vim.cmd [[let g:lexima_map_escape = '']]

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
  code_action_prompt  = { virtual_text = true },
})

require("lualine").setup{
  options = {theme = "gruvbox_material", icons_enabled = true},
  sections = {
          lualine_a = { {'mode', upper = true} },
          lualine_b = { {'branch', icon = ''} },
          lualine_c = { {'filename', file_status = true, 'filetype' } },
          lualine_x = { 'encoding', 'fileformat' },
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

-- toggleterm setup
require("toggleterm").setup{
  size            = 15,
  open_mapping    = [[`]],
  shade_filetypes = {},
  shade_terminals = false,
  shading_factor  = '3', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  persist_size    = true,
  direction       = 'horizontal',
}

g.rainbow_active = 1

-- Theming
vim.o.termguicolors = true
cmd [[let g:gruvbox_material_background = 'soft']]
cmd [[colorscheme gruvbox-material]]

-- Globals
local indent      = 2
g.conceallevel    = 3
cmd 'set nocompatible'
cmd 'set signcolumn=number'
cmd 'set clipboard+=unnamedplus' -- Is this really a good idea?
vim.o.completeopt = "menuone,noselect"
vim.o.expandtab   = true
vim.o.tabstop     = indent
vim.o.shiftwidth  = indent
vim.o.wrap        = true
vim.o.linebreak   = true
vim.o.confirm     = true -- Don't fail the command but give a prompt
vim.o.hidden      = true -- Do not save when switching buffers
vim.wo.number     = true -- Enable line numbers by default
vim.o.shortmess   = string.gsub(vim.o.shortmess, "F", "") .. "c"
vim.o.hlsearch    = false

-- Case insensitive searching
vim.o.ignorecase  = true
vim.o.smartcase   = true

-- Preview panes are opened below
g.splitbelow = 0

vim.o.autoread = true -- Reload files changed outside of vim

-- Some markdown globals
cmd([[autocmd BufRead,BufNewFile *.md setlocal spell]])
cmd "let g:vim_markdown_fenced_languages = ['elixir', 'scala', 'javascript=js', 'nim', 'python', 'r']"
-- Globals End Here!

-- Keybindings, using Spacemacs-esque bindings
g.mapleader = " " -- Here we set our leader to <Space>!

require("keybindings").setup()

cmd [[augroup lsp]]
cmd [[au!]]
cmd [[au FileType scala,sbt lua require("metals").initialize_or_attach(Metals_config)]]
cmd [[augroup end]]
require("colorizer").setup() -- Colorizer needs to be set as last, else termguicolors acts up
