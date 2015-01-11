vimrc
=====
此vimrc主要是为了保存对Vim 的配置,不断学习，不断更新
<h3>相关插件</h3>
<ol>
    <li>
        <a href="http://www.vim.org/scripts/script.php?script_id=273">
        Taglist:tag 显示（将宏、全局变量、函数等tag显示在Symbol窗口）
        </a>
    </li>
    <li>
    ctags:
    生成C++tag文件的命令：
    <a href="http://www.vim.org/scripts/script.php?script_id=2358">头文件目录的链接</a>
    第一步：进入到C++头文件的目录下
    ctags -R --c++-kinds=+plx --fields=+iaS --extra=+q --language-force=c++ . <br/>
    然后将生成的tags放到你喜欢的目录下。并用set tags +=包含进去，具体可以参考上面的2358连接。
    </li>
    <li>
    OmniCppComplete 插件使用<br/>
    <a href="http://vim.wikia.com/wiki/C%2B%2B_code_completion"> C++ code completion</a><br/>
    <a href="http://www.vim.org/scripts/script.php?script_id=1520">OmniCppComplete 插件下载</a>
    </li>
    <li>cscope</li>
    <li><a href="http://www.vim.org/scripts/script.php?script_id=51"> cscope_macro</a></li>
    <li><a href="http://www.vim.org/scripts/script.php?script_id=51"> cscope_maps</a></li>
    <li><a href ="http://www.vim.org/scripts/script.php?script_id=159"> miniBufexpl</a></li>
    <li>
    Winmanager
    <a href ="http://www.vim.org/scripts/script.php?script_id=95">Winmanager 下载地址 </a></li>

</ol>
<h3>注意事项：</h3><br/>
    <ol>
    <li>
    关于vim的安装与卸载，一不小心将/usr/share/vim （ubuntu）目录给删了，
然后就是各种问题。卸载安装也不行。后来发现是自己在卸载的时候没有卸载完全，
要用apt-get remove vim vim\-\*. </li>
    <li> 在添加tag文件的时候一定要注意你的文件的权限的问题（尤其是放在$VIMRUNTIME目录下），不然会导致你的tag被添加到变量中，但是就是无法补全（原因是没有可读的权限）。
    </li>
    <li>
    OmniCppComplete 脚本一定要放在用户目录~\.vim下，不然也可能出项无法自动补全的情况，这个原因，暂时还没有去探究。
    </li>
    </ol>

<h3>参考文献：</h3><br/>
<ol>
    <li><a href="http://amix.dk/vim/vimrc.html">
        The ultimate Vim configuration</a></li>
    <li>
    <a href="http://www.cnblogs.com/xiekeli/archive/2012/08/13/2637176.html">
    Gvim开发环境配置笔记--Windows篇</a>
    </li>
</ol>
