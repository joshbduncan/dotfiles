# dotfiles

This repository contains scripts and configuration files to set up my development environment for macOS.

## Getting Started

1. Clone the repo and navigate to the clone location.

```sh
git clone https://github.com/joshbduncan/dotfiles.git
cd ~/location/of/my/dotfiles
```

## Setup ZSH and Terminal

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
## Setup Vim and Neovim

```sh
ln -sf $DOTFILES/vim/.vimrc $HOME
ln -sf $DOTFILES/nvim $XDG_CONFIG_HOME/nvim
```
## Links Scripts to BIN Directory

```sh
./scripts/install-scripts.sh
```
## Miscellaneous Items

### Clone fzf-git

```sh
git clone https://github.com/junegunn/fzf-git.sh.git $XDG_CONFIG_HOME/fzf-git.sh
```