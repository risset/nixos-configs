(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

(add-hook 'after-init-hook 'global-company-mode)

(add-to-list 'company-backends 'company-nixos-options)

(provide 'init-company)
