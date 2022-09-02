(local use (. (require :utils) :use))

(fn config []
  (let [(ok? wk) (pcall #(require :which-key))]
    (when ok?
      (wk.setup {:icons {:breadcrumb :>>
                         :separator :->
                         :group :+}
                 :key_labels {:<Space> :SPC
                              :<CR> :RET
                              :<Tab> :TAB
                              :<Up> :UP
                              :<Down> :DOWN
                              :<Left> :LEFT
                              :<Right> :RIGHT}}))))

(use :folke/which-key.nvim {:config config})
