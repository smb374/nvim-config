-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
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
local package_path_str = "/home/poyehchen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/poyehchen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/poyehchen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/poyehchen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/poyehchen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
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
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n&\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\15bufferline\frequireX\1\0\6\0\3\0\17,\0\1\0003\2\0\0006\3\1\0\18\5\2\0B\3\2\3\18\1\4\0\18\0\3\0\15\0\0\0X\3\4Ä9\3\2\0012\0\0ÄD\3\1\0X\3\3Ä+\3\0\0002\0\0ÄL\3\2\0K\0\1\0\nsetup\npcall\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n$\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\rgitsigns\frequireX\1\0\6\0\3\0\17,\0\1\0003\2\0\0006\3\1\0\18\5\2\0B\3\2\3\18\1\4\0\18\0\3\0\15\0\0\0X\3\4Ä9\3\2\0012\0\0ÄD\3\1\0X\3\3Ä+\3\0\0002\0\0ÄL\3\2\0K\0\1\0\nsetup\npcall\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hotpot.nvim"] = {
    loaded = true,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/start/hotpot.nvim",
    url = "https://github.com/rktjmp/hotpot.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["nord.nvim"] = {
    config = { "\27LJ\2\n¢\1\0\0\5\0\b\0\0156\0\0\0009\0\1\0006\1\0\0009\1\2\1+\2\2\0=\2\3\0+\2\2\0=\2\4\0+\2\2\0=\2\5\0+\2\2\0=\2\6\0\18\2\1\0'\4\a\0D\2\2\0\21colorscheme nord!nord_uniform_diff_background\16nord_italic\17nord_borders\18nord_contrast\bcmd\6g\bvim\0" },
    loaded = true,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/opt/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\2\n%\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\14nvim-tree\frequire⁄\3\1\0\25\0\24\0*,\0\1\0003\2\0\0006\3\1\0\18\5\2\0B\3\2\3\18\1\4\0\18\0\3\0\15\0\0\0X\3\29Ä9\3\2\0015\5\4\0005\6\3\0=\6\5\5'\6\6\0+\a\2\0'\b\a\0+\t\2\0'\n\b\0+\v\2\0'\f\t\0+\r\2\0'\14\n\0005\15\v\0'\16\f\0005\17\r\0'\18\14\0005\19\15\0'\20\16\0005\21\18\0005\22\17\0=\22\19\21'\22\20\0005\23\22\0005\24\21\0=\24\23\0232\0\0ÄD\3\20\0X\3\3Ä+\3\0\0002\0\0ÄL\3\2\0K\0\1\0\19indent_markers\1\0\0\1\0\1\venable\1\rrenderer\14open_file\1\0\0\1\0\1\18resize_window\2\factions\1\0\2\venable\2\14auto_open\2\23hijack_directories\1\0\2\vignore\2\venable\1\bgit\1\0\1\venable\2\24update_focused_file\15update_cwd\18hijack_cursor\17hijack_netrw\18disable_netrw\tview\1\0\0\1\0\4\21hide_root_folder\2\nwidth\3\25\tside\tleft\18adaptive_size\2\nsetup\npcall\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    commands = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo" },
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\28nvim-treesitter.configs\frequire°\a\1\0\t\0$\0:,\0\1\0003\2\0\0006\3\1\0\18\5\2\0B\3\2\3\18\1\4\0\18\0\3\0\15\0\0\0X\3-Ä6\3\2\0009\3\3\3'\5\4\0'\6\5\0&\5\6\5B\3\2\0016\3\2\0009\3\3\3'\5\4\0'\6\6\0&\5\6\5B\3\2\0019\3\a\0015\5\b\0006\6\t\0=\6\n\0055\6\v\0=\6\f\0055\6\r\0=\6\14\0055\6\15\0=\6\16\0055\6\17\0005\a\18\0=\a\19\6=\6\20\0055\6\22\0005\a\21\0=\a\23\0065\a\24\0=\a\19\0065\a\25\0005\b\26\0=\b\27\a5\b\28\0=\b\29\a5\b\30\0=\b\31\a5\b \0=\b!\a=\a\"\6=\6#\0052\0\0ÄD\3\2\0X\3\3Ä+\3\0\0002\0\0ÄL\3\2\0K\0\1\0\16textobjects\tmove\22goto_previous_end\1\0\2\a[M\20@function.outer\a[]\17@class.outer\24goto_previous_start\1\0\2\a[[\17@class.outer\a[m\20@function.outer\18goto_next_end\1\0\2\a][\17@class.outer\a]M\20@function.outer\20goto_next_start\1\0\2\a]]\17@class.outer\a]m\20@function.outer\1\0\2\14set_jumps\2\venable\2\1\0\4\aaf\20@function.outer\aic\17@class.inner\aif\20@function.inner\aac\17@class.outer\vselect\1\0\1\14lookahead\2\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\1\venable\2\frainbow\1\0\2\18extended_mode\2\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\2\venable\2\17use-language\2\21ensure_installed\ball\1\0\1\17sync_install\2\nsetup nvim-treesitter-textobjects\20nvim-ts-rainbow\rpackadd \bcmd\bvim\npcall\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim.lua"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/opt/nvim.lua",
    url = "https://github.com/norcalli/nvim.lua"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    commands = { "TSPlayground" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/opt/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/opt/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/opt/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\n%\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\14telescope\frequireœ\4\1\0\b\0\22\1E,\0\1\0003\2\0\0006\3\1\0\18\5\2\0B\3\2\3\18\1\4\0\18\0\3\0\15\0\0\0X\0038Ä9\3\2\0015\5\6\0005\6\4\0005\a\3\0=\a\5\6=\6\a\5B\3\2\0016\3\b\0009\3\t\3'\5\n\0'\6\v\0&\5\6\5B\3\2\0016\3\b\0009\3\t\3'\5\n\0'\6\f\0&\5\6\5B\3\2\0016\3\b\0009\3\t\3'\5\n\0'\6\r\0&\5\6\5B\3\2\0019\3\14\1'\5\5\0B\3\2\0019\3\14\1'\5\15\0B\3\2\0019\3\14\1'\5\16\0B\3\2\0016\3\b\0009\3\17\0039\3\18\3'\5\19\0B\3\2\2\t\3\0\0X\3\vÄ6\3\b\0009\3\t\3'\5\n\0'\6\20\0&\5\6\5B\3\2\0019\3\14\1'\5\21\0002\0\0ÄD\3\2\0X\3\aÄ+\3\0\0002\0\0ÄL\3\2\0X\3\3Ä+\3\0\0002\0\0ÄL\3\2\0K\0\1\0\16media_files\31telescope-media-files.nvim\fuebezug\15executable\afn\17file_browser\14ui-select\19load_extension telescope-file-browser.nvim\29telescope-ui-select.nvim\30telescope-fzf-native.nvim\rpackadd \bcmd\bvim\15extensions\1\0\0\bfzf\1\0\0\1\0\4\25override_file_sorter\2\28override_generic_sorter\2\14case_mode\15smart_case\nfuzzy\2\nsetup\npcall\0\2\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n%\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\14which-key\frequireˆ\1\1\0\a\0\b\0\22,\0\1\0003\2\0\0006\3\1\0\18\5\2\0B\3\2\3\18\1\4\0\18\0\3\0\15\0\0\0X\3\tÄ9\3\2\0015\5\4\0005\6\3\0=\6\5\0055\6\6\0=\6\a\0052\0\0ÄD\3\2\0X\3\3Ä+\3\0\0002\0\0ÄL\3\2\0K\0\1\0\15key_labels\1\0\a\f<Space>\bSPC\t<CR>\bRET\v<Left>\tLEFT\f<Right>\nRIGHT\t<Up>\aUP\v<Down>\tDOWN\n<Tab>\bTAB\nicons\1\0\0\1\0\3\ngroup\6+\15breadcrumb\a>>\14separator\a->\nsetup\npcall\0\0" },
    loaded = true,
    path = "/home/poyehchen/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^notify"] = "nvim-notify",
  ["^nvim"] = "nvim.lua"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
