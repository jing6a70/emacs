;; All js file are used the js2-mode
(use-package js2-mode
  :ensure t
  :config
  (setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist)))

(provide 'init-Languages)
