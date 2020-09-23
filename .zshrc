# Path to your oh-my-zsh installation.
export ZSH="/Users/jbd/.oh-my-zsh"
ZSH_THEME="jdizzle"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
	git
	python
	pip
	virtualenv
	colored-man-pages
	osx
	vi-mode
    fzf
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Setup VI mode
export KEYTIMEOUT=1
    # fix delete key mess
    bindkey    "^[[3~"          delete-char 
    bindkey    "^[3;5~"         delete-char

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Source personal aliases
source ~/.aliases

export VIRTUAL_ENV_DISABLE_PROMPT=
# export PYTHONPATH="${PYTHONPATH}:/Users/jbd/Library/Python/3.7/bin/"
# export PATH="${PATH}:/Users/jbd/Library/Python/3.7/bin/"

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/jbd/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# Setup FZF
export FZF_BASE=/usr/local/bin/fzf
export FZF_COMPLETION_TRIGGER='??'
bindkey "ç" fzf-cd-widget
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
