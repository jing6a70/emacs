;;; init-UI.el --- 初始化Emacs软件界面

;;; Commentary 注释:
;;    <!--2018.06.08-->: { 关闭: 菜单栏, 工具栏, 滑动条 禁止开机启动界面, 设置默认光标类型; }
;;    <!--2020.09.11-->: { 修改: Emacs主题UI; }
;;    <!--2018.11.22-->: { 安装: ivy三件套: ivy, swiper, counsel; }
;;    <!--2022.01.22-->: { 加载: 目录数与启动快捷键; }
;;    <!--2022.01.27-->: { 加载: FiraCode字体; 修改: FiraCode字体大小; }
;;    <!--2022.01.28-->: { 修复: neotree-dir缺少图标icons, 加载: all-the-icons }
;;    <!--2022.07.01-->: { 添加: treemacs 目录树插件 }

;;; Code:
;;  进行简约配置: 关闭菜单栏, 工具栏, 滑动条
;;  Choose a minimalist configuration: close memubar, toolbar, scrollbar.
(menu-bar-mode t)
(tool-bar-mode -1)
(scroll-bar-mode t)

;; 禁止开机启动界面, 设置默认光标类型
;; inhibit splash screen and set default cursor type
(setq inhibit-splash-screen t)
(setq-default cursor-type 'bar)


;; 字体与字体大小设置
;; 如果没有安装; 请安装FiraCode字体:
;; ArchLinux: yay -S nerd-fonts-fira-code
;; (set-frame-font "FiraCode Nerd Font-12")
;; 单设置字体大小(set-face-attribute 'default nil :height 135)

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
  (global-set-key [f9] 'neotree-refresh)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  )
;; 支持目录树的图标 neotree-dir需要
(use-package all-the-icons
  :ensure
  )

;; 自定义neotree窗口宽度
(defcustom neo-window-width 29
  "*Specifies the width of the NeoTree window."
  :type 'integer
  :group 'neotree)


;; 添加treemacs 目录树插件

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-move-forward-on-expand        nil
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-user-header-line-format       nil
          treemacs-width                         35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))


;;(use-package treemacs-evil
;;  :after treemacs evil
;;  :ensure t)


(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

(use-package treemacs-persp
  :after treemacs persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))



(provide 'init-UI)
