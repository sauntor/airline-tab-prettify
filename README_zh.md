airline-tab-prettify（[English](README.md)）
=====================
通过vim-plug等工具安装vim-airline并集成nerdtree、nerdtree-tabs、tagbar等插件后，默认的tabline显示出来的效果并不令人满意，例如，打开NERDTree，则它会被tabline显示成“NERD\_tree\_1”，同样tagbar被显示成“\__Tagbar\__”。如此，有洁癖的同学可能就觉得这样看着真别扭。这个插件就是解决这个问题的，默认情况下NERDtree会被显示成Explorer，tagbar则是Symbols。

# 安装
可以通过[Vundle](https://github.com/gmarik/vundle)、[Plug](https://github.com/junegunn/vim-plug)等安装，下面以Plug为例
```
Plug 'sauntor/airline-tab-prettify'
```
然后启Vim，通过Plug下载安装：
```
:PlugInstall airline-tab-prettify
```

# 配置
airline-tab-prettify默认启用，在vimrc中添加下面代码即可禁用：
```
let g:airline_tab_prettify_enabled = 0
```
如此vim中的nerdtree和tagbar就会分别显示为Explorer、Symbols。

# 定制
可以将tagbar、nerdtree的名称改为其他的：
```
" 将NERDTree更名为“浏览器”
call airline#extensions#tabline#formatters#pretty#set_nerdtree_name('浏览器')
" 将Tagbar更名为“代码结构”
call airline#extensions#tabline#formatters#pretty#set_tagbar_name('代码结构')
```
也可以定制其他的文件：
```
" 将vim启动时创建的空文件名改为“\[新建\]”
let g:AirlineTabPrettifyTuples = {'\[No Name\]': '[新建]'}
```
__g:AirlineTabPrettifyTuples__时一个dict，以正则表达式为键（用于匹配待定制文件的原名），以定制显示的新名为值。dict的值可以时字符串，也可以是函数引用。当为函数引用时，原函数接受一个参数（即原文件名），并且必须返回值（待展示的新名字）。

