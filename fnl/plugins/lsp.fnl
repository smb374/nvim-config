(local {: use} (require :utils))

;;; Improve UI
(set vim.lsp.handlers.textDocument/signatureHelp
     (vim.lsp.with vim.lsp.handlers.signature_help {:border :solid}))
(set vim.lsp.handlers.textDocument/hover
     (vim.lsp.with vim.lsp.handlers.hover {:border :solid}))

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
                  :t [goto-type-definition! "Goto Type Definition"]}})

(fn on_attach [client bufnr]
  (let [nvim (require :nvim)]
    (fn buf_set_option [...] (nvim.buf_set_option bufnr ...))
    (buf_set_option :omnifunc "v:lua.vim.lsp.omnifunc")))

;; What should the lsp be demanded of?
(local capabilities
  (let [c (vim.lsp.protocol.make_client_capabilities)
        clsp (require :cmp_nvim_lsp)]
    (set c.textDocument.completion.completionItem
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
    (clsp.update_capabilities c)
    c))

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
             ((. (. lsp server) :setup) {:on_attach on_attach
                                         :capabilities capabilities
                                         :flags {:debounce_text_changes 150}}))}))))

(fn nlsp-config []
  (let [(ok? {: setup}) (pcall #(require :nlspsettings))]
    (setup {:config_home (.. (vim.fn.stdpath :config) "/nlsp-settings")
            :local_settings_dir ".nlsp-settings"
            :local_settings_root_markers_fallback [".git"]
            :append_default_schemas true
            :loader :json})))

(use :neovim/nvim-lspconfig
     {:after :mason-lspconfig.nvim
      :config config})

(use :j-hui/fidget.nvim
     {:after :nvim-lspconfig
      :config (fn [] (let [(ok? {: setup}) (pcall #(require :fidget))]
                       (when ok?
                         (setup))))})

(use :tamago324/nlsp-settings.nvim
     {:config nlsp-config})

;; (use :jose-elias-alvarez/null-ls.nvim
;;      {:after :nvim-lspconfig
;;       :config (fn []
;;                 (let [(ok? {: setup}) (pcall #(require :null-ls))]
;;                   (when ok?
;;                     (setup))))})