try_loadstring("\27LJ\2\nÕ\b\0\0\a\0'\0*6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3&\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\0045\5\14\0=\5\15\0045\5\16\0=\5\17\0045\5\18\0=\5\19\0045\5\20\0=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\0045\5\26\0005\6\27\0=\6\28\0055\6\29\0=\6\30\0055\6\31\0=\6 \0055\6!\0=\6\"\0055\6#\0=\6$\5=\5%\4=\4\5\3D\1\2\0\1\0\0\6l\6w\1\3\0\0-<cmd>Telescope lsp_workspace_symbols<cr>\27Find Workspace Symbols\6s\1\3\0\0,<cmd>Telescope lsp_document_symbols<cr>\26Find Document Symblos\6r\1\3\0\0&<cmd>Telescope lsp_references<cr>\20Find References\6i\1\3\0\0+<cmd>Telescope lsp_implementations<cr>\25Find Implementations\6a\1\3\0\0(<cmd>Telescope lsp_code_actions<cr>\22Find Code Actions\1\0\1\tname\bLSP\6q\1\3\0\0 <cmd>Telescope quickfix<cr>\18Find Quickfix\6C\1\3\0\0'<cmd>Telescope command_history<cr>\25Find Command History\6c\1\3\0\0 <cmd>Telescope commands<cr>\18Find Commands\6t\1\3\0\0!<cmd>Telescope filetypes<cr>\19Find Filetypes\6m\1\3\0\0\29<cmd>Telescope marks<cr>\15Find marks\6k\1\3\0\0\31<cmd>Telescope keymaps<cr>\17Find Keymaps\6h\1\3\0\0!<cmd>Telescope help_tags<cr>\19Find Help Tags\6b\1\3\0\0\31<cmd>Telescope buffers<cr>\16Find Buffer\6g\1\3\0\0!<cmd>Telescope live_grep<cr>\14Live grep\6-\1\3\0\0$<cmd>Telescope file_browser<cr>\17File Browser\6f\1\3\0\0.<cmd>Telescope find_files hidden=true<cr>\14Find File\1\0\1\tname\14Telescope\16wk-register\nutils\frequire\0", "setup", "telescope.nvim")
time([[Setup for telescope.nvim]], false)
-- Setup for: nvim-notify
time([[Setup for nvim-notify]], true)
try_loadstring("\27LJ\2\nF\0\3\b\0\3\0\v6\3\0\0006\4\2\0'\6\1\0B\4\2\2=\4\1\0036\3\0\0009\3\1\3\18\5\0\0\18\6\1\0\18\a\2\0D\3\4\0\frequire\vnotify\bvim+\1\0\2\0\3\0\0063\0\0\0006\1\1\0=\0\2\1+\1\0\0002\0\0ÄL\1\2\0\vnotify\bvim\0\0", "setup", "nvim-notify")
time([[Setup for nvim-notify]], false)
-- Setup for: nvim-treesitter
time([[Setup for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n \0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\tnvim\frequireh\0\0\3\0\a\0\0156\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\6\0\4\0X\1\4Ä\6\0\5\0X\1\2Ä\a\0\6\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\5\r[packer]\15Nvimtree_1\6%\vexpand\afn\bvimê\1\1\0\4\1\6\0\0193\0\0\0\15\0\0\0X\1\fÄ-\1\0\0009\1\1\1'\3\2\0B\1\2\0016\1\3\0'\3\4\0B\1\2\0029\1\5\1'\3\2\0002\0\0ÄD\1\2\0X\1\3Ä+\1\0\0002\0\0ÄL\1\2\0K\0\1\0\1Ä\vloader\vpacker\frequire\20nvim-treesitter\24del_augroup_by_name\0«\1\1\0\f\0\n\0\27,\0\1\0003\2\0\0006\3\1\0\18\5\2\0B\3\2\3\18\1\4\0\18\0\3\0\15\0\0\0X\3\rÄ3\3\2\0009\4\3\0015\6\4\0005\a\a\0009\b\5\1'\n\6\0004\v\0\0B\b\3\2=\b\b\a=\3\t\a2\0\0ÄD\4\3\0X\3\3Ä+\3\0\0002\0\0ÄL\3\2\0002\0\0ÄK\0\1\0\rcallback\ngroup\1\0\0\20nvim-treesitter\19create_augroup\1\2\0\0\fBufRead\19create_autocmd\0\npcall\0\0", "setup", "nvim-treesitter")
time([[Setup for nvim-treesitter]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n%\0\0\3\0\2\0\0036\0\0\0'\2\1\0D\0\2\0\14which-key\frequireˆ\1\1\0\a\0\b\0\22,\0\1\0003\2\0\0006\3\1\0\18\5\2\0B\3\2\3\18\1\4\0\18\0\3\0\15\0\0\0X\3\tÄ9\3\2\0015\5\4\0005\6\3\0=\6\5\0055\6\6\0=\6\a\0052\0\0ÄD\3\2\0X\3\3Ä+\3\0\0002\0\0ÄL\3\2\0K\0\1\0\15key_labels\1\0\a\f<Space>\bSPC\t<CR>\bRET\v<Left>\tLEFT\f<Right>\nRIGHT\t<Up>\aUP\v<Down>\tDOWN\n<Tab>\bTAB\nicons\1\0\0\1\0\3\ngroup\6+\15breadcrumb\a>>\14separator\a->\nsetup\npcall\0\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nord.nvim
time([[Config for nord.nvim]], true)
try_loadstring("\27LJ\2\n¢\1\0\0\5\0\b\0\0156\0\0\0009\0\1\0006\1\0\0009\1\2\1+\2\2\0=\2\3\0+\2\2\0=\2\4\0+\2\2\0=\2\5\0+\2\2\0=\2\6\0\18\2\1\0'\4\a\0D\2\2\0\21colorscheme nord!nord_uniform_diff_background\16nord_italic\17nord_borders\18nord_contrast\bcmd\6g\bvim\0", "config", "nord.nvim")
time([[Config for nord.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlayground lua require("packer.load")({'playground'}, { cmd = "TSPlayground", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSInstall lua require("packer.load")({'nvim-treesitter'}, { cmd = "TSInstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSBufEnable lua require("packer.load")({'nvim-treesitter'}, { cmd = "TSBufEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSBufDisable lua require("packer.load")({'nvim-treesitter'}, { cmd = "TSBufDisable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSEnable lua require("packer.load")({'nvim-treesitter'}, { cmd = "TSEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSDisable lua require("packer.load")({'nvim-treesitter'}, { cmd = "TSDisable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSModuleInfo lua require("packer.load")({'nvim-treesitter'}, { cmd = "TSModuleInfo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'bufferline.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'gitsigns.nvim', 'bufferline.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'bufferline.nvim'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
