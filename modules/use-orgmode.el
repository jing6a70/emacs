;; moduls/setup-orgmode.el


;; Emacs 29 自带 Org Mode 配置（无需手动安装）
;; 核心功能：基础样式、TODO 关键字、Babel 多语言支持、Shell 环境配置

(use-package org
  :pin gnu  ; 强制使用 Emacs 29 自带的 Org Mode，不依赖 Melpa
  :defer t  ; 懒加载，仅打开 Org 文件时加载，提升启动速度
  :config
  ;; 1. Org 基础显示配置
  (setq org-startup-indented t  ; 启动时缩进显示，更美观
        org-todo-keywords '((sequence "TODO" "DOING" "DONE"))  ; TODO 状态流转
        org-todo-keyword-faces '(("DOING" . "blue"))  ; DOING 状态标为蓝色
        org-src-fontify-natively t)  ; 代码块原生语法高亮

  ;; 2. Org Babel 多语言支持（按需启用）
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)       ; 启用 Python 代码块执行
     (shell . t)        ; 启用 Shell/Bash 代码块执行
     (js . t)           ; 启用 JavaScript 代码块执行
     (emacs-lisp . t))) ; 启用 Emacs Lisp 代码块执行

;; 3. 取消代码块执行前的确认提示（提升效率）
(setq org-confirm-babel-evaluate nil)

;; 4. Shell 环境配置（解决 sudo 密码输入、bash 交互模式）
(setenv "SUDO_ASKPASS" "/home/jingpeng/.emacs.d/sh/emacs-askpass.sh")
(setq org-babel-shell-command "bash -i"))  ; 交互模式执行 Shell 命令

;; 手动加载 Org 模块（确保 Babel 等功能生效，兼容懒加载）
(provide 'use-orgmode)


