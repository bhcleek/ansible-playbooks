#!/usr/bin/env bash
set -e

echo 'Installing Ansible'

# prefer pip for installing python packages over the older easy_install
#
if ! command -v pip > /dev/null 2>&1
then
    sudo easy_install pip
fi

if ! command -v ansible-playbook > /dev/null 2>&1
then
    sudo CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install ansible
fi

if [ "$(uname -s)" = "Darwin" ] && ! command -v brew > /dev/null 2>&1
then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install caskroom/cask/brew-cask
fi

echo 'Running Ansible to configure Dev machine'
ansible-playbook -i localhost.inv --ask-become-pass site.yml

