(fn use [package ?opts]
  (let [tbl (or ?opts {})]
    (doto tbl (tset 1 package))
    (table.insert _G.pack tbl)))

(fn wk-register [keys ?opts]
  (let [(ok? wk) (pcall #(require :which-key))]
    (when ok?
      (local fallback-opts {:mode :n
                            :prefix :<leader>
                            :buffer nil
                            :silent true
                            :noremap true
                            :nowait false})
      (wk.register keys (or ?opts fallback-opts)))))

{:wk-register wk-register
 :use use}
