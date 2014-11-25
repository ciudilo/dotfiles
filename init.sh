#!/bin/bash

cd
ln -s dotfiles/.tmux.conf .tmux.conf
ln -s dotfiles/.zshrc .zshrc
ln -s dotfiles/.vimrc .vimrc
ln -s dotfiles/.gdbinit .gdbinit
mkdir -p .vim/{backups,swaps,undo,colors}
cp dotfiles/init/solarized.vim ~/.vim/colors

cd - &> /dev/null
# Install Sublime Text settings
if [[ -e ~/Library/Application\ Support/Sublime\ Text\ 3/ ]]; then
echo "Moving Sublime text settings files into place."
	mv ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings.bac 2> /dev/null
	cp init/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings 2> /dev/null

	mv ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap.bac 2> /dev/null
	cp init/Default\ \(OSX\).sublime-keymap ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap 2> /dev/null
fi
