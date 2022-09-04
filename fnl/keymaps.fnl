(import-macros {: reg!} :macros)
(local map vim.keymap.set)

(map :n :<esc> :<esc><cmd>noh<cr>)
(map :n :<c-m-left> :<cmd>BufferLineCyclePrev<cr>)
(map :n :<c-m-right> :<cmd>BufferLineCycleNext<cr>)
(map :n ";" ":")

;; Top level
(reg! {:<up> [:<c-w>k "Goto Window Up"]
       :<down> [:<c-w>j "Goto Window Down"]
       :<left> [:<c-w>h "Goto Window Left"]
       :<right> [:<c-w>l "Goto Window Right"]
       :e [:<cmd>NvimTreeToggle<cr> "Open Explorer"]}
      [n] :<leader>)

;; Leap
(reg! {:s ["<Plug>(leap-forward)" "Leap Forward"]
       :S ["<Plug>(leap-backward)" "Leap Backward"]
       :z ["<Plug>(leap-cross-window)" "Leap Across Window"]}
      [nx] :g)

;; Buffer
(reg! {:b {:name :buffer
           :d ["<cmd>Bdelete<cr>" "Close Buffer"]}}
      [n] :<leader>)

;; Git
(reg! {:g {:name :Git
           :g [:<cmd>Neogit<cr> "Open Neogit"]}}
      [n] :<leader>)

;; Telescope
(reg! {:f {:name :Telescope
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
               :w ["<cmd>Telescope lsp_workspace_symbols<cr>" "Find Workspace Symbols"]}}}
      [n] :<leader>)

