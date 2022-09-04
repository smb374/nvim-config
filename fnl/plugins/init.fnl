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
(require :plugins.nord)
(require :plugins.nvim-notify)
(require :plugins.nvim-tree)
(require :plugins.parinfer)
(require :plugins.telescope)
(require :plugins.treesitter)
(require :plugins.which-key)
;; language specific plugins
(require :plugins.langs.rust)

(packadd! packer.nvim)

(let [(ok? {: init : startup : util}) (pcall #(require :packer))]
  (when ok?
    (local packages
           (fn [use]
             (each [_ v (ipairs _G.pack)]
               (use v))))
    (init {:compile_path (.. (vim.fn.stdpath :config) "/lua/packer_compiled.lua")})
    (startup {1 packages
              :config {:display {:open_fn (fn []
                                            (let [{: float} util]
                                              (float {:border :single})))}}})))
