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


# Emacs 包管理器
```bash
M-x list-package
```

- U 标记列表中要更新的包
- x 执行所有标记

# 快捷键

<table>
    <tr>
    	<td width="200"><code>F2</code></td>
        <td width="600">打开配置文件</td>
    </tr>
    <tr>
    	<td width="200"><code>C-x</code> + <code>y</code></td>
        <td width="600">选中文本翻译</td>
    </tr>
</table>

# 包管理
## 显示完整列表
1. 先进入包管理器: 按快捷键 `ALT` + `x`， 而后输入以下命令：
```bash
list-package
```
2. 然后显示全部包: 按快捷键 `ALT` + `x`， 而后输入以下命令：
```bash
describe-mode
```

# 安装与删除
- (package-menu-mark-install) [`i`]  安装当前光标所在的包 
- (package-menu-mark-delete) [`d`] 删除安装包

## 更新已安装的所有包
- (package-menu-refresh) [`r`] 从服务器刷新包列表
- (package-menu-mark-upgrades) [`U`] 标记需要更新的包
- (package-menu-execute) [`X`] 执行更新



# magit
`C-x g` magit-status 进入magit
-`s` 添加某个文件进入追踪
-`u` 删除光标所在文件推出追踪
`c-c magit-commit` 提交界面进行输入
`C-c C-c` 提交上一步的信息
`p-u` 上传到远程仓库



