(require 'nlinum)

;; Font
(set-face-attribute 'default nil
                    :family "FiraCode Nerd Font Mono"
                    :height 100
                    :weight 'normal
                    :width 'normal)

;; Theme
(load-theme 'monokai t)

;; Disable bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Line numbers
(global-nlinum-mode)
(setq nlinum-format "%d ")

;; Delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Modeline
(setq doom-modeline-icon t) 
(setq doom-modeline-buffer-file-name-style 'file-name) ; TRAMP fix
(if (display-graphic-p)
  (doom-modeline-mode 1))

(provide 'init-appearance)
