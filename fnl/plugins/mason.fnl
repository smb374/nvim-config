(local {: use} (require :utils))

(fn mason-config []
  (let [(ok? {: setup}) (pcall #(require :mason))]
    (when ok?
      (setup {:ui {:border :single}}))))

(fn mason-lsp-config []
  (let [(ok? {: setup}) (pcall #(require :mason-lspconfig))]
    (when ok?
      (setup))))

(use :williamboman/mason.nvim
     {:event [:BufRead :BufWinEnter :BufNewFile]
      :config mason-config})

(use :williamboman/mason-lspconfig.nvim
     {:after :mason.nvim
      :config mason-lsp-config})
