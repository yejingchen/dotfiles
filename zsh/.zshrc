# uncomment to profile zsh startup time using `zprof` command
#zmodload zsh/zprof

source $HOME/grml/zshrc

setopt HIST_IGNORE_SPACE

# alacritty doesn't set LANG
export LANG=zh_CN.UTF-8

#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
export FZF_DEFAULT_COMMAND="fd"

export PATH="\
$HOME/.yarn/bin:\
$HOME/.cargo/bin:\
$HOME/.local/bin:\
/usr/local/opt/curl-openssl/bin:\
/usr/local/bin:\
/opt/bin:\
$PATH"

# start antigen
source "/usr/local/share/antigen/antigen.zsh"
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle Tarrasch/zsh-autoenv
antigen apply

source "/usr/local/opt/fzf/shell/completion.zsh"
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# zsh_stats from oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/functions.zsh
function zsh_stats() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

alias file='file -h'
alias ls='exa --time-style iso'
alias l='ls -lgH'

# pyenv
(( $+commands[pyenv] )) && eval "$(pyenv init -)"

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
