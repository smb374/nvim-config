(local {: use} (require :utils))

(fn config []
  (let [(ok? {: setup}) (pcall #(require :indent_blankline))]
    (when ok?
      (setup {:buftype_exclude [:terminal]
              :filetype_exclude [:help
                                 :terminal
                                 :alpha
                                 :packer
                                 :lspinfo
                                 :TelescopePrompt
                                 :TelescopeResults
                                 :mason
                                 ""]
              :use_treesitter true
              :indentLine_enabled 1
              :show_first_indent_level false
              :show_current_context_start true
              :show_current_context true
              :show_trailing_blankline_indent false}))))

(use :lukas-reineke/indent-blankline.nvim
  {:event [:BufRead :BufWinEnter :BufNewFile]
   :after :nvim-treesitter
   :config config})
