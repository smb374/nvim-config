(import-macros {: packadd!} :macros)

;; metas
(require :plugins.essentials)
(require :plugins.wip)
;; plugin-wise, alpha order
(require :plugins.bufferline)
(require :plugins.gitsigns)
(require :plugins.nord)
(require :plugins.nvim-notify)
(require :plugins.nvim-tree)
(require :plugins.telescope)
(require :plugins.treesitter)
(require :plugins.which-key)

(packadd! packer.nvim)

(let [(ok? packer) (pcall #(require :packer))]
  (when ok?
    (local packages
           (fn [use]
             (each [_ v (ipairs _G.pack)]
               (use v))))
    (packer.startup {1 packages
                     :config {:display {:open_fn (fn []
                                                   (let [util (require :packer.util)]
                                                     (util.float {:border :single})))}}})))
