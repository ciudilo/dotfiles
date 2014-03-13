#!/bin/bash

cd
ln -s dotfiles/.tmux.conf .tmux.conf
ln -s dotfiles/.zshrc .zshrc

cd - &> /dev/null
# Install Sublime Text settings
if [ ~/Library/Application\ Support/Sublime\ Text\ 3/ -e ]; then
	mv ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings.bac 2> /dev/null
	cp init/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings 2> /dev/null
fi
