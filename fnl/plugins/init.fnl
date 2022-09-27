(import-macros {: packadd!} :macros)

;; metas
(require :plugins.essentials)
(require :plugins.wip)
;; plugin-wise, alpha order
(require :plugins.autopairs)
(require :plugins.bufdelete)
(require :plugins.bufferline)
(require :plugins.cmp)
(require :plugins.comment)
(require :plugins.conjure)
(require :plugins.format)
(require :plugins.gitsigns)
(require :plugins.indent-blankline)
(require :plugins.leap)
(require :plugins.lsp)
(require :plugins.mason)
(require :plugins.neogit)
;; (require :plugins.neorg)
(require :plugins.nvim-notify)
(require :plugins.nvim-tree)
(require :plugins.parinfer)
(require :plugins.surround)
(require :plugins.telescope)
(require :plugins.treesitter)
(require :plugins.trouble)
(require :plugins.which-key)
;; colors, choose one
;(require :plugins.colors.nord)
;(require :plugins.colors.onenord)
;(require :plugins.colors.oxocarbon)
(require :plugins.colors.tokyonight)
;; language specific plugins
(require :plugins.langs.rust)

(packadd! packer.nvim)

(let [(ok? {: startup}) (pcall #(require :packer))]
  (when ok?
    (local packages
           (fn [use]
             (when (not= _G.pack nil)
               (each [_ v (ipairs _G.pack)]
                 (use v)))))
    (startup {1 packages
              :config {:display {:open_fn (fn [] ((. (require :packer.util) :float) {:border :single}))}}})))
