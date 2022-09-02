(import-macros {: packadd!} :macros)

;; metas
(require :plugins.essentials)
(require :plugins.wip)
;; plugin-wise, alpha order
(require :plugins.autopairs)
(require :plugins.bufdelete)
(require :plugins.bufferline)
(require :plugins.gitsigns)
(require :plugins.indent-blankline)
(require :plugins.lsp)
(require :plugins.mason)
(require :plugins.nord)
(require :plugins.nvim-notify)
(require :plugins.nvim-tree)
(require :plugins.parinfer)
(require :plugins.telescope)
(require :plugins.treesitter)
(require :plugins.which-key)

(packadd! packer.nvim)

(let [(ok? {: startup}) (pcall #(require :packer))]
  (when ok?
    (local packages
           (fn [use]
             (each [_ v (ipairs _G.pack)]
               (use v))))
    (startup {1 packages
              :config {:display {:open_fn (fn []
                                            (let [util (require :packer.util)]
                                              (util.float {:border :single})))}}})))
