;;; init.el --- emacs的初始化文件 Initialization emacs' file

;;; 注解 Commentary:
;;  在Emacs打开时候会自动加载该配置文件.


;;; Code:
;; 加入国内的elpa源 Add domestic mirror source for elpa
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
			                   ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(package-initialize) ;; 初始化包管理器


;; 加载各个模块配置的路径 Add path of each module;
(add-to-list 'load-path "~/.emacs.d/elisp/")

;; 定义界面, 主题, ivy套装等UI美化模块;
(require 'init-UI)

;; 定义备份文件是否启动, 行号, tab键, 代码格式等相关内容;
(require 'init-Editing)

;; 提供org, markdown笔记环境;
(require 'init-Documents)

;; 集成代码补全, LSP-语言服务器协议, 代码片断的支持, 对于编程是十分重要模块;
(require 'init-Programming)

;; 添加对html, css, js, python等语言的支持
(require 'init-Languages)

;; 集成Emacs各种扩展工具(功能性扩展)
(require 'init-Tools)

;; (require 'htmlize)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "37144b437478e4c235824f0e94afa740ee2c7d16952e69ac3c5ed4352209eefb" "93ed23c504b202cf96ee591138b0012c295338f38046a1f3c14522d4a64d7308" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "dde8c620311ea241c0b490af8e6f570fdd3b941d7bc209e55cd87884eb733b0e" "4a8d4375d90a7051115db94ed40e9abb2c0766e80e228ecad60e06b3b397acab" "f2927d7d87e8207fa9a0a003c0f222d45c948845de162c885bf6ad2a255babfd" "c4bdbbd52c8e07112d1bfd00fee22bf0f25e727e95623ecb20c4fa098b74c1bd" "8b58ef2d23b6d164988a607ee153fd2fa35ee33efc394281b1028c2797ddeebb" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "c0fcf9d1ba4c7dd37fd483962363b7fcedf223721ee1bf434826618dfcb6a20a" "5d09b4ad5649fea40249dd937eaaa8f8a229db1cec9a1a0ef0de3ccf63523014" "4bca89c1004e24981c840d3a32755bf859a6910c65b829d9441814000cf6c3d0" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "7451f243a18b4b37cabfec57facc01bd1fe28b00e101e488c61e1eed913d9db9" default))
 '(package-selected-packages
   '(lsp-client eglot company-lsp monokai-theme almost-mono-themes doom-theme spacemacs-theme htmlize html-to-markdown auto-org-md dracula-theme doom-themes which-key dap-mode lsp-clients company-prescient company-quickhelp company counsel swiper use-package lsp-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
