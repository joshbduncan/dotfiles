# Path to your oh-my-zsh installation.
# export ZSH="/Users/jbd/.oh-my-zsh"
# export ZSH="~/.oh-my-zsh"
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="jdizzle"

plugins=(
    colored-man-pages
    fzf
    git
    # osx
    pip
    # python
    vi-mode
    virtualenv
    zsh-autosuggestions
    # must be last
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
source ~/.aliases

# Setup VI mode
export KEYTIMEOUT=1
    # fix delete key mess
    bindkey    "^[[3~"          delete-char 
    bindkey    "^[3;5~"         delete-char

export VIRTUAL_ENV_DISABLE_PROMPT=

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/jbd/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# Setup FZF
export FZF_BASE=/usr/local/bin/fzf
export FZF_COMPLETION_TRIGGER='??'
bindkey "ç" fzf-cd-widget
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh