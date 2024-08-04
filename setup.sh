#!/bin/bash

# install packages
termux-setup-storage
echo "deb https://mirrors.cqupt.edu.cn/termux-main stable main" >> $PREFIX/etc/apt/sources.list
pkg update && pkg upgrade -y

yes | pkg install git zsh nodejs neovim fastfetch curl
yes | pkg install x11-repo termux-x11-nightly virglrenderer-android proot-distro pulseaudio

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh

# properties
mv $HOME/.termux/termux.properties $HOME/.termux/termux.properties.bak
cp -r ./.termux $HOME/.termux  

# zsh theme and plugins
npm i -g typewritten

ZSH_CUSTOM=${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}
FPATH_LINE="fpath+=\$ZSH_CUSTOM/plugins/zsh-completions/src"
git clone https://github.com/zsh-users/zsh-completions "$ZSH_CUSTOM/plugins/zsh-completions"
sed -i "/^source \$ZSH\/oh-my-zsh.sh/i $FPATH_LINE" ~/.zshrc
omz plugin enable git web-search copybuffer sudo

# motd
mv $PREFIX/etc/motd $PREFIX/etc/motd.bak
echo -e "
      ⠀⠀⠀⠀⠀⠀⣀⣠⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⣴⡿⠋⠉⠉⠻⢿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠹⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠈⣿⡄⠀⠀⠀⠀⠀⠀⢸⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠸⣷⠀⠀⠀⠀⠀⠀⢸⣿⠀⠀⢀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀
       ⠀⠀⠀⠀⢻⣇⠀⠀⠀⠀⠀⢸⣿⣿⡿⠿⠿⠟⠛⠛⠻⢿⣿⣶⣄⠀⠀⠀
      ⠀⠀⠀⠀⠀⢈⣿⠆⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣤⣤⣤⠀⠈⠻⣿⣇⠀⠀
      ⠀⠀⠀⠀⢀⣾⡏⠀⠀⠀⠀⠀⠀⠀⣴⡿⠋⠉⠀⠀⠀⠀⠀⠀⠀⢹⡿⠀⠀
        ⣀⣤⣼⣿⠀⠀⠀⠀⠀⠀⠀⢸⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣷⣄⠀
      ⢠⣾⠟⠋⠉⠋⠀⠀⠀⠀⠀⠀⠀⠈⣿⣦⣀⣀⣀⣤⣤⣶⣶⠿⠋⠁⢹⣿⡇
      ⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡟⢉⣿⠋⠉⠉⠉⠁⠀⠀⠀⠀⢸⣿⠀
      ⢸⣿⠀⠀⠀⠀⠀⢀⣀⣀⣤⣴⠿⠋⠀⠘⣷⡀⠀⠀⠀⠀⠀⠀⢀⣴⣿⠏⠀
 (˙ᵕ˙)⢸⣿⡄⠀⠀⠀⠀⠈⠉⠉⠁⠀⠀⠀⠀⠀⣸⣿⢶⣤⣤⣴⡶⠿⠛⠙⣿⣆⠀
      ⠈⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⣽⣿⠀
      ⠀⠘⣿⣆⠀⠀⠀⠀⣠⣤⡀⠀⠀⠀⠀⠈⠻⣧⣀⡀⠀⠀⠀⣀⣠⣴⡿⠇⠀
      ⠀⠀⠘⢿⣿⣦⣤⣴⡿⠻⠿⣷⣦⣤⣤⣤⣴⣾⣿⡿⠿⠿⠿⠟⠛⠉⠀⠀⠀
      ⠀⠀⠀⠀⠉⠉⠉⠉⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉
" > $PREFIX/etc/motd
