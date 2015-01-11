#!/bin/bash -
echo "正在安装"
if which apt-get >/dev/null;
then
    sudo apt-get install -y vim vim-gtk ctags xclip \
        astyle python-setuptools python-dev cscope
fi

#copy vimrc
cp _vimrc ~/.vimrc
#copy tag files
cp tags ~/.vim/



