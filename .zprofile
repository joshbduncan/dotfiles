eval "$(/opt/homebrew/bin/brew shellenv)"

# Homebrew Competions
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# Created by `pipx` on 2022-02-07 16:58:45
export PATH="$PATH:/Users/jbd/.local/bin"

# Setting PATH for Python 3.13
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:${PATH}"
export PATH
