(local {: use} (require :utils))

(fn config []
  (let [(ok? {: setup}) (pcall #(require :nvim-surround))]
    (when ok?
      (setup {:keymaps {:insert :<C-g>s
                        :insert_line :<C-g>S
                        :normal :ys
                        :normal_cur :yss
                        :normal_line :yS
                        :normal_cur_line :ySS
                        :visual :S
                        :visual_line :sS
                        :delete :ds
                        :change :cs}}))))

(use :kylechui/nvim-surround
     {:tag :*
      :event :BufEnter
      :config config})
