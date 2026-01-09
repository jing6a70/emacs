;; core/custom-config.el

;; 仅管理 custom-file 逻辑，继承 init.el 的 user-emacs-directory
(setq custom-file (expand-file-name ".config-auto.el" user-emacs-directory))

;; 兜底：确保目录存在
(make-directory (file-name-directory custom-file) t)

;; 加载 custom-file
(when (file-exists-p custom-file)
  (load custom-file t t))

;; 自动创建空文件
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))


(provide 'custom-config)
