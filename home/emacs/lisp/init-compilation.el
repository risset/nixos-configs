;; Make compilation window automatically disappear
(setq compilation-finish-functions
      (lambda (buf str)
	(if (null (string-match ".*exited abnormally.*" str))
	    ;;no errors, make the compilation window go away in a few seconds
	    (progn
	      (run-at-time
	       "1 sec" nil 'delete-windows-on
	       (get-buffer-create "*compilation*"))
	      (message "No Compilation Errors!")))))


;; Don't ask to save buffers
(setq compilation-ask-about-save nil)
(setq compilation-save-buffers-predicate '(lambda () nil))

(provide 'init-compilation)
