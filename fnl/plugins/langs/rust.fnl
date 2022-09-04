(import-macros {: packadd!} :macros)
(local {: use} (require :utils))
(local nvim (require :nvim))

(fn config []
  (let [(ok? {: setup}) (pcall #(require :crates))]
    (when ok?
      (setup))))

(use :Saecki/crates.nvim
     {:config config})
