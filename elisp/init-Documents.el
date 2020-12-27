;;; init-Documents.el --- 加载模式扩展插件

;;; Commentary 注解:
;;    <!-- 2019.01.03 -->: { 加载org-mode扩展插件 }
;;    <!-- 2019.01.03 -->: { 加载markdown-mode扩展插件 }

;;; Code:
;; 当打开.org文件则自动启用org-mode模式
;; Settings for org mode and load config frome org files
(use-package org
  :ensure t
  :config
  (setq org-startup-indented t
	    org-todo-keywords '((sequence "TODO" "DOING" "DONE"))
	    org-todo-keyword-faces '(("DOING" . "blue")))
  (setq org-src-fontify-natively t))

;; 当打开.md文件自动启用markdown模式
;; Settings for markdown mode and load config frome md files
(use-package markdown-mode
  :ensure t)

(provide 'init-Documents)
