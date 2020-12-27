;;; init-Editing.el --- Emacs 编辑功能适配 Emacs: The editing function is appropriate

;;; Commentary 注解:
;;    <!--2018.06.08-->: { 添加了关闭自动创建备份文件功能 }
;;    <!--2018.06.08-->: { 添加了打开Emacs行号功能 }
;;    <!--2018.06.08-->: { 配置了自动补全括号功能 }
;;    <!--2018.11.23-->: { 配置了设置4个空格表示tab各数功能 }
;;    <!--2018.11.23-->: { 安装了hungry-delete插件, 用于自动删除多余空格 }


;;; Code:
;; 关闭自动创建备份文件的功能
;;  Disables the generation of backup files
(setq make-backup-files nil)

;; 打开Emacs行号 Enable line numbers mode.
(global-display-line-numbers-mode t)

;; 自动补全括号 Bracket completion
(electric-pair-mode t)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)


;; 设置4个空格表示的tab的格数
;;  Set the number of tabs represented by 4 spaces
(setq-default indent-tabs-mode nil) ;; 设置默认tab键为插入空格 Change tab key to insert space
(setq c-basic-offset 4)             ;; C/C++语言空格数为4     C/C++ indent space of 4
(setq c-default-style "linux")      ;; 设置样式为'linux'      Set style to "linux"
(setq-default tab-width 4)          ;; 设置默认tab键的宽度     Set width of default tab key


;; 自动删除多余空格
;;  Remove redundant spaces automatically
(use-package hungry-delete
  :ensure t
  :config
    (global-hungry-delete-mode))


(provide 'init-Editing)