(require 'flycheck)

(global-flycheck-mode)

(setq-default flycheck-disabled-checkers
	      '(emacs-lisp-checkdoc c/c++-clang c/c++-cppcheck c/c++-gcc))

(setq flycheck-check-syntax-automatically '(save mode-enabled))
(setq flycheck-display-errors-delay .3)

(provide 'init-flycheck)
