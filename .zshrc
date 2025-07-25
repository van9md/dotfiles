autoload -U colors && colors
bindkey -e
PS1="%{$fg[magenta]%}%~%{$fg[red]%} %{$reset_color%}$%b "
# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
#source <(fzf --zsh)
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
## Basic auto/tab complete:
autoload -U compinit && compinit
autoload -U colors && colors
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.
#setopt appendhistory
#setopt sharehistory
#setopt hist_ignore_space
#setopt hist_ignore_all_dups
#setopt hist_save_no_dups
#setopt hist_ignore_dups
#setopt hist_find_no_dups

# Completion styling
#setopt autocd
# Aliases
alias ls='ls --color'
alias ll='ls -lah --color'
alias c='clear'
alias vim="nvim"
alias tmux-sessionizer="sh /home/van9/dotfiles/.config/scripts/tmux-sessionizer.sh"
# Exports
export PATH="$PATH:/usr/local/go/bin"
export GOPATH=$HOME/go
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

export EDITOR='nvim'
export VISUAL='nvim'
export MANPAGER="nvim +Man!"
MAILSYNC_MUTE=1
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"
