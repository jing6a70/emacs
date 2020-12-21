;; Settings for youdao-dictionary
(use-package youdao-dictionary
  :ensure t
  :bind
  ("C-c y" . youdao-dictionary-search-at-point+)
  ("C-c p" . youdao-dictionary-play-voice-at-point))

(provide 'init-Tools)
