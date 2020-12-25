if [[  "$(uname -s)" == 'Darwin' ]];
then
	# Setup fzf
	# ---------
	if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
		export PATH="$PATH:/usr/local/opt/fzf/bin"
	fi

	# Auto-completion
	# ---------------
	[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.bash" 2> /dev/null

	# Key bindings
	# ------------
	source "/usr/local/opt/fzf/shell/key-bindings.bash"
elif [[ "$(uname -s)" == 'Linux' ]];
then
	# Auto-completion
	# ---------------
	[[ $- == *i* ]] && source "/usr/share/bash-completion/completions/fzf" 2> /dev/null

	# Key bindings
	# ------------
	source "/usr/share/doc/fzf/examples/key-bindings.bash"
fi
