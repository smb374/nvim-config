-- Bootstrap

local command = vim.api.nvim_command
local fn = vim.fn
local fmt = string.format

local pack_path = fn.stdpath("data") .. "/site/pack"

local function ensure (user, repo, level)
  -- Ensures a given github.com/USER/REPO is cloned in the pack/packer/start directory.
  local install_path = fmt("%s/packer/%s/%s", pack_path, level, repo)
  if fn.empty(fn.glob(install_path)) > 0 then
    command(fmt("!git clone https://github.com/%s/%s %s", user, repo, install_path))
    command(fmt("packadd %s", repo))
  end
end

ensure("wbthomason", "packer.nvim", "opt")
ensure("rktjmp", "hotpot.nvim", "start")

require("hotpot").setup({ provide_require_fennel = true })

require("core")
