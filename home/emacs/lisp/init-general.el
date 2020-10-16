(require 'general)

;; Setup general
(general-evil-setup)
(general-auto-unbind-keys)

;; Dired
(general-define-key
 :states '(normal visual)
 :keymaps 'dired-mode-map
 "h" 'dired-up-directory
 "l" 'dired-find-file
 "." 'dired-hide-dotfiles-mode)

;; Ivy
(general-define-key 
 :keymaps 'ivy-mode-map
 "C-h" 'ivy-backward-delete-char)

;; Sclang
(general-define-key
 :states '(normal visual)
 :keymaps 'sclang-mode-map
 "C-c C-c" 'sclang-eval-defun
 "C-c C-l" 'sclang-eval-line
 "C-c C-r" 'sclang-recompile
 "C-c C-p" 'sclang-beginning-of-defun
 "C-c C-n" 'sclang-end-of-defun)

(provide 'init-general)
