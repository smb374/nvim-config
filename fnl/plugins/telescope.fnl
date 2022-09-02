(import-macros {: packadd!} :macros)
(local utils (require :utils))
(local use utils.use)
(local wk-register utils.wk-register)

(fn config []
  (let [(ok? telescope) (pcall #(require :telescope))]
    (when ok?
      (telescope.setup {:extensions {:fzf {:fuzzy true
                                           :override_generic_sorter true
                                           :override_file_sorter true
                                           :case_mode :smart_case}}})
      (packadd! telescope-fzf-native.nvim)
      (packadd! telescope-ui-select.nvim)
      (packadd! telescope-file-browser.nvim)
      (telescope.load_extension :fzf)
      (telescope.load_extension :ui-select)
      (telescope.load_extension :file_browser)
      (when (= (vim.fn.executable :uebezug) 1)
        (packadd! telescope-media-files.nvim)
        (telescope.load_extension :media_files)))))

(wk-register {:f {:name :Telescope
                  :f ["<cmd>Telescope find_files hidden=true<cr>" "Find File"]
                  :- ["<cmd>Telescope file_browser<cr>" "File Browser"]
                  :g ["<cmd>Telescope live_grep<cr>" "Live grep"]
                  :b ["<cmd>Telescope buffers<cr>" "Find Buffer"]
                  :h ["<cmd>Telescope help_tags<cr>" "Find Help Tags"]
                  :k ["<cmd>Telescope keymaps<cr>" "Find Keymaps"]
                  :m ["<cmd>Telescope marks<cr>" "Find marks"]
                  :t ["<cmd>Telescope filetypes<cr>" "Find Filetypes"]
                  :c ["<cmd>Telescope commands<cr>" "Find Commands"]
                  :C ["<cmd>Telescope command_history<cr>" "Find Command History"]
                  :q ["<cmd>Telescope quickfix<cr>" "Find Quickfix"]
                  :l {:name :LSP
                      :a ["<cmd>Telescope lsp_code_actions<cr>" "Find Code Actions"]
                      :i ["<cmd>Telescope lsp_implementations<cr>" "Find Implementations"]
                      :r ["<cmd>Telescope lsp_references<cr>" "Find References"]
                      :s ["<cmd>Telescope lsp_document_symbols<cr>" "Find Document Symblos"]
                      :w ["<cmd>Telescope lsp_workspace_symbols<cr>" "Find Workspace Symbols"]}}})

(use :nvim-telescope/telescope.nvim
     {:cmd :Telescope
      :requires [{1 :nvim-telescope/telescope-ui-select.nvim :opt true}
                 {1 :nvim-telescope/telescope-file-browser.nvim :opt true}
                 {1 :nvim-telescope/telescope-media-files.nvim :opt true}
                 {1 :nvim-telescope/telescope-fzf-native.nvim :opt true :run "make"}]
      :config config})
