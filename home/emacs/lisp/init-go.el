(defun lsp-go-save-hooks ()
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t))
    
(add-hook 'go-mode-hook #'lsp-go-save-hooks)

(add-to-list 'projectile-globally-ignored-files "*.sum")
(add-to-list 'projectile-globally-ignored-files "*.mod")

(provide 'init-go)
