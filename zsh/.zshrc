export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
if [[ -z $SSH_AUTH_SOCK ]]; then
	# gnome-keyring ssh agent
	export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
fi

# start antigen
source /usr/share/zsh/share/antigen.zsh
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

alias ls='exa --time-style iso'
alias l='exa -lgH'
alias open='xdg-open'

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
