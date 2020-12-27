;;; init-Tools.el --- 添加Emacs各种工具

;;; Commentary 注解:
;;    <!-- 2018.06.08 -->: { 加载插件youdao-dectionary, 为Emacs添加了翻译功能 }

;;; Code:
;; 配置youdao-dictionary, 添加翻译功能
;; Settings for youdao-dictionary
(use-package youdao-dictionary
  :ensure t
  :bind
  ("C-c y" . youdao-dictionary-search-at-point+)
  ("C-c p" . youdao-dictionary-play-voice-at-point))

(provide 'init-Tools)
