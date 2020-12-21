;; Settings for org mode and load config frome org files
(use-package org
  :ensure t
  ;; :init (setq org-startup-indented t)
  :config
  (setq org-startup-indented t
	    org-todo-keywords '((sequence "TODO" "DOING" "DONE"))
	    org-todo-keyword-faces '(("DOING" . "blue")))
  (setq org-src-fontify-natively t))

(use-package markdown-mode
  :ensure t)


(provide 'init-Documents)
