(local {: use} (require :utils))

(let [(ok? nvim) (pcall #(require :nvim))]
  (when ok?
    (nvim.create_autocmd [:BufWritePre] {:group (nvim.create_augroup :Formatting {})
                                         :pattern :*
                                         :callback (fn [] (vim.lsp.buf.formatting_sync))})))
