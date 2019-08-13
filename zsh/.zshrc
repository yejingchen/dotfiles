source $HOME/grml/zshrc

# alacritty doesn't set LANG
export LANG=zh_CN.UTF-8

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
export FZF_DEFAULT_COMMAND="fd"

export PATH="/Users/jye/Library/Python/3.7/bin:\
/usr/local/opt/thrift@0.9/bin:\
$HOME/.yarn/bin:$HOME/.cargo/bin:$HOME/.local/bin/:\
/Applications/MacVim.app/Contents/bin:\
/usr/local/bin:/usr/local/sbin/:$PATH"

# start antigen
source "$(brew --prefix)/share/antigen/antigen.zsh"
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

alias ls='exa --time-style iso'
alias l='ls -lg'

source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
export NVS_HOME="$HOME/.nvs"
[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"

setopt HIST_IGNORE_SPACE

alias file='file -h'
