#!/usr/bin/env bash
set -eu

printf "Installing Ansible\n" >&2

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
fi

printf "Running Ansible to configure Dev machine\n" >&2
ansible-playbook -i localhost.inv --ask-become-pass development.yml

