(local {: use : wk-register} (require :utils))

(wk-register {:b {:name :buffer
                  :d ["<cmd>Bdelete<cr>" "Close Buffer"]}})

(use :famiu/bufdelete.nvim {:cmd :Bdelete})
