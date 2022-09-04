(local {: use} (require :utils))

(fn config []
  (let [(ok? {: setup}) (pcall #(require :trouble))]
    (setup)))

(use :folke/trouble.nvim
     {:requries :kyazdani42/nvim-web-devicons
      :cmd :TroubleToggle
      :config config})
