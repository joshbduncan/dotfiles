# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="${HOME}/.config/zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dracula"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    vi-mode
    virtualenv
    z
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source "${ZSH}/oh-my-zsh.sh"

# User configuration

# run `alias` for full list of active aliases
source "${HOME}/.aliases"
source "${HOME}/.functions"

# fzf git integration
if [ $(command -v "fzf") ]; then
    source "${XDG_CONFIG_HOME}/fzf-git.sh/fzf-git.sh"
    source <(fzf --zsh)
fi

# prompt setup
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

. "$HOME/.local/share/../bin/env"
