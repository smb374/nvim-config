(local {: use} (require :utils))

(fn config []
  (let [(ok? {: setup}) (pcall #(require :Comment))]
    (when ok? (setup))))

(use :numToStr/Comment.nvim
     {:event :BufEnter
      :config config})
