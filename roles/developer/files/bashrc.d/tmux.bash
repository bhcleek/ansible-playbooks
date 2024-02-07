function _run_tmux {
	local session_name=default
	# start the default tmux session if it doesn't already exist
	if command -v tmux &> /dev/null
	then
		if ! tmux has-session 2> /dev/null
		then
			tmux start-server
		fi
		if ! tmux has-session -t ${session_name} 2> /dev/null
		then
			# set the remain-on-exit as a pane on option on each pane instead of a
			# window option so that any additional panes on the created on the
			# dashboard window do not inherit the option value
			tmux new-session -s ${session_name} -n dashboard -d
			tmux set-option -p remain-on-exit on
			tmux set-option -w remain-on-exit on
			pane=$(tmux split-window -P -d -h 'ulimit -n 4096 && godoc -http=:6060 -notes="BUG|TODO"')
			tmux set-option -w remain-on-exit off
			tmux set-option -p -t "${pane}" remain-on-exit on
			pane=$(tmux split-window -P -d -v)
			tmux set-option -p -t "${pane}" remain-on-exit on
			tmux select-pane -t 0
			tmux select-layout main-vertical
			if [ -d "$GOPATH/src/github.com" ]
			then
				tmux new-window -n workspace -c $GOPATH/src/github.com/
			fi
			tmux new-window -n vim-go -c $HOME/src/vim-go
		fi
	fi
}

_run_tmux
