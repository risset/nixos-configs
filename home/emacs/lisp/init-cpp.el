(add-hook 'c-mode 'c++-mode) (lambda () (require 'ccls) (lsp))

;; Ccls
(setq ccls-sem-highlight-method nil)
(setq ccls-executable "/nix/store/cwwp09a57k3v76jbvq4kq7fqil09qhv9-ccls-0.20190823.6/bin/ccls")

;; Format on save
(add-hook 'before-save-hook (lambda () (clang-format-buffer)))

(provide 'init-cpp)
