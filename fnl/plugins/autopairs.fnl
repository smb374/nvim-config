(local {: use} (require :utils))

(fn config []
  (let [(ok? {: setup}) (pcall #(require :nvim-autopairs))]
    (when ok?
      (setup {:enable_check_bracket_line false}))))

(use :windwp/nvim-autopairs {:event :InsertEnter
                             :config config})
