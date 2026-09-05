# PATH без дублей (zsh пересобирает его в каждом интерактивном шелле)
typeset -U path PATH

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git docker zsh-autosuggestions)
source "$ZSH/oh-my-zsh.sh"

# Exports
export GOPATH="$HOME/go"
export EDITOR='nvim'
export VISUAL='nvim'
export MANPAGER="nvim +Man!"

path=(
  "$HOME/.local/bin"
  "$HOME/.config/scripts"
  "$HOME/.cargo/bin"
  "$HOME/.atuin/bin"
  "$GOPATH/bin"
  /usr/local/go/bin
  /opt/yazi
  /var/lib/flatpak/exports/bin
  $path
)

# Aliases
alias vim="nvim"
alias cat="bat"
alias ls="eza -l --icons --group-directories-first"
alias claude-vpn='HTTPS_PROXY=http://127.0.0.1:10809 NO_PROXY="localhost,127.0.0.1" claude'

# Tools
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"

# zsh-syntax-highlighting должен идти после всех, кто определяет виджеты (atuin)
source "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Keybindings — в самом конце, иначе omz/atuin их перетирают
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
