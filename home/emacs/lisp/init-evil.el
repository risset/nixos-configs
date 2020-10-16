(require 'evil)

;; https://github.com/emacs-evil/evil-collection/issues/60
(setq evil-want-keybinding nil)
(evil-mode t)

;; Evil collection - better evil lintegration with other emacs functionality
(setq evil-collection-setup-minibuffer t)
(setq evil-collection-company-use-tng nil)

(when (require 'evil-collection nil t)
  (evil-collection-init))

;; Surround plugin
(global-evil-surround-mode t)

(provide 'init-evil)
