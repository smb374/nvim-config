(local {: use} (require :utils))

(fn config []
  (vim.cmd "colorscheme oxocarbon"))

(use :shaunsingh/oxocarbon.nvim
     {:run "./install.sh"
      :config config})
