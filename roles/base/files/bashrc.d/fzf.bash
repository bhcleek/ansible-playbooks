
if [[  "$(uname -s)" == 'Darwin' ]];
then
	# Setup fzf
	# ---------
	if command -v brew > /dev/null; then
		if [[ ! "$PATH" == *$(brew --prefix)/opt/fzf/bin* ]]; then
			export PATH="$PATH:$(brew --prefix)/opt/fzf/bin"
		fi

		# Auto-completion
		# ---------------
		[[ $- == *i* ]] && source "$(brew --prefix)/opt/fzf/shell/completion.bash" 2> /dev/null

		# Key bindings
		# ------------
		source "$(brew --prefix)/opt/fzf/shell/key-bindings.bash"
	fi
elif [[ "$(uname -s)" == 'Linux' ]];
then
	# Auto-completion
	# ---------------
	[[ $- == *i* ]] && source "/usr/share/bash-completion/completions/fzf" 2> /dev/null

	# Key bindings
	# ------------
	source "/usr/share/doc/fzf/examples/key-bindings.bash"
fi
