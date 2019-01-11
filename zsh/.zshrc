export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export FZF_DEFAULT_COMMAND="fd"

export PATH="$HOME/.cargo/bin:/Applications/MacVim.app/Contents/bin:/usr/local/bin:$PATH"
export PATH="$(yarn global bin 2>/dev/null):$PATH"

# start antigen
source "$(brew --prefix)/share/antigen/antigen.zsh"
antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme robbyrussell
antigen apply

alias ls='exa --time-style iso'

source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
export NVS_HOME="$HOME/.nvs"
[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"
