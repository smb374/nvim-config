(local {: use : pack} (require :utils))

(fn config []
  (let [(ok? {: setup}) (pcall #(require :leap))]
    (setup {:max_aot_targets nil
            :case_sensitive false
            :character_classes [" \t\r\n"]
            :special_keys {:repeat_search :<enter>
                           :next_match    :<enter>
                           :prev_match    :<tab>
                           :next_group    :<space>
                           :prev_group    :<tab>}})))

(use :ggandor/leap.nvim
     {:requires [(pack :ggandor/leap-ast.nvim {:opt true})]
      :config config})
