export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

export PATH="$HOME/.cargo/bin:/Applications/MacVim.app/Contents/bin:/usr/local/bin:$PATH"
export PATH="$(yarn global bin):$PATH"

# start antigen
source "$(brew --prefix)/share/antigen/antigen.zsh"
antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme robbyrussell
antigen apply

alias ls=exa

source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
export NVS_HOME="$HOME/.nvs"
[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"
