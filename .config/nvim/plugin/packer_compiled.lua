-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = true
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/rishi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/rishi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/rishi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/rishi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/rishi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  aniseed = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/aniseed"
  },
  ["auto-session"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/auto-session"
  },
  ["compe-conjure"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/compe-conjure"
  },
  conjure = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/conjure"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox-flat.nvim"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/gruvbox-flat.nvim"
  },
  ["gruvy.nvim"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/gruvy.nvim"
  },
  gruvyflat = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/gruvyflat"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/lightspeed.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  neogit = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/neogit"
  },
  neorg = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/neorg"
  },
  ["nim.nvim"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/nim.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-metals"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/nvim-metals"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["snap.nvim"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/snap.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-better-default"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/vim-better-default"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-sexp"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/vim-sexp"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  },
  ["zen-mode.nvim"] = {
    loaded = true,
    path = "/home/rishi/.local/share/nvim/site/pack/packer/start/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
