(local {: use} (require :utils))

(use :Olical/conjure
     {:ft [:fennel :clojure :lisp :racket :scheme :rust :janet :lua :guile]
      :config (tset vim.g "conjure#extract#tree_sitter#enabled" true)})
