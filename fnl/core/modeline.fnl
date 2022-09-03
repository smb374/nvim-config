(local opt vim.opt)
(local nvim (require :nvim))
(global Statusline {})

(local cache {:bufnrs {}})
(local modes {:n :RW
              :no :RO
              :v "**"
              :V "**"
              "\022" "**"
              :s :S
              :S :SL
              "\019" :SB
              :i :IN
              :ic :IC
              :R :RA
              :Rv :RV
              :c :VIEX
              :cv :VIEX
              :ce :EX
              :r :r
              :rm :r
              :r? :r
              :! "!"
              :t :})

(set opt.laststatus 3)
(set opt.cmdheight 1)

(fn get-filetype []
  (if (not= vim.bo.filetype "")
      (.. "%#NormalNC# " vim.bo.filetype)
      ""))

(fn get-bufnr []
  (.. "%#Comment#" (nvim.get_current_buf)))

(fn color []
  (let [mode (. (nvim.get_mode) :mode)]
    (var mode-color "%#Normal#")
    (if (= mode :n) (set mode-color "%#NormalMode#")
        (or (= mode :i) (= mode :ic)) (set mode-color "%#InsertMode#")
        (or (or (= mode :v) (= mode :V)) (= mode "\022"))
        (set mode-color "%#VisualMode#") (= mode :R)
        (set mode-color "%#ReplaceMode#") (= mode :c)
        (set mode-color "%#CommandMode#") (= mode :t)
        (set mode-color "%#TerminalMode#"))
    mode-color))

(fn get-fileinfo []
  (var filename (or (and (= (vim.fn.expand "%") "") " scratch ")
                    (vim.fn.expand "%:t")))
  (when (not= filename " scratch ")
        (set filename (.. " " filename " ")))
  (.. "%#Normal#" filename))

(fn get-git-status []
  (let [branch (or vim.b.gitsigns_status_dict
                   {:head ""})
        is-head-empty (not= branch.head "")]
    (or (and is-head-empty
             (.. "%#NormalNC#" (string.format "(λ • #%s) "
                                             (or branch.head ""))))
        "")))

(fn get-diagnostic []
  (fn get-severity [s] (length (vim.diagnostic.get 0 {:severity s})))
  (local result {:errors (get-severity vim.diagnostic.severity.ERROR)
                 :warnings (get-severity vim.diagnostic.severity.WARN)
                 :info (get-severity vim.diagnostic.severity.INFO)
                 :hints (get-severity vim.diagnostic.severity.HINT)})
  (string.format "%%#StatusLineDiagnosticWarn# %s %%#StatusLineDiagnosticError#%s "
                (or (. result :warnings) 0) (or (. result :errors) 0)))

(fn get-searchcount []
  (local (ok count) (pcall vim.fn.searchcount {:recompute true}))
  (when (or (or (not ok) (= count.current nil)) (= count.total 0))
    (lua "return \"\""))
  (when (= count.incomplete 1)
    (lua "return \"?/?\""))
  (local too-many (: ">%d" :format count.maxcount))
  (local total (or (and (> count.total count.maxcount) too-many)
                   count.total))
  (.. "%#Normal#" (: " %s matches " :format total)))

(set Statusline.statusline (fn []
                             (table.concat [(color)
                                            (: (string.format " %s "
                                                              (. modes
                                                                 (. (vim.api.nvim_get_mode)
                                                                    :mode)))
                                               :upper)
                                            (get-fileinfo)
                                            (get-git-status)
                                            (get-bufnr)
                                            "%= "
                                            (get-diagnostic)
                                            (get-filetype)
                                            "%#Normal# %l:%c "])))

(set opt.statusline "%!v:lua.Statusline.statusline()")

;; (set Statusline.winbar (fn []
;;                         (table.concat ["%#Comment#"
;;                                        " %f "])))

;; (set opt.winbar "%!v:lua.Statusline.winbar()")
