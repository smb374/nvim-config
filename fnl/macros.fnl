(macro expr->str [expr]
  `(macrodebug ,expr nil))

(fn nil? [x]
  (= nil x))

(fn str? [x]
  (= :string (type x)))

(fn num? [x]
  (= :number (type x)))

(fn bool? [x]
  (= :boolean (type x)))

(fn fn? [x]
  (= :function (type x)))

(fn tbl? [x]
  (= :table (type x)))

(fn ->str [x]
  (tostring x))

(lambda packadd! [package]
  (assert-compile (sym? package) "expected symbol for package" package)
  (let [p (tostring package)]
    `(vim.cmd (.. "packadd " ,p))))

(lambda reg! [keys [modes] ?prefix ?buffer]
  (assert-compile (tbl? keys) "expect a table for keys " keys)
  (assert-compile (sym? modes) "expect symbol for mode " modes)
  (assert-compile (or (nil? ?prefix) (str? ?prefix)) "expect string for prefix " ?prefix)
  (assert-compile (or (nil? ?buffer) (num? ?buffer)) "expect number for buffer " ?buffer)
  (let [prefix (or ?prefix "")
        modes (icollect [char (string.gmatch (->str modes) ".")] char)]
       `(let [wk# (require :which-key)]
          (each [_# mode# (ipairs ,modes)]
            ((. wk# :register) ,keys {:prefix ,prefix :mode mode# :buffer ,?buffer :silent true :noremap true :nowait false})))))

{: packadd! : reg!}
