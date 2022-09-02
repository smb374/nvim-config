(import-macros {: packadd!} :macros)
(local {: use} (require :utils))

(fn config []
  (packadd! parinfer-rust)
  (let [(ok? parinfer) (pcall #(require :parinfer))]
    (when ok?
      (parinfer.setup))))

(use :eraserhd/parinfer-rust {:opt true :run "cargo build --release"})
(use :harrygallagher4/nvim-parinfer-rust {:event :InsertEnter :config config})
