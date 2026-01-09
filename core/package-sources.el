;; core/package-sources.el

;; 加入国内的elpa源
;; Add domestic mirror source for elpa
(require 'package)

(setq package-archives '(("gnu" . "http://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("melpa-stable" . "http://mirrors.ustc.edu.cn/elpa/melpa-stable/")
                         ("org" . "http://mirrors.ustc.edu.cn/elpa/org/")))

;; 国内镜像可选 跳过禁用包签名检查
(setq package-check-signature nil)

;; 设置包缓存目录: user-emacs-directory 配置根目录(~/.emacs.d)
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))


