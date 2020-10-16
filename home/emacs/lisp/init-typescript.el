(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook (lambda()
				  (interactive)
				  (tide-setup)
				  (flycheck-mode +1)
				  (eldoc-mode +1)
				  (tide-hl-identifier-mode +1)))

(provide 'init-typescript)
