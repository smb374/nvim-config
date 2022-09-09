(local {: use} (require :utils))

(fn config []
  (let [{: setup} (require :tokyonight)]
    (setup {:style :storm
            :terminal_colors true
            :styles {:comments :italic
                     :keywords :italic
                     :functions "bold,italic"
                     :variables :bold
                     :sidebars :dark
                     :floats :dark}})
    (vim.cmd "colorscheme tokyonight")))

(use :folke/tokyonight.nvim
     {:config config})
