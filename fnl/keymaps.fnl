(local map vim.keymap.set)
(local utils (require :utils))

(map :n :<esc> :<esc><cmd>noh<cr>)
(map :n :<c-m-left> :<cmd>BufferLineCyclePrev<cr>)
(map :n :<c-m-right> :<cmd>BufferLineCycleNext<cr>)

(utils.wk-register {:<up> [:<c-w>k "Goto Window Up"]
                    :<down> [:<c-w>j "Goto Window Down"]
                    :<left> [:<c-w>h "Goto Window Left"]
                    :<right> [:<c-w>l "Goto Window Right"]})
