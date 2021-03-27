" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/rishi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/rishi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/rishi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/rishi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/rishi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/goyo.vim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  nerdtree = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/nerdtree"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-metals"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/nvim-metals"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  rainbow = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/rainbow"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-pandoc"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/vim-pandoc"
  },
  ["vim-pandoc-syntax"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/vim-pandoc-syntax"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/vista.vim"
  }
}


-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
