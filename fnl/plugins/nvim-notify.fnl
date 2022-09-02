(local use (. (require :utils) :use))

(use :rcarriga/nvim-notify
     {:module :notify
      :setup (fn []
               (set vim.notify
                    (fn [msg level opts]
                      (set vim.notify (require :notify))
                      (vim.notify msg level opts))))})
