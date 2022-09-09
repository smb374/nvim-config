(local {: use} (require :utils))

(fn config []
  (vim.cmd "colorscheme oxocarbon-lua"))

(use :B4mbus/oxocarbon-lua.nvim
     {:config config})
