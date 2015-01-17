#!/bin/bash -
echo "正在安装"
if which apt-get >/dev/null;
then
    sudo apt-get install -y vim vim-gtk ctags xclip \
        astyle python-setuptools python-dev cscope
fi
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#copy complete-dict
cp -rf tool ~/.vim

#copy vimrc
cp -rf _vimrc ~/.vimrc
#copy tag files
cp -rf tags ~/.vim/



