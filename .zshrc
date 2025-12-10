#
#OHMYZSH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Aliases
alias c="clear"
alias vim="nvim"
alias tmux-sessionizer="sh /home/van9/dotfiles/.config/scripts/tmux-sessionizer"
alias cat="bat"
# Exports
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/home/van9/go/bin"
export PATH="$PATH:/opt"
export PATH="$PATH:/home/van9/.local/bin"
export PATH="$PATH:/var/lib/flatpak/exports/share"
export PATH="$PATH/home/van9/.local/share/flatpak/exports/share"
export PATH="$PATH:/opt/yazi"
export PATH="$PATH:/home/van9/.cargo/bin"
export PATH="$PATH:/root/.cargo/bin"
export PATH="$PATH:/home/van9/files/code/flutter/flutter/bin"
export PATH="$PATH:$HOME/.atuin/bin"
export GOPATH=$HOME/go
export EDITOR='nvim'
export VISUAL='nvim'
export MANPAGER="nvim +Man!"
MAILSYNC_MUTE=1
#OHMYZSH plugins
plugins=(git docker zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
#alias fix
alias ls="eza -l --icons --group-directories-first"
#plugin
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#atuin
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
