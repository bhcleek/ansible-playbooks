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

: ${ORIG_PATH:=${PATH}}
export ORIG_PATH

CPU=$(uname -p)
if [[ "$CPU" == "arm" ]]; then
    PATH="/opt/homebrew/bin:$ORIG_PATH"
else
    PATH="/usr/local/bin:$ORIG_PATH"
fi
export PATH=/usr/local/go/bin:$PATH


GOPATH=$(go env GOPATH)
export GOBIN=${GOPATH%%:*}/bin

export PATH=$HOME/bin:${GOPATH//:/bin:}/bin:${PATH}
CDPATH=.:${GOPATH//:/src/github.com:}/src/github.com:${GOPATH//:/src/golang.org:}/src/golang.org:${HOME}/src:${GOPATH//:/src:}/src

export GOPRIVATE=*.internal.digitalocean.com,github.com/digitalocean
