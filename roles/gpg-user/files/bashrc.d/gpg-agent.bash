function _start_gpg_agent {
	# fire up gpg-agent
	gpgconf --launch gpg-agent > /dev/null 2>&1
}

function _run_gpg_agent {
	if command -v gpg-agent > /dev/null 2>&1; then
		: ${ORIG_SSH_AUTH_SOCK:=${SSH_AUTH_SOCK}}
		: ${ORIG_SSH_AGENT_PID:=${SSH_AGENT_PID}}
		GPG_TTY=$(tty)
		export GPG_TTY
		# make sure gpg-agent is running
		gpgconf --launch gpg-agent > /dev/null
		export ORIG_SSH_AUTH_SOCK
		# export gpg-agent's variables.
		export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
		unset SSH_AGENT_PID

	fi
}

_run_gpg_agent
