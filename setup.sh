#!/bin/bash -
echo "正在安装"
if which apt-get >/dev/null;
then
    sudo apt-get install -y vim vim-gtk ctags xclip \
        astyle python-setuptools python-dev cscope
fi
git clone http://github.com/gmarik/vundle.git  ~/.vim/bundle/vundle

#copy complete-dict
cp -rf tools ~/.vim

#copy vimrc
cp -rf _vimrc ~/.vimrc
#copy tag files
cp -rf tags ~/.vim/
tar -zxvf vim-latex-1.8.23.tar.gz
cp -r vim-latex-1.8.23/* ~/.vim/
rm -rf vim-latex-1.8.23


