export EDITOR=vim

# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
HISTCONTROL=ignoreboth
# commands with leading space do not get added to history
HISTCONTROL=ignorespace

function nametab {
    echo -ne "\033]0;"$1"\007"
}

alias ls="ls -AG";
alias ?='pwd';
PS1='\h:\w [$(git branch 2>/dev/null | grep '^*' | colrm 1 2)]\[\033[0;31m\] Я \[\033[0m\] ';

# Mac OS
# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv
alias sopen='open -a "/Applications/Sublime Text 2.app"'
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash";
alias dnsflush="sudo killall -HUP mDNSResponder"
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete";

# Mac Os apps
alias canaryremote="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --remote-debugging-port=9222"
alias canaryspdy="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --use-spdy=no-ssl"
