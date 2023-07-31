export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin"
export GROFF_NO_SGR=1
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"

alias open='xdg-open'
alias tar=bsdtar
alias sshp="ssh -o ProxyCommand='nc -X 5 -x 127.0.0.1:1088 %h %p'"

syu() {
	tmux new "sudo pacman -Syu ; echo pacman done; sleep infinity"
}

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

[[ -r ~/.dircolors ]] && source <(dircolors ~/.dircolors)

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
#function kde_craft_env_prompt() {
#    REPLY="${craftRoot+CRAFT: }"
#}
#grml_theme_add_token kdecraft -f kde_craft_env_prompt
zstyle ':prompt:grml:left:setup' items rc virtual-env change-root user at host path vcs percent

# yellow username if in ssh
if [[ ${SSH_CONNECTION+x} ]]; then
	zstyle ':prompt:grml:*:items:user' pre '%B%F{yellow}'
fi

# start antigen
#source /usr/share/zsh/share/antigen.zsh
source ~/.zsh/antigen.zsh
antigen bundle git
#antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle z-shell/F-Sy-H@main
antigen apply

export FZF_DEFAULT_COMMAND=fd
