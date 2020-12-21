;; Disables the generation of backup files
(setq make-backup-files nil)

;; Enable line numbers mode.
(global-display-line-numbers-mode t)

;; Bracket completion
(electric-pair-mode t)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)



;; set appearance of a tab that is represented by 4 spaces
(setq-default indent-tabs-mode nil) ;; Change tab key to insert space
(setq c-basic-offset 4)             ;; C/C++ indent space of 4
(setq c-default-style "linux")      ;; set style to "linux"
(setq-default tab-width 4)

(use-package hungry-delete
  :ensure t
  :config
    (global-hungry-delete-mode))


(provide 'init-Editing)
