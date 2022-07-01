;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun open-e2macs-man()
  (interactive)
  (find-file "~/.emacs.d/README.md"))


(provide 'init-func-def)
