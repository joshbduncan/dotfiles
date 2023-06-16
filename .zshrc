# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="jdizzle"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
    git
    pip
    vi-mode
    virtualenv
    z
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# user configuration

# move dump files out of home directory
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# show dotfile with auto-completion
# setopt globdots

# setup vim as editor
export EDITOR='vim'
# setup edit command in vim by pressing spacebar in command mode
# autoload edit-command-line
# zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
source ~/.aliases

# set prompt
THEME_DELIMITER="%{$fg_bold[blue]%}›%{$reset_color%}%{$fg_bold[red]%}›%{$reset_color%}%{$fg_bold[green]%}›%{$reset_color%}"
PROMPT='%(?:%{$fg_bold[green]%}👊 :%{$fg_bold[red]%}🤬 )$THEME_DELIMITER'
PROMPT+=' %{$fg[yellow]%}%c%{$reset_color%} $(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
export VIRTUAL_ENV_DISABLE_PROMPT=
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

# fix vi mode
export KEYTIMEOUT=1
# fix delete key mess
bindkey "^[[3~" delete-char 
bindkey "^[3;5~" delete-char

# change bat theme
export BAT_THEME="Dracula"

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/jbd/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# Created by `pipx` on 2022-02-07 16:58:45
export PATH="$PATH:/Users/jbd/.local/bin"

# add brew ruby path for gem installs
export GEM_HOME="/opt/homebrew"

# setup fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
export FZF_COMPLETION_TRIGGER='??'
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# rust cargo
# . "$HOME/.cargo/env"

if [ -d "/usr/local/opt/ruby/bin" ]; then
  export PATH=/usr/local/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi
