(local {: use} (require :utils))

(fn config []
  (let [{: setup} (require :onenord)]
    (setup {:fade_nc false
            :borders true})))

(use :rmehri01/onenord.nvim
     {:config config})
