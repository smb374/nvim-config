(local utils (require :utils))
(local use utils.use)
(local wk-register utils.wk-register)

(fn config []
  (let [(ok? nt) (pcall #(require :nvim-tree))]
    (when ok?
      (nt.setup {:view {:side :left :width 25 :hide_root_folder true :adaptive_size true}}
          :disable_netrw true
          :hijack_netrw true
          :hijack_cursor true
          :update_cwd true
          :update_focused_file {:enable true}
          :git {:enable false :ignore true}
          :hijack_directories {:enable true :auto_open true}
          :actions {:open_file {:resize_window true}}
          :renderer {:indent_markers {:enable false}}))))

(wk-register {:e ["<cmd>NvimTreeToggle<cr>" "Open Explorer"]})

(use :kyazdani42/nvim-tree.lua
     {:cmd :NvimTreeToggle
      :config config})
