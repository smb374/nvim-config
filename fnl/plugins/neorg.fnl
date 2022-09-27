(local {: use} (require :utils))

(fn config []
  (let [(ok? {: setup}) (pcall #(require :neorg))]
    (when ok?
      (setup {:load {:core.defaults {}
                     :core.norg.dirman {:config {:workspaces {:graph-theory-notes "~/Notes/graph-theory-2022"}}}
                     :core.norg.concealer {}
                     :core.norg.completion {:config {:engine :nvim-cmp}}}}))))

(use :nvim-neorg/neorg
     {:tag :0.0.12
      :config config})
