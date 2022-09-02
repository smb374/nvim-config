(local {: use} (require :utils))

;;; Improve UI
(set vim.lsp.handlers.textDocument/signatureHelp
     (vim.lsp.with vim.lsp.handlers.signature_help {:border :solid}))
(set vim.lsp.handlers.textDocument/hover
     (vim.lsp.with vim.lsp.handlers.hover {:border :solid}))

(fn on_attach [client bufnr]
  (local {: wk-register} (require :utils))
  (local {:hover open-doc-float!
            :declaration goto-declaration!
            :definition goto-definition!
            :type_definition goto-type-definition!
            :code_action open-code-action-float!
            :rename rename!} vim.lsp.buf)
  (wk-register {:k [open-doc-float! "Show Document"]
                :l {:name :LSP
                    :a [open-code-action-float! "Show Code Actions"]
                    :r [rename! "Rename"]
                    :d [goto-definition! "Goto Definition"]
                    :D [goto-declaration! "Goto Declaration"]
                    :t [goto-type-definition! "Goto Type Definition"]}}
               {:buffer bufnr
                :prefix :<leader>
                :mode :n}))

;; What should the lsp be demanded of?
(local capabilities (vim.lsp.protocol.make_client_capabilities))
(set capabilities.textDocument.completion.completionItem
     {:documentationFormat [:markdown :plaintext]
      :snippetSupport true
      :preselectSupport true
      :insertReplaceSupport true
      :labelDetailsSupport true
      :deprecatedSupport true
      :commitCharactersSupport true
      :tagSupport {:valueSet {1 1}}
      :resolveSupport {:properties [:documentation
                                    :detail
                                    :additionalTextEdits]}})

(fn handler [server]
  (let [(ok? lsp) (pcall #(require :lspconfig))]
    (when ok?
      ((. (. lsp server) :setup) {: on_attach
                                  : capabilities
                                  :flags {:debounce_text_changes 150}}))))

(fn config []
  (let [(mok? mlsp) (pcall #(require :mason-lspconfig))
        (lok? lsp) (pcall #(require :lspconfig))]
    (when (and lok? mok?)
      (mlsp.setup_handlers 
        {1 (fn [server] 
             ((. (. lsp server) :setup) {: on_attach
                                         : capabilities
                                         :flags {:debounce_text_changes 150}}))}))))

(use :neovim/nvim-lspconfig 
     {:after :mason-lspconfig.nvim
      :config config})

(use :j-hui/fidget.nvim
     {:after :nvim-lspconfig
      :config (fn [] (let [(ok? {: setup}) (pcall #(require :fidget))]
                       (when ok?
                         (setup))))})

