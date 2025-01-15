# Cleanup $HOME
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
# export XDG_RUNTIME_DIR="/run/user/$UID"

export HISTFILE="${XDG_STATE_HOME}"/bash/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
# export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc
export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history
export _Z_DATA="$XDG_DATA_HOME/z"

# Path to your oh-my-zsh installation.
export ZSH="$XDG_DATA_HOME"/oh-my-zsh
# export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dracula"

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
export EDITOR='nvim'
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
PROMPT="%(?:%{$fg_bold[green]%}%1{$%}:%{$fg_bold[red]%}%1{$%}) %{$fg[yellow]%}%c%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

export VIRTUAL_ENV_DISABLE_PROMPT=
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

# fix vi mode
export KEYTIMEOUT=40
# fix delete key mess
bindkey "^[[3~" delete-char 
bindkey "^[3;5~" delete-char

# change bat theme
export BAT_THEME="Dracula"

# add brew ruby path for gem installs
export GEM_HOME="/opt/homebrew"

# NOTE: z
# . /opt/homebrew/etc/profile.d/z.sh

# NOTE: zoxide
# eval "$(zoxide init zsh)"

# NOTE: fzf
source <(fzf --zsh)

# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
# to search directories with rg use the command below
# rg --hidden --sort-files --files --null 2> /dev/null | xargs -0 dirname | uniq
# switched from rg to fd so I can easily search both files and directories
export FZF_DEFAULT_COMMAND="fd --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --exclude .git"

FZF_DRACULA_COLORS="--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"
export FZF_DEFAULT_OPTS="--layout=reverse --border $FZF_DRACULA_COLORS"

# setup fzf previews
FZF_PREVIEW_OPTIONS="--height=50%"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}' $FZF_PREVIEW_OPTIONS"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200' $FZF_PREVIEW_OPTIONS"
export FZF_TMUX_OPTS=" -p90%,70% "

# fzf git integration
source ~/Dropbox/DEV/scripts/fzf-git.sh/fzf-git.sh

# rust cargo
# . "$HOME/.cargo/env"
export PATH=$PATH:/Users/jbd/.cargo/bin

if [ -d "/usr/local/opt/ruby/bin" ]; then
  export PATH=/usr/local/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

# set exa (list) color theme to dracula
# export EXA_COLORS="\
# uu=36:\
# gu=37:\
# sn=32:\
# sb=32:\
# da=34:\
# ur=34:\
# uw=35:\
# ux=36:\
# ue=36:\
# gr=34:\
# gw=35:\
# gx=36:\
# tr=34:\
# tw=35:\
# tx=36:"

# use less for man pages and add dracula color theme
export MANPAGER="/usr/bin/less -s -M +Gg"
export LESS_TERMCAP_mb=$'\e[1;31m'      # begin bold
export LESS_TERMCAP_md=$'\e[1;34m'      # begin blink
export LESS_TERMCAP_so=$'\e[01;45;37m'  # begin reverse video
export LESS_TERMCAP_us=$'\e[01;36m'     # begin underline
export LESS_TERMCAP_me=$'\e[0m'         # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'         # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'         # reset underline
export GROFF_NO_SGR=1                   # for konsole


. "/Users/jbd/.local/share/cargo/env"
