;; 配置代码跳转， 支持c, c++, java
(use-package ggtags
  :ensure
  )

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))


;; 代码跳转
;; (add-hook 'c-mode-hook 'counsel-gtags-mode)
;; (add-hook 'c++-mode-hook 'counsel-gtags-mode)
