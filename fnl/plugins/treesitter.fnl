(import-macros {: packadd!} :macros)
(local use (. (require :utils) :use))

(fn config []
  (let [(ok? tree-sitter) (pcall #(require :nvim-treesitter.configs))]
    (when ok?
      (packadd! nvim-ts-rainbow)
      (packadd! nvim-treesitter-textobjects)
      (tree-sitter.setup {:ensure_installed all
                          :sync_install true
                          :highlight {:enable true :use-language true}
                          :indent {:enable true}
                          :rainbow {:enable true :extended_mode true}
                          :incremental_selection {:enable true
                                                  :keymaps {:init_selection :gnn
                                                            :node_incremental :grn
                                                            :scope_incremental :grc
                                                            :node_decremental :grm}}
                          :textobjects {:select {:enable true}
                                        :lookahead true
                                        :keymaps {:af "@function.outer"
                                                  :if "@function.inner"
                                                  :ac "@class.outer"
                                                  :ic "@class.inner"}
                                        :move {:enable true
                                               :set_jumps true
                                               :goto_next_start {"]m" "@function.outer"
                                                                 "]]" "@class.outer"}
                                               :goto_next_end {"]M" "@function.outer"
                                                               "][" "@class.outer"}
                                               :goto_previous_start {"[m" "@function.outer"
                                                                     "[[" "@class.outer"}
                                               :goto_previous_end {"[M" "@function.outer"
                                                                   "[]" "@class.outer"}}}}))))

(fn setup []
  (let [(ok? nvim) (pcall #(require :nvim))]
    (when ok?
      (nvim.create_autocmd [:BufRead]
                           {:group (nvim.create_augroup :nvim-treesitter {})
                            :callback (fn []
                                        (when (fn []
                                                (local file (vim.fn.expand "%"))
                                                (and (and (not= file :Nvimtree_1)
                                                          (not= file "[packer]"))
                                                     (not= file "")))
                                          (nvim.del_augroup_by_name :nvim-treesitter)
                                          ((. (require :packer) :loader) :nvim-treesitter)))}))))

(use :nvim-treesitter/nvim-treesitter
     {:cmd [:TSInstall
            :TSBufEnable
            :TSBufDisable
            :TSEnable
            :TSDisable
            :TSModuleInfo]
      :run ":TSUpdate"
      :requires [{1 :nvim-treesitter/playground :cmd :TSPlayground}
                 {1 :p00f/nvim-ts-rainbow :opt true}
                 {1 :nvim-treesitter/nvim-treesitter-textobjects :opt true}]
      :config config
      :setup setup})
