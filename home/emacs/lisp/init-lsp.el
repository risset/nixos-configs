;; Language hooks
(add-hook 'c-mode-hook #'lsp)
(add-hook 'c++-mode-hook #'lsp)
(add-hook 'python-mode-hook #'lsp)
(add-hook 'go-mode-hook #'lsp)

;; Use flycheck
(setq lsp-prefer-flymake nil)

;; Show xrefs in ivy
(setq xref-show-definitions-function #'ivy-xref-show-defs)
(setq xref-show-xrefs-function #'ivy-xref-show-xrefs)

;; Use company
(push 'company-lsp company-backends)
(setq company-transformers nil
      company-lsp-async t
      company-lsp-enable-snippet t
      company-lsp-cache-candidates t)

;; Clients
(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection "pyls")
		  :major-modes '(python-mode)
		  :server-id 'pyls))

;; Optimisation
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

(provide 'init-lsp)
