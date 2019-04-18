# environment variables

# setup terminal prompt
export PS1="\[\033[36m\]\u \[\033[m\]@ \[\033[32m\]\h in \[\033[33;1m\]\w\[\033[m\]\n\\$ "
#export PS1="\u@\h ? \w\n\\$ \[$(tput sgr0)\]"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

export TWILIO_ACCOUNT_SID=AC67ce4f5b116c6c88b5c06e4fa9c82740
export TWILIO_AUTH_TOKEN=148c78a6a28783d6d12a80d3a92b57d7
export STRIPE_TEST_SECRET_KEY=sk_test_OkrNjAR6woAudMLezXPnX5GI

#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   -------------------------------------------------------------------
    alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
    alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

# Commom Mac programs
alias editbash='vim .bash_profile'
alias reload='source ~/.bash_profile'
alias text='open -a TextEdit'
alias pre='open -a Preview'

# Safety Net
alias rm='rm -i'

# Common Commands
alias ls='ls -GFh'
alias q='exit'
alias c='clear'
alias h='history'
alias cls='clear;ls'
alias gs='git status'
alias diskspace='df -h /Volumes/Macintosh\ HD'

# Virtualenv
alias vmake='python3 -m virtualenv venv'
alias vstart='source venv/bin/activate'
alias vrestart='deactivate; source venv/bin/activate'
alias vend='deactivate'

# Common Directories
alias home='cd ~'
alias root='cd /'
alias dtop='cd ~/Desktop'
alias dbox='cd ~/Dropbox'
alias dev='cd ~/dev'
alias projects='cd ~/dev/projects'

# Moving Around Directories
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

##
# Your previous /Users/jduncan/.bash_profile file was backed up as /Users/jduncan/.bash_profile.macports-saved_2018-11-29_at_11:42:22
##

# MacPorts Installer addition on 2018-11-29_at_11:42:22: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH
