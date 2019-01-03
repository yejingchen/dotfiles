export PATH="$HOME/.local/bin:$PATH"
# start antigen
source /usr/share/zsh/share/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme robbyrussell
antigen apply

alias ls=exa

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
