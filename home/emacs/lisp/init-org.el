(require 'org)
(require 'org-tempo)

;; Indentation
(org-indent-mode -1)
(setq org-adapt-indentation nil)

;; Pretty Entities
(setq org-pretty-entities nil)

;; Autofill
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; Hide Emphasis Marks
(setq org-hide-emphasis-markers t)

;; Heading Colours
(custom-theme-set-faces 'user)

;; Hide Header Ellipse
(setq org-ellipsis " ")

;; Foldable Plain Lists
(setq org-cycle-include-plain-lists nil)

;; Inline Images 
(setq org-image-actual-width nil)
(setq org-startup-with-inline-images t)

;; Agenda
(setq org-agenda-files '("~/org/agenda"))
(setq org-agenda-sticky t)

;; Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((lisp . t) 
   (python . t)
   (C . t)
   (go . t)
   (shell . t)
   (scheme . t)
   (haskell . t)))

(setq org-confirm-babel-evaluate nil)
(setq org-src-preserve-indentation t)
(setq org-src-window-setup 'other-window)

;; Open org windows in new frames.
(set 'org-agenda-window-setup 'other-frame)
(set 'org-src-window-setup 'other-frame)

;; Evil-org
(add-hook 'org-mode-hook 'evil-org-mode)

;; Date format
(setq-default org-display-custom-times t)
(setq org-time-stamp-custom-formats '("<%d-%m-%y>" . "[%d-%m-%y %H:%M]"))

;; Anki-editor
(setq anki-editor-create-decks t
      anki-editor-org-tags-as-anki-tags t)

(provide 'init-org)
