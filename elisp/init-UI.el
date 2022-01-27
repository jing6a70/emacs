;;; init-UI.el --- 初始化Emacs软件界面

;;; Commentary 注释:
;;    <!--2018.06.08-->: { 关闭菜单栏, 工具栏, 滑动条 禁止开机启动界面, 设置默认光标类型 }
;;    <!--2020.09.11-->: { 修改了Emacs主题UI }
;;    <!--2018.11.22-->: { 安装ivy三大法器: ivy, swiper, counsel }
;;    <!--2022.01.22-->: { 添加了目录数启动快捷键 }


;;; Code:
;;  进行简约配置: 关闭菜单栏, 工具栏, 滑动条
;;  Choose a minimalist configuration: close memubar, toolbar, scrollbar.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; 禁止开机启动界面, 设置默认光标类型
;; inhibit splash screen and set default cursor type
(setq inhibit-splash-screen t)
(setq-default cursor-type 'bar)

;; 设置emacs的主题UI Settings for UI theme
(use-package doom-themes
  :ensure
  :init (load-theme 'doom-city-lights t))

;; 一个灵活, 精简的工具, 用于在Emacs中完成迷你缓冲区
;; flexible, simple tools for minibuffer completion in Emacs
(use-package swiper
  :ensure t)


;; Counsel: Emacs命令的ivy增强版本的集合
;; Counsel, a collection of Ivy-enhanced versions of common Emacs commands.
(use-package counsel
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; enable this if you want `swiper' to use it
  ;; (setq search-default-mode #'char-fold-to-regexp)
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "<f6>") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))

;; 目录树
(use-package neotree
  :ensure
  :config
  (global-set-key [f8] 'neotree-toggle)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  )



(provide 'init-UI)
