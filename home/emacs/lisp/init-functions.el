(defun my-org-insert-heading ()
  "Insert a new org heading, and also enter evil insertion mode."
  (interactive)
  (org-insert-heading-respect-content)
  (evil-insert nil))

(defun my-org-insert-subheading ()
  "Insert a new org heading, and also enter evil insertion mode."
  (interactive)
  (org-insert-heading-respect-content)
  (org-do-demote)
  (evil-insert nil))

(defun my-show-thumbnails ()
  (interactive)
  (let ((cmd "thumbnails")
	    (dir "."))
  (async-shell-command (concat cmd " " dir))))

(provide 'init-functions)
