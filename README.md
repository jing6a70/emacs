# Arch Linux
- 直接克隆
# Gentoo Linux
- 创建`/etc/portage/package.use/emacs`文件, 添加以下配置:
```bash
app-editors/emacs json
```
- 以上操作完成company-LSP将可以正常运行

# 克隆Emacs配置
```bash
git clone https://github.com/totoro-me/mYemacs.git ~/.emacs.d
```

# Error
## xxx.c/xxx.cpp not in project or it is blacklist
- 问题原因: 1. 文件不在项目中; 2. 文件被加入黑名单;
- 解决方案1: *删除装载黑名单的文件*, 即删除lsp-session列表文件
    ```bash
    rm ~/.emacs.d/.lsp-session-v1
    ```
    
- 解决方案2: *加入工程文件打开文件* 打开xxx.c/xxx.cpp文件, 然后按下`M-x` 搜索**lsp-workspace-folders-add** 快捷键: (`s-l` `F a`). 确认后将文件加入工程文件列表.








