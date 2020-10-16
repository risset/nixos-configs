(require 'general)
(require 'hydra)

;; Leader key
(general-define-key
 :states '(normal visual)
 :keymaps '(override Calendar)
 "SPC"
 'hydra-main/body)

;; Main
(defhydra hydra-main (:color blue)
  ("SPC" 
   counsel-M-x
   "λ")
  
  ("b"
   hydra-buffer/body
   "buffer")

  ("d"
   hydra-debug/body
   "debug")
  
  ("e"
   hydra-edit/body
   "edit")
  
  ("f"
   hydra-find/body
   "find")
  
  ("g"
   hydra-git/body
   "git")
  
  ("h"
   hydra-help/body
   "help")

  ("k"
   hydra-bookmarks/body
   "bookmarks")
  
  ("l"
   hydra-lsp/body
   "lsp")

  ("m"
   major-mode-hydra
   "major mode")

  ("p"
   hydra-projectile/body
   "projectile")
  
  ("s"
   hydra-shell/body
   "shell"))

;; Buffer
(defhydra hydra-buffer (:color teal)
  ("s"
   (save-buffer)
   "save")
  
  ("x"
   (kill-buffer)
   "kill")
  
  ("b"
   (counsel-switch-buffer)
   "find")
  
  ("r"
   (lambda ()
     (interactive)
     (load-file user-init-file))
   "reload init"))

;; Debug
(defhydra hydra-debug (:color teal)
  ("t"
   (dap-breakpoint-toggle)
   "toggle breakpoint")

  ("d"
   (dap-debug-last)
   "debug last")

  ("D"
   (dap-debug)
   "debug")

  ("n"
   (dap-next)
   "next")

  ("i"
   (dap-step-in)
   "step in")

  ("o"
   (dap-step-out)
   "step out")

  ("l"
   (dap-ui-breakpoints-list)
   "list breakpoints"))

;; Edit
(defhydra hydra-edit (:color teal)
  ("i"
   iedit-mode
   "iedit")
  
  ("p"
   smartparens-mode
   "toggle smartparens")

  ("q"
   query-replace
   "query replace")

  ("Q"
   query-replace-egexp
   "equery replace (regex)"))

;; Find
(defhydra hydra-find (:color teal)
  ("g"
   counsel-rg
   "rg")
  
  ("d"
   (lambda () (interactive) (dired-at-point default-directory))
   "dired")
  
  ("f"
   counsel-find-file
   "find file")
  
  ("l"
   counsel-locate
   "locate")

  ("t"
   counsel-tramp
   "tramp")

  ("T"
   counsel-tramp-quit
   "tramp (quit)")

  ("s"
   sudo-edit
   "sudo")

  ("z"
   counsel-fzf
   "fzf")

  ("/"
   swiper
   "swiper"))

;; Git
(defhydra hydra-git (:color teal)
  ("s"
   magit-status
   "status")
  
  ("l"
   magit-log
   "log")
  
  ("d"
   magit-diff
   "diff")

  ("i"
   magit-init
   "init")

  ("c"
   magit-commit
   "commit")
  
  ("C"
   magit-clone
   "clone")
  
  ("g"
   magit-checkout
   "checkout")
  
  ("p"
   magit-push-to-remote
   "push"))

;; Help
(defhydra hydra-help (:color teal)
  ("f"
   counsel-describe-function
   "describe function")
  
  ("v"
   counsel-describe-variable
   "describe variable")
  
  ("k"
   describe-key
   "describe key")
  
  ("m"
   describe-mode
   "describe mode"))

;; Bookmarks
(defhydra hydra-bookmarks (:color teal)
  ("j"
   bookmark-jump
   "jump to bookmark")

  ("d"
   bookmark-delete
   "delete bookmark")

  ("s"
   bookmark-set
   "set bookmark"))

;; LSP
(defhydra hydra-lsp (:color teal)
  ("d"
   lsp-find-definition
   "find definition")

  ("D"
   lsp-describe-session
   "describe session")

  ("r"
   lsp-find-references
   "find references")

  ("R"
   lsp-rename
   "rename symbol"))

;; Projectile
(defhydra hydra-projectile (:color teal)
  ("a"
   projectile-add-known-project
   "add project")
  
  ("b"
   counsel-projectile-switch-to-buffer
   "find buffer")
  
  ("c"
   projectile-compile-project
   "compile")
  
  ("d"
   counsel-projectile-find-dir
   "find dir")
  
  ("f"
   counsel-projectile-find-file
   "find file")
  
  ("g"
   counsel-projectile-rg
   "rg")
  
  ("s"
   counsel-projectile-switch-project
   "switch project")

  ("!"
   projectile-run-async-shell-command-in-root
   "shell command"))

;; Shell
(defhydra hydra-shell (:color teal)
  ("!"
   async-shell-command
   "shell command")
  
  ("t"
   my-show-thumbnails
   "thumbnails"))

;; Major Modes
;; Org
(major-mode-hydra-define org-mode nil
  ("Headings"
   (("h"
     my-org-insert-heading
     "insert heading")
    
    ("s"
     my-org-insert-subheading
     "insert subheading")

    ("n"
     org-narrow-to-subtree
     "narrow to subtree")

    ("w"
     widen
     "widen buffer"))

   "Links"
   (("o"
     org-open-at-point
     "open")

    ("l"
     org-toggle-link-display
     "toggle link display")

    ("S"
     org-store-link
     "store link under cursor")

    ("L"
     org-insert-last-stored-link
     "insert last stored link"))
   
   "Study"
   (("a"
     anki-editor-push-notes
     "push cards to anki"))
   
   "Lists and Tables"
   (("t"
     org-toggle-checkbox
     "toggle checkbox")

    ("T"
     org-table-create
     "create table")
    
    ("u" (lambda ()
	   (interactive)
	   (mark-whole-buffer)
	   (org-update-checkbox-count))
     "update checkbox counts"))))

;; Python
(major-mode-hydra-define python-mode nil
  ("Pipenv"
   (("p"
     (pipenv-python "3")
     "create environment")

    ("i"
     pipenv-install
     "install package"))

   "Shell"
   (("x"
     run-python
     "run python"))))

;; Lisp
(major-mode-hydra-define lisp-mode nil
  ("Eval"
   (("b"
     slime-eval-buffer
     "eval buffer")
    
    ("e"
     slime-eval-last-expression
     "eval last expression")

    ("r"
     slime-eval-region
     "eval region"))))

;; Dired
(major-mode-hydra-define dired-mode nil
  ("Files"
   (("f"
     dired-create-empty-file
     "create empty file"))))

;; Slime REPL
(major-mode-hydra-define slime-repl-mode nil
  ("SLIME REPL"
   (("c"
     slime-repl-clear-buffer
     "clear buffer"))))

(provide 'init-hydra)
