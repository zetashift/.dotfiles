-- This config is made possible by the people in the Doom Emacs Discord
local cmd = vim.cmd
local g = vim.g
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
require("settings.compe").setup() -- For autocompletion
require("nvim-treesitter.configs").setup({})
require("settings.lsp").setup()   -- Make NeoVim an IDE!
require("lspsaga").init_lsp_saga({
  finder_action_keys = { open = "<CR>", vsplit = "s", split = "i", quit = "q" },
  server_filetype_map = { metals = { "sbt", "scala" } },
  code_action_prompt = { virtual_text = false },
})

-- toggleterm setup
require("toggleterm").setup{
  size = 15,
  open_mapping = [[<C-`>]],
  shade_filetypes = {},
  shade_terminals = false,
  shading_factor = '3', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  persist_size = true,
  direction = 'horizontal',
}

g.rainbow_active = 1
g['AutoPairsCompatibleMaps'] = 0

-- Theming
vim.o.termguicolors = true
cmd 'colorscheme gruvbox-material'

-- Status Bar
g.lightline = { colorscheme = 'everforest';
 active = { left = { { 'mode', 'paste' }, { 'gitbranch','readonly', 'filename', 'modified' } } };
}

-- Globals
local indent = 2
g.conceallevel = 3
cmd 'filetype plugin indent on'
cmd 'syntax on'
cmd 'set nocompatible'
cmd 'set signcolumn=number'
vim.o.completeopt = "menuone,noselect"
vim.o.expandtab = true
vim.o.tabstop = indent
vim.o.shiftwidth = indent
vim.o.wrap = true
vim.o.linebreak = true
vim.o.confirm = true -- Don't fail the command but give a prompt
vim.o.hidden = true -- Do not save when switching buffers
vim.wo.number = true -- Enable line numbers by default
vim.o.shortmess = string.gsub(vim.o.shortmess, "F", "") .. "c"

-- Case insensitive searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Preview panes are opened below
g.splitbelow = 0

vim.o.autoread = true -- Reload files  changed outside of vim

-- Some markdown globals
cmd([[autocmd FileType pandoc setlocal textwidth=80]])
cmd([[autocmd BufRead,BufNewFile *.md setlocal spell]])
g['pandoc#syntax#codeblocks#embeds#langs'] = {"scala","nim", "python", "elixir", "js=javascript","sh" ,"c"}

-- Globals End Here!

-- Keybindings, using Spacemacs-esque bindings
g.mapleader = " " -- Here we set our leader to <Space>!

-- Helper function to map keybindings
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>fs', ':w<CR>') -- Saving files
map('n', '<leader>qq', ':q<CR>') -- Quit a file
map('n', '<leader>fed', ':e ~/.config/nvim/init.lua<CR>')
map('n', '<leader>ft', ':NERDTreeToggle<CR>')
map('n', '<leader>bd', ':bdelete<CR>') -- Buffers
map('n', '<leader>bb', ':Telescope buffers<CR>')
map('n', '<leader>bn', ':bn<CR>')
map('n', '<leader>bp', ':bp<CR>')
map('n', '<leader>bc', ':enew<CR>')
map('n', '<leader>ww', '<C-w>w')
map('n', '<leader>tz', ':Goyo<CR>')
map('n', '<leader>ff', ':Telescope find_files<CR>')

-- Scala Metals Setup
Metals_config = require'metals'.bare_config
Metals_config.init_options.statusBarProvider = 'on'

cmd [[augroup lsp]]
cmd [[au!]]
cmd [[au FileType scala,sbt lua require("metals").initialize_or_attach(Metals_config)]]
cmd [[augroup end]]
