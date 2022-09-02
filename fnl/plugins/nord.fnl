(local use (. (require :utils) :use))

(use :shaunsingh/nord.nvim
     {:config (fn [] (let [g vim.g
                           cmd vim.cmd]
                      (set g.nord_contrast true)
                      (set g.nord_borders true)
                      (set g.nord_italic true)
                      (set g.nord_uniform_diff_background true)
                      (cmd "colorscheme nord")))})
