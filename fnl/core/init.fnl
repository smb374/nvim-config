(tset _G :pack [])

(if (= (vim.fn.filereadable (.. (vim.fn.stdpath :config) "/lua/packer_compiled.lua")) 1)
  (require :packer_compiled))

(require :plugins)
(require :options)
(require :keymaps)
(require :core.modeline)
