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

# python venv prompt for grml theme
# src: http://bewatermyfriend.org/p/2013/003/
function virtual_env_prompt () {
    REPLY="${VIRTUAL_ENV+(${VIRTUAL_ENV:t}) }"
}
grml_theme_add_token virtual-env -f virtual_env_prompt '%F{magenta}' '%f'

# KDE Craft prompt for grml theme
function kde_craft_env_prompt() {
    REPLY="${craftRoot+CRAFT: }"
}
grml_theme_add_token kdecraft -f kde_craft_env_prompt
zstyle ':prompt:grml:left:setup' items rc kdecraft virtual-env change-root user at host path vcs percent
