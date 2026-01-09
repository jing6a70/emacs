
;; 设置emacs的主题UI Settings for UI theme
(use-package doom-themes
  :ensure
  :init (load-theme 'doom-city-lights t))


;; 字体与字体大小设置
;; 如果没有安装; 请安装FiraCode字体:
;; ArchLinux: yay -S nerd-fonts-fira-code
;; (set-frame-font "FiraCode Nerd Font-12")
;; 单设置字体大小(set-face-attribute 'default nil :height 13)5
