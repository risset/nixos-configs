;; Initial setup happens here. Customisation is done in org-mode via "./settings.org"
;; Package repos
(require 'package)

(setq package-archives '(("gnu" . "https://mirrors.163.com/elpa/gnu/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")))


;; Initialise use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Configure use-package
(setq use-package-always-ensure t)

;; Custom file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
  (when (file-exists-p custom-file)
    (load custom-file))

(eval-when-compile
  (require 'use-package))

;; Common Lisp extensions
(require 'cl-lib)

;; Load config
(require 'org)
(setq vc-follow-symlinks t)
(org-babel-load-file
  (expand-file-name "settings.org" user-emacs-directory))
