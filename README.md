# dotfiles

This repository contains scripts and configuration files to set up my development environment for macOS.

## Getting started

1. Clone the repo and navigate to the clone location.

```sh
git clone https://github.com/joshbduncan/dotfiles.git
cd ~/location/of/my/dotfiles
```

## Setup zsh and terminal

1. Run the zsh setup script:

```sh
./scripts/install-zsh.sh
```

> [!NOTE]
> Make sure to `exit` the so the zsh config is reloaded.

2. Load Terminal Configs

```sh
mkdir $XDG_CONFIG_HOME/ghostty
ln -sf $DOTFILES/ghostty/config $XDG_CONFIG_HOME/ghostty
```
## Setup vim and nvim

```sh
ln -sf $DOTFILES/vim/.vimrc $HOME
ln -sf $DOTFILES/nvim $XDG_CONFIG_HOME/nvim
```
## Link scripts to bin directory

```sh
./scripts/install-scripts.sh
```
## Miscellaneous

### Clone fzf-git

```sh
git clone https://github.com/junegunn/fzf-git.sh.git $XDG_CONFIG_HOME/fzf-git.sh
```