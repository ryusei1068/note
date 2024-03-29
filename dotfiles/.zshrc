# Path to your oh-my-zsh installation.
# https://github.com/ohmyzsh/ohmyzsh
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  # https://github.com/zsh-users/zsh-autosuggestions
  zsh-autosuggestions
  # https://github.com/zsh-users/zsh-syntax-highlighting
  zsh-syntax-highlighting
  web-search
  kubectl
)
source $ZSH/oh-my-zsh.sh

# lazygit
# https://github.com/jesseduffield/lazygit
alias lg='lazygit'

# exa
# https://github.com/ogham/exa
alias l='exa -l -g -a'
alias lt='exa --icons -l -T'

# starship
# https://github.com/starship/starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship.toml
export STARSHIP_CACHE=~/.starship/cache

# alias
# https://github.com/sharkdp/bat
alias cat='bat'
# ctrl + b
function batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}
zle -N batdiff
bindkey '^b' batdiff


# peco-
# https://github.com/peco/peco
# ctrl + h
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^h' peco-select-history
 
# cdr peco
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':completion:*' recent-dirs-insert both
  zstyle ':chpwd:*' recent-dirs-default true
  zstyle ':chpwd:*' recent-dirs-max 1000
  zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi
 
# ctrl + r
function peco-cdr () {
  local selected_dir="$(cdr -l | sed 's/^[0-9]\+ \+//' | peco --prompt="cdr >" --query "$LBUFFER")"
  if [ -n "$selected_dir" ]; then
    BUFFER="cd `echo $selected_dir | awk '{print$2}'`"
    zle accept-line
  fi
}
zle -N peco-cdr
bindkey '^r' peco-cdr

# ctrl + g
function peco-dev () {
  local selected_dir=$(ghq list -p | peco --prompt="repositories >" --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-dev
bindkey '^g' peco-dev

# docker
alias dclean='docker rm -v $(docker ps -aq -f status=exited)'

# WezTerm
PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"
export PATH

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# golang
export PATH=$PATH:/usr/local/go/bin

