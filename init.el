;; init.el
;; ┌─┐┌─┐┬─┐┌─┐┌─┐  ┌─┐┬ ┬┌─┐┬  ┌─┐┌─┐
;; ├─┘├┤ ├┬┘├┤ ├┤   ├─┤│ │├─┤│  ├┤ └─┐
;; ┴  └─┘┴└─└  └─┘  ┴ ┴└─┘┴ ┴┴─┘└─┘└─┘
;;       A P E X     E M A C S
;;
;; Commentary: emacs的初始化文件 Initialization emacs' file
;; 在Emacs打开时候会自动加载该配置文件.


;; 设置 关键变量{ user-emacs-directory } => ~/.emacs.d/
(if (boundp 'load-file-name)
    (setq user-emacs-directory (file-name-as-directory (file-name-directory load-file-name)))
  (setq user-emacs-directory (file-name-as-directory "~/.emacs.d/")))

;; 定义{ core-dir }变量 ./core 目录完整路径
(defvar core-dir (expand-file-name "core" user-emacs-directory))

;; 加载 Emacs编辑器基础配置
(load (expand-file-name "use-common-emacs.el" core-dir) t t)

;; 加载 自定义{ package-archives }包源配置 C-h v : package-archives 查询详细
(load (expand-file-name "package-sources.el" core-dir) t t)
(package-initialize) ;; 初始化包管理器

;; 加载 custom-config 配置
(load (expand-file-name "custom-config.el" core-dir) t t)

;; 加载 主题配置
(load (expand-file-name "use-theme.el" core-dir) t t)

;; 加载各USE配置
(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))
(defvar my/local-modules
  '(use-vertico
    use-companymode
    use-lspmode
    use-treemacs
    use-magit
    use-orgmode
    use-yasnippet
    use-hungry-delete))
(dolist (module my/local-modules)
  (require module nil 'noerror))

;; 自定义功能与键绑定
;; (require 'init-func-def)
;; (require 'init-func-key)


