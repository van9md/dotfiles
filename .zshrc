# PATH без дублей (zsh пересобирает его в каждом интерактивном шелле)
typeset -U path PATH

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

# Поведение шелла
setopt auto_cd auto_pushd pushd_ignore_dups
setopt extended_history hist_ignore_dups hist_ignore_space hist_verify share_history
setopt interactive_comments prompt_subst
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

# Completion: полный compinit раз в сутки, остальные запуски — из кэша
autoload -Uz compinit
if [[ -n $HOME/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Prompt (robbyrussell) + заголовок окна терминала
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '%F{blue}git:(%F{red}%b%F{blue})%f '
zstyle ':vcs_info:git:*' actionformats '%F{blue}git:(%F{red}%b|%a%F{blue})%f '
precmd() { vcs_info; print -Pn "\e]0;%~\a" }
preexec() { print -Pn "\e]0;$1\a" }
PROMPT='%(?:%F{green}➜:%F{red}➜)%f %F{cyan}%c%f ${vcs_info_msg_0_}'

# Aliases
alias c="clear"
alias vim="nvim"
alias cat="bat"
alias ls="eza -l --icons --group-directories-first"
alias ll="eza -lh --icons --group-directories-first"
alias l="eza -lah --icons --group-directories-first"
alias claude-vpn='HTTPS_PROXY=http://127.0.0.1:10809 NO_PROXY="localhost,127.0.0.1" claude'

# Tools
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

source "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
# подсветка — последней, после всех, кто определяет виджеты (atuin)
source "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Keybindings — в самом конце, иначе плагины их перетирают
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
