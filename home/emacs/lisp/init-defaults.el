;; Backup and autosave
(auto-save-visited-mode 1)
(setq auto-save-visited-interval 30)
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Fix PATH
(exec-path-from-shell-initialize)

;; Indentation
(setq indent-tabs-mode t)
(setq-default indent-tabs-mode t)
(setq default-tab-width 4)
(setq tab-width 4)
(setq c-basic-indent 4)
(setq c-basic-offset 4)

;; Default browser
(setq browse-url-browser-function 'browse-url-firefox)

;; Fix TRAMP
(setq tramp-default-method "ssh") 
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

;; Help windows
(add-to-list 'display-buffer-alist
             '("*Help*" display-buffer-same-window))

(provide 'init-defaults)
