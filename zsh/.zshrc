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
alias syu='sudo pacman -Syu'

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# zsh_stats from oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/functions.zsh
function zsh_stats() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}
