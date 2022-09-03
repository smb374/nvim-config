(import-macros {: packadd!} :macros)
(local {: use} (require :utils))

(fn config []
  (let [(ok? {: setup : load_extension}) (pcall #(require :telescope))]
    (when ok?
      (setup {:extensions {:fzf {:fuzzy true
                                 :override_generic_sorter true
                                 :override_file_sorter true
                                 :case_mode :smart_case}}})
      (packadd! telescope-fzf-native.nvim)
      (packadd! telescope-ui-select.nvim)
      (packadd! telescope-file-browser.nvim)
      (load_extension :fzf)
      (load_extension :ui-select)
      (load_extension :file_browser)
      (when (= (vim.fn.executable :uebezug) 1)
        (packadd! telescope-media-files.nvim)
        (load_extension :media_files)))))

(use :nvim-telescope/telescope.nvim
     {:cmd :Telescope
      :requires [{1 :nvim-telescope/telescope-ui-select.nvim :opt true}
                 {1 :nvim-telescope/telescope-file-browser.nvim :opt true}
                 {1 :nvim-telescope/telescope-media-files.nvim :opt true}
                 {1 :nvim-telescope/telescope-fzf-native.nvim :opt true :run "make"}]
      :config config})
