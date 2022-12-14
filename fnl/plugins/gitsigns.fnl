(local {: use} (require :utils))

(fn config []
  (let [(ok? gitsigns) (pcall #(require :gitsigns))]
    (when ok?
      (gitsigns.setup))))


(use :lewis6991/gitsigns.nvim
     {:event :BufRead
      :config config})
