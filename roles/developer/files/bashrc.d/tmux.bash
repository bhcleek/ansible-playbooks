function _run_tmux {
	# start the default tmux session if it doesn't already exist
	if command -v tmux &> /dev/null
	then
		if ! tmux has-session 2> /dev/null
		then
			tmux start-server
			tmux new-session -s default -n dashboard -d
			tmux split-window -h 'ulimit -n 4096 && godoc -http=:6060 -analysis=type -notes="BUG|TODO"'
			tmux split-window -v
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
