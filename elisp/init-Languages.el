;;; init-Languages.el --- 添加对各类语言的支持

;;; Commentary 注解:
;;    <!-- 2018.06.08 -->: { 加载插件->js2-mode, 添加对js语言支持 }

;;; Code:
;; 所有js文件使用js2模式打开
;; All js file are used the js2-mode
(use-package js2-mode
  :ensure t
  :config
  (setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist)))

(provide 'init-Languages)
