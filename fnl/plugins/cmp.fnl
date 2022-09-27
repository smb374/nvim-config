(local {: use : pack} (require :utils))

(set vim.opt.completeopt [:menu :menuone :noselect])

(fn config []
  (let  [(cok? cmp) (pcall #(require :cmp))
         (lok? luasnip) (pcall #(require :luasnip))]
        (when (and cok? lok?)
          (local icons {:Text ""
                        :Method ""
                        :Function ""
                        :Constructor "⌘"
                        :Field "ﰠ"
                        :Variable ""
                        :Class "ﴯ"
                        :Interface ""
                        :Module ""
                        :Unit ""
                        :Property "ﰠ"
                        :Value ""
                        :Enum ""
                        :Keyword ""
                        :Snippet ""
                        :Color ""
                        :File ""
                        :Reference ""
                        :Folder ""
                        :EnumMember ""
                        :Constant ""
                        :Struct "פּ"
                        :Event ""
                        :Operator ""
                        :TypeParameter ""})
          (cmp.setup {:experimental {:ghost_text true}
                      :window {:documentation {:border :solid} :completion {:border :solid}}
                      :preselect cmp.PreselectMode.None
                      :snippet {:expand (fn [args] (luasnip.lsp_expand args.body))}
                      :mapping {:<C-b> (cmp.mapping.scroll_docs -4)
                                :<C-f> (cmp.mapping.scroll_docs 4)
                                :<C-space> (cmp.mapping.complete)
                                :<C-e> (cmp.mapping.close)
                                :<Up> cmp.config.disable
                                :<Down> cmp.config.disable
                                :<Tab> (cmp.mapping
                                           (fn [fallback]
                                             (if (cmp.visible) (cmp.select_next_item)
                                               (luasnip.expand_or_jumpable) (luasnip.expand_or_jump)
                                               (fallback)))
                                           [:i :s])
                                :<S-Tab> (cmp.mapping
                                             (fn [fallback]
                                               (if (cmp.visible) (cmp.select_prev_item)
                                                 (luasnip.jumpable -1) (luasnip.jump -1)
                                                 (fallback)))
                                             [:i :s])
                                :<Space> (cmp.mapping.confirm {:select false})}
                      :sources [{:name :nvim_lsp}
                                {:name :luasnip}
                                {:name :conjure}
                                {:name :neorg}
                                {:name :buffer}
                                {:name :path}]
                      :formatting {:fields [:kind :abbr :menu]
                                   :format (fn [_ vim-item]
                                             (set vim-item.menu vim-item.kind)
                                             (set vim-item.kind (. icons vim-item.kind))
                                             vim-item)}})
          (cmp.setup.cmdline "/" {:mapping (cmp.mapping.preset.cmdline)
                                  :sources [{:name :buffer}]})
          (cmp.setup.cmdline ":" {:mapping (cmp.mapping.preset.cmdline)
                                  :sources [{:name :path}
                                            {:name :cmdline}]})
          (let [{: lazy_load} (require :luasnip.loaders.from_vscode)] (lazy_load)))))

(use :hrsh7th/nvim-cmp
     {:wants :LuaSnip
      :event [:InsertEnter :CmdLineEnter]
      :config config
      :requires [(pack :hrsh7th/cmp-path {:after :nvim-cmp})
                 (pack :hrsh7th/cmp-buffer {:after :nvim-cmp})
                 (pack :hrsh7th/cmp-cmdline {:after :nvim-cmp})
                 (pack :hrsh7th/cmp-nvim-lsp {:after :nvim-cmp})
                 (pack :PaterJason/cmp-conjure {:after :conjure})
                 (pack :saadparwaiz1/cmp_luasnip {:after :nvim-cmp})
                 (pack :L3MON4D3/LuaSnip {:event [:InsertEnter :CmdLineEnter]
                                          :wants :friendly-snippets
                                          :requires [(pack :rafamadriz/friendly-snippets)]})]})
