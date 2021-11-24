#!/usr/bin/env bash
set -eu

printf "Installing Ansible\n" >&2

# prefer pip for installing python packages over the older easy_install
#
if ! command -v pip3 > /dev/null 2>&1
then
	curl https://bootstrap.pypa.io/get-pip.py -o "${TMPDIR}/get-pip.py"
	python3 "${TMPDIR}/get-pip.py" --user
fi

if ! command -v ansible-playbook > /dev/null 2>&1
then
	python3 -m pip install --user ansible
fi

if [ "$(uname -s)" = "Darwin" ] && ! command -v brew > /dev/null 2>&1
then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

printf "Running Ansible to configure Dev machine\n" >&2
ansible-playbook -i localhost.inv --ask-become-pass development.yml

