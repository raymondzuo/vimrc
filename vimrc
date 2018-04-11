set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,big5,gb18030,latin1

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" 让配置变更立即生效
au BufWritePost $MYVIMRC source $MYVIMRC

" 定义快捷键的前缀，即<leader>
let mapleader=";"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'derekwyatt/vim-fswitch'
" DelimiMate插件，括号自动补全和智能匹配
Plugin 'Raimondi/delimitMate'
" Syntastic插件，语法增强
Plugin 'vim-syntastic/syntastic'
" Powerline插件，状态栏美化
Plugin 'Lokaltog/vim-powerline'
" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" Tagbar插件，代码函数管理器
Plugin 'majutsushi/tagbar'
" git status plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'
" commneter
Plugin 'scrooloose/nerdcommenter'
" VimSnippets插件，模板自动补全
Plugin 'SirVer/ultisnips'
"Snippets
Plugin 'honza/vim-snippets'
" VimIndentGuides插件，缩进增强
Plugin 'nathanaelkane/vim-indent-guides'
"Doc generation
Plugin 'vim-scripts/DoxygenToolkit.vim'

"Plugin 'indexer.tar.gz'

"Plugin 'vimprj'

"Plugin 'DfrankUtil'
" All of your Plugins must be added before the following line
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'python-mode/python-mode'
Plugin 'KabbAmine/zeavim.vim'
Plugin 'xuqix/h2cppx'
Plugin 'vim-scripts/Conque-GDB'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
	syntax enable
	syntax on            " 语法高亮
endif

set laststatus=2
" 显示光标当前位置
set ruler
" 高亮显示当前行/列
set cursorline
" set cursorcolumn

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab

set autowrite        " 自动把内容写回文件: 如果文件被修改过，在每个 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^命令时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令转到别的文件时亦然。
set autoindent        " 设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
"set smartindent        " 智能对齐方式
set tabstop=4        " 设置制表符(tab键)的宽度
set softtabstop=4     " 设置软制表符的宽度    
set shiftwidth=4    " (自动) 缩进使用的4个空格
set cindent            " 使用 C/C++ 语言的自动缩进方式
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s     "设置C/C++语言的具体缩进方式
"set backspace=2    " 设置退格键可用
set showmatch        " 设置匹配模式，显示匹配的括号
set linebreak        " 整词换行
set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去
"set hidden " Hide buffers when they are abandoned
set mouse=            "Enable mouse usage (all modes)    "使用鼠标
set number            " Enable line number    "显示行号
set history=50        " set command history to 50    "历史记录50条

colorscheme molokai        " elflord ron peachpuff default 设置配色方案，vim自带的配色方案保存在/usr/share/vim/vim72/colors目录下
let g:molokai_original = 1

" YCM 补全菜单配色
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)  
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口  

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎  
let g:ycm_min_num_of_chars_for_completion=1 " 从第2个键入字符就开始罗列匹配项  
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项  
let g:ycm_confirm_extra_conf=1

let g:ycm_error_symbol = 'X'  
let g:ycm_warning_symbol = '>*' 

let g:ycm_autoclose_preview_window_after_completion=0

nnoremap <F12> :YcmCompleter GoToDeclaration<CR>  
nnoremap <S-F12> :YcmCompleter GoToDefinition<CR>  
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>  
nmap <F4> :YcmDiags<CR> 

"Nerd Tree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"cppEnhancedHighlight插件，C++语法高亮增强
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

"FSSwitch插件，头文件与源文件快速切换
nmap <F2> :FSHere<CR>

" Tagbar插件，代码函数管理器
"autocmd bufreadpost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=30
nmap <F3> :Tagbar<CR>

"Git status
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"Comment
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"Snip
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" VimIndentGuides插件，缩进增强
" 随vim自启动
"let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
"let g:indent_guides_start_level=2
" 色块宽度
"let g:indent_guides_guide_size=1
" 自动着色
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=gray
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgray

let g:DoxygenToolkit_authorName="zuoxiaolei104249@pwrd.com" 
"let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

"Ack vim about
cnoreabbrev ack Ack!

"python 3 support
let g:pymode_python = 'python3'
let g:pymode_rope_completion = 0
"performance
let g:pymode_folding = 0
let g:Zeavim="<leader>z"

let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: alwayswith color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm configured incorrectly
let g:ConqueGdb_SaveHistory = 1 " remember history
