export PATH="$HOME/.local/bin:$PATH"

# start antigen
source /usr/share/zsh/share/antigen.zsh
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

alias ls='exa --time-style iso'
alias l='exa -lgH'
alias open='xdg-open'

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
