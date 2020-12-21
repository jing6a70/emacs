;; Settings for company
(use-package company
  :diminish (company-mode " Com.")
  :defines (company-dabbrev-ignore-case company-dabbrev-downcase)
  :hook (after-init . global-company-mode)
  :bind
  (:map company-mode-map ("M-/" . 'company-complete))
  (:map company-active-map ("M-/" . 'company-other-backend))
  (:map company-active-map ("C-n" . 'company-select-next))
  (:map company-active-map ("C-p" . 'company-select-previous))
  :config (setq company-dabbrev-code-everywhere t
		        company-dabbrev-code-modes t
		        company-dabbrev-code-other-buffers 'all
		        company-dabbrev-downcase nil
		        company-dabbrev-ignore-case t
		        company-dabbrev-other-buffers 'all
		        company-require-match nil
		        company-minimum-prefix-length 2
		        company-show-numbers t
		        company-tooltip-limit 20
		        company-idle-delay 0
		        company-echo-delay 0
		        company-tooltip-offset-display 'scrollbar
		        company-begin-commands '(self-insert-command)))

(use-package company-quickhelp
  :hook (prog-mode . company-quickhelp-mode)
  :init (setq company-quickhelp-delay 0.3))

;; Better sorting and filtering
(use-package company-prescient
  :init (company-prescient-mode 1))



;;; Setting for LSP
(use-package lsp-mode
  :hook (c-mode . lsp-deferred)
  :commands (lsp lsp-deferred))

(use-package lsp-ui :commands lsp-ui-mode)

;; if you are helm user
;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode
  :ensure t)

;; (use-package dap-LANGUAGE) to load the dap adapter for your language
;; optional if you want which-key integration
(use-package which-key
  :ensure t
  :config
  (which-key-mode))


;; Setting for yasnippet
(use-package yasnippet
  :ensure t
  :defer t
  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
  :init
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (yas-global-mode t))


(provide 'init-Programming)
