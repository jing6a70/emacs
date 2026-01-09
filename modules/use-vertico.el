;;; --- Vertico 现代补全套件 ---

;; 1. Vertico - 核心垂直补全界面
(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  :custom
  (vertico-count 13)           ;; 显示 13 行，兼顾视野与空间
  (vertico-cycle t)            ;; 允许循环滚动
  :config
  ;; 这是一个“大多数人配置”中的精髓：
  ;; 让他在寻找文件时，按 Backspace 键能直接回退一级目录，而不是一个个删字符
  (with-eval-after-load 'vertico
    (define-key vertico-map (kbd "DEL") #'vertico-directory-delete-char)
    (define-key vertico-map (kbd "M-DEL") #'vertico-directory-delete-word)))

;; 2. Orderless - 核心过滤引擎 (必装)
;; 效果：输入 "conf init" 就能匹配 "init-config.el"，空格分隔，无视顺序
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

;; 3. Marginalia - 列表侧边说明
;; 效果：在 M-x 旁边显示函数文档，在文件旁边显示大小和权限
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

;; 4. Consult - 搜索与跳转增强 (Ivy/Swiper 的完美替代)
(use-package consult
  :ensure t
  :bind (;; 重新绑定常用键
         ("C-s" . consult-line)          ;; 替代 ctrl-s，更好用的行搜索
         ("C-x b" . consult-buffer)      ;; 整合了最近文件、书签和 Buffer
         ("M-y" . consult-yank-pop)      ;; 带有预览的剪贴板历史
         ("M-g g" . consult-goto-line)   ;; 跳行
         ("M-g m" . consult-mark)        ;; 跳转标记点
         ("M-g i" . consult-imenu)       ;; 跳转变量/函数定义
         ("M-s r" . consult-ripgrep)     ;; 全局搜索 (需安装 ripgrep)
         :map minibuffer-local-map
         ("M-s" . consult-history)       ;; 搜索命令历史
         ("M-r" . consult-history)))

;; 5. Embark - “右键菜单”功能 (进阶神器)
;; 效果：在任何选中的候选词上按 C-. 弹出操作菜单（如复制、删除、重命名）
(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)         ;; 触发动作
   ("M-." . embark-dwim))       ;; 智能跳转
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

;; 6. 辅助配置：持久化历史记录
(use-package savehist
  :init
  (savehist-mode 1))

;; 7. 辅助配置：优化原生补全体验
(setq read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      completion-ignore-case t)


(provide 'use-vertico)
