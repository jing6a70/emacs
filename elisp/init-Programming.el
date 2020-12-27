;;; init-Programming.el --- 代码补全与代码块

;;; Commentary 注解:
;;    <!-- 2019.06.16 -->: { 加载插件->company-mode, 为Emacs添加了代码补全的功能 }
;;    <!-- 2020.11.27 -->: { 加载插件->LSP, 为Emacs添加了对LSP(Language server protocol)代码模糊搜索的支持 }
;;    <!-- 2019.06.16 -->: { 加载插件->yasnippet 并添加Emacs对代码片断的支持 }

;;; Code:
;; 配置company-mode代码补全插件的参数, 与绑定快捷键
;; Settings for company
(use-package company
  :ensure t
  :diminish (company-mode " Com.")
  :defines (company-dabbrev-ignore-case company-dabbrev-downcase)
  :hook (after-init . global-company-mode)
  ;; 绑定快捷键并让Emacs支持`C-p` `C-n`快捷键来选择补全结果
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
		        company-minimum-prefix-length 1
		        company-show-numbers t
		        company-tooltip-limit 20
		        company-idle-delay 0
		        company-echo-delay 0
		        company-tooltip-offset-display 'scrollbar
		        company-begin-commands '(self-insert-command)))

(use-package company-quickhelp
  :ensure t
  :hook (prog-mode . company-quickhelp-mode)
  :init (setq company-quickhelp-delay 0.3))

;; Better sorting and filtering
(use-package company-prescient
  :ensure t
  :init (company-prescient-mode 1))



;;; 设置LSP(Language Server Protocol)
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook ((lsp-mode . lsp-enable-which-key-integration) ;; 添加需要支持的语言到LSP
	     (python-mode . lsp-deferred)                    ;; Add the programming language you use to LSP
         (c-mode . lsp-deferred)
         (go-mode . lsp-deferred)
         (java-mode . lsp-deferred)
         (js-mode . lsp-deferred)
         (web-mode . lsp-deferred)
         (vue-mode . lsp-deferred)
         (html-mode . lsp-deferred))
  :init (setq lsp-keep-workspace-alive nil ;; 自动关闭LSP服务器 [Auto kill LSP server]
              lsp-enable-indentation t
              lsp-enable-on-type-formatting t
              lsp-auto-guess-root nil
              lsp-enable-snippet t
              lsp-modeline-diagnostics-enable t
              lsp-idle-delay 0.500
              lsp-completion-provider :capf))


;; lsp补全显示数据的UI设置
(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :commands lsp-ui-mode
  :hook (lsp-mode . lsp-ui-mode)
  :init (setq lsp-ui-doc-enable t
              lsp-ui-doc-use-webkit nil
              lsp-ui-doc-delay .3
              lsp-ui-doc-include-signature t
              lsp-ui-doc-position 'bottom ;; top/bottom/at-point
              lsp-eldoc-enable-hover nil ;; 禁用迷你缓冲区中的eldoc显示器 Disable eldoc displays in minibuffer
              lsp-ui-sideline-enable t
              lsp-ui-sideline-show-hover t
              lsp-ui-sideline-show-code-actions t
              lsp-ui-sideline-show-diagnostics t
              lsp-ui-sideline-ignore-duplicate t
              lsp-headerline-breadcrumb-enable t)
  :config
  (setq lsp-ui-flycheck-enable nil)
  (treemacs-resize-icons 14))

;; 如果你使用的是helm插件 if you are helm user
;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)

;; 如果你使用的是ivy插件 if you are ivy user
(use-package lsp-ivy
  :ensure t
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list
  :init (treemacs-resize-icons 14))


;; 如果你想使用调试器, 可以选择
;; optionally if you want to use debugger
(use-package dap-mode
  :ensure t
  :diminish
  :hook ((lsp-mode . dap-mode)
        (dap-mode . dap-ui-mode)
	      (dap-mode . dap-tooltip-mode)
        (python-mode . (lambda() (require 'dap-python)))
        (go-mode . (lambda() (require 'dap-go)))
        (java-mode . (lambda() (require 'dap-java)))))

;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; 可选项: 如果你想哪个密钥集成
;; optional if you want which-key integration
(use-package which-key
  :ensure t
  :config
  (which-key-mode))


;; 配置yasnippet插件, 为Emacs提供代码片段支持
;; Configure the yasnippet plug-in to provide snippet support for Emacs
(use-package yasnippet
  :ensure t
  :defer t
  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
  :init
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (yas-global-mode t))


(provide 'init-Programming)
