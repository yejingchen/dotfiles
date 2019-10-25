#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias systemctl='systemctl -l --no-pager'
alias grep='grep --color=auto'
alias gvim='env LANG=en_US.UTF-8 gvim'

GREEN="\[$(tput setaf 10)\]"
RED="\[$(tput setaf 9)\]"
RESET="\[$(tput sgr0)\]"
export PS1="${GREEN}[\u@\h \W]"'\$'"${RESET} "
export PATH=${PATH}:${HOME}/utils

# Keep environment variables like PATH in place when creating new vte window
#if [[ -f /etc/profile.d/vte.sh ]]; then
#	source /etc/profile.d/vte.sh
#	__vte_prompt_command
#fi

# enable git-subrepo
#source ~/git/git-subrepo/.rc

#shopt -s checkwinsize

#alias cnpm="npm --registry=https://registry.npm.taobao.org \
#--cache=$HOME/.cache/npm/cnpm \
#--disturl=https://npm.taobao.org/dist \
#--userconfig=$HOME/.cnpmrc"
alias sudo='sudo '

myproxy() {
	local target_proxy="127.0.0.1:7777"
	declare -a proxy_envs
	proxy_envs[0]=http_proxy
	proxy_envs[1]=https_proxy
	proxy_envs[2]=HTTP_PROXY
	proxy_envs[3]=HTTPS_PROXY

	case "$1" in
		on )
			for p in ${proxy_envs[@]}; do
				export $p=$target_proxy
			done
			;;
		off )
			for p in ${proxy_envs[@]}; do
				unset $p
			done
			;;
	esac
}
