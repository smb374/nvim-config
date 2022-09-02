(lambda packadd! [package]
  ;; (assert-compile (sym? package) "expected symbol for package" package)
  (let [p (tostring package)]
    `(vim.cmd (.. "packadd " ,p))))

{: packadd!}
