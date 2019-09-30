#!/bin/bash

# загружаем менеджер плагинов
curl -fLo ./autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Package libxkbfile-dev (or libxkbfile-devel for Fedora) needs to be installed to build the program.
git clone https://github.com/ierton/xkb-switch.git
mkdir -p xkb-switch/build && cd xkb-switch/build
cmake .. && make && sudo make install
sudo ldconfig
xkb-switch --version
cd ../.. && rm -rf xkb-switch

sudo apt-get install xsel

