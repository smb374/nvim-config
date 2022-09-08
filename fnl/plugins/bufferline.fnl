(local {: use} (require :utils))

(fn config []
  (let [(ok? {: setup}) (pcall #(require :bufferline))]
    (when ok?
      (setup {:options {:offsets [{:filetype :NvimTree
                                   :text "File Explorer"
                                   :text_align :center
                                   :separator true}]}}))))

(use :akinsho/bufferline.nvim
     {:opt true
      :event [:BufRead :BufWinEnter :BufNewFile]
      :requires :kyazdani42/nvim-web-devicons
      :config config})
