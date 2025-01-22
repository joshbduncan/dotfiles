# ~~~~~~~~~~ XDG ~~~~~~~~~~

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_STATE_HOME="${HOME}/.local/state"

# ~~~~~~~~~~ Editor ~~~~~~~~~~

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

export VISUAL="nvim"

# ~~~~~~~~~~ History ~~~~~~~~~~

export HISTSIZE=100000
export SAVEHIST=100000

# ~~~~~~~~~~ Directories ~~~~~~~~~~

# export ZSH="$XDG_CONFIG_HOME/zsh"
export DROPBOX="${HOME}/Dropbox"
export BLOG="${DROPBOX}/blog"
export DEV="${DROPBOX}/dev"
export REPOS="${DEV}/repos"
export DOTFILES="${REPOS}/dotfiles"
export SCRIPTS="${REPOS}/scripts"
export NOTES="${DROPBOX}/notes"
export NVIMCONFIG="${XDG_CONFIG_HOME}/nvim"

# ~~~~~~~~~~ Cleanup $HOME ~~~~~~~~~~
export SQLITE_HISTORY="${XDG_CACHE_HOME}/sqlite_history"
export _Z_DATA="${XDG_DATA_HOME}/z"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export NODE_REPL_HISTORY="${XDG_DATA_HOME}/node_repl_history"
export GEM_HOME="/opt/homebrew" # add brew ruby path for gem installs

# ~~~~~~~~~~ Man Pages ~~~~~~~~~~

export MANPAGER="/usr/bin/less -s -M +Gg"
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;34m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;45;37m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;36m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole

# ~~~~~~~~~~ Bat > Cat ~~~~~~~~~~

export BAT_THEME="Dracula"

# ~~~~~~~~~~ FZF ~~~~~~~~~~

export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
# export FZF_DEFAULT_COMMAND="fd --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# to search directories with rg use the command below
# switched from rg to fd so I can easily search both files and directories
# rg --hidden --sort-files --files --null 2> /dev/null | xargs -0 dirname | uniq
export FZF_ALT_C_COMMAND="fd --type=d --hidden --exclude .git"

FZF_DRACULA_COLORS="--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"

export FZF_DEFAULT_OPTS="--layout=reverse --border $FZF_DRACULA_COLORS"

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}' --height=50%"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200' --height=50%"
export FZF_TMUX_OPTS=" -p90%,70% "
