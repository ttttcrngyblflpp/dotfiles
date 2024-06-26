export WD=$(basename $PWD)
function chpwd() {
  export WD=$(basename $PWD)
}

alias ll='ls -l'
alias cfg='git --work-tree ~/ --git-dir ~/.cfg'
alias vi='nvim'
lh() {
    xinput set-prop ${1} 'libinput Left Handed Enabled' 1
}
rotate() {
    cos=$(bc -l <<<"scale=6; c(${2}*a(1)/45)")
    sin=$(bc -l <<<"scale=6; s(${2}*a(1)/45)")
    negsin=$(bc -l <<<"scale=6; -s(${2}*a(1)/45)")
    xinput set-prop ${1} 'Coordinate Transformation Matrix' $cos $sin 0 $negsin $cos 0 0 0 1
}
# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups
unsetopt LIST_BEEP
unsetopt HIST_BEEP
unsetopt BEEP

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt share_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*' file-sort date

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

eval "$(direnv hook zsh)"
