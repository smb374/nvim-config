(import-macros {: packadd!} :macros)
(local {: use} (require :utils))
(local nvim (require :nvim))

(fn config []
  (let [(ok? {: setup}) (pcall #(require :crates))
        (nok? cmp) (pcall #(require :cmp))]
    (when (and ok? nok?)
      (setup)
      (cmp.setup.buffer {:sources [{:name :crates}]}))))

(use :Saecki/crates.nvim
     {:cond (fn [] (= (vim.fn.expand "%:t") "Cargo.toml"))
      :config config})
