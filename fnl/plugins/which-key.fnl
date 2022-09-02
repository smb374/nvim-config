(local {: use} (require :utils))

(fn config []
  (let [(ok? {: setup}) (pcall #(require :which-key))]
    (when ok?
      (setup {:icons {:breadcrumb :>>
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
