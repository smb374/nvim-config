(local {: use} (require :utils))

(use :akinsho/bufferline.nvim
     {:opt true
      :event [:BufRead :BufWinEnter :BufNewFile]
      :requires :kyazdani42/nvim-web-devicons
      :config (fn [] (let [(ok? bl) (pcall #(require :bufferline))]
                       (when ok?
                         (bl.setup))))})
