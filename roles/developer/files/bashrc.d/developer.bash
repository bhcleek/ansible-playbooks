if [ "$(uname -s)" = "Darwin" ] && command -v brew > /dev/null && [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
	source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
elif [ -f ~/.git-completion.bash ]; then
	source ~/.git-completion.bash
elif [ -f /usr/share/bash-completion/completions/git ]; then
	source /usr/share/bash-completion/completions/git
fi

if [ "$(uname -s)" = "Darwin" ] && command -v brew > /dev/null && [ -f $(brew --prefix)/etc/bash_completion.d/git-prompt.sh ]; then
	source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
elif [ -f ~/.git-prompt.sh ]; then
	source ~/.git-prompt.sh
elif [ -f /etc/bash_completion.d/git-prompt ]; then
	source /etc/bash_completion.d/git-prompt
fi

if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]
then
	# updates PATH for the Google Cloud SDK.
	source "$HOME/google-cloud-sdk/path.bash.inc"
fi

if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]
then
	# The next line enables shell command completion for gcloud.
	source "$HOME/google-cloud-sdk/completion.bash.inc"
fi

export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto

#export NODE_PATH=/usr/local/lib/node

if [ -d /usr/libexec/java_home ]
then
	export JAVA_HOME=$(/usr/libexec/java_home)
fi

: ${DEV_ORIG_PATH:=${PATH}}
export DEV_ORIG_PATH
export PATH=/usr/local/go/bin:$DEV_ORIG_PATH

GOPATH=$(go env GOPATH)
export GOBIN=${GOPATH%%:*}/bin

export PATH=$HOME/bin:$HOME/.rd/bin:${GOPATH//:/bin:}/bin:${PATH}
CDPATH=.:${GOPATH//:/src/github.com:}/src/github.com:${GOPATH//:/src/golang.org:}/src/golang.org:${HOME}/src:${GOPATH//:/src:}/src

export GOPRIVATE=*.internal.digitalocean.com,github.com/digitalocean
# set GOMODCACHE to a single location, regardless of what GOPATH may be.
export GOMODCACHE=$(go env GOMODCACHE)

if command -v kubectl > /dev/null; then
	source <(kubectl completion bash)

	alias k=kubectl
	complete -o default -F __start_kubectl k

	alias k8s=kubectl
	complete -o default -F __start_kubectl k8s

	alias kube=kubectl
	complete -o default -F __start_kubectl kube
fi

if command -v assume > /dev/null; then
	alias assume=". assume"
fi

if command -v aws_completer > /dev/null; then
	complete -C 'aws_completer' aws
fi
