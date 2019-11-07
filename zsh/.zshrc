source $HOME/grml/zshrc

# alacritty doesn't set LANG
export LANG=zh_CN.UTF-8

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
export FZF_DEFAULT_COMMAND="fd"

export PATH="/Users/jye/Library/Python/3.7/bin:\
$HOME/.yarn/bin:\
$HOME/.cargo/bin:\
$HOME/.local/bin:\
/usr/local/bin:\
/usr/local/sbin:\
$PATH"

# start antigen
source "$(brew --prefix)/share/antigen/antigen.zsh"
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
export NVS_HOME="$HOME/.nvs"
[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"

setopt HIST_IGNORE_SPACE

# zsh_stats from oh-my-zsh https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/functions.zsh
function zsh_stats() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

alias file='file -h'
alias ls='exa --time-style iso'
alias l='ls -lgH'
