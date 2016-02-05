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
alias j="autojump"
alias ls="ls -AG";
alias ?='pwd';
PS1='\w [$(git branch 2>/dev/null | grep '^*' | colrm 1 2)]\[\033[0;31m\] ∇ \[\033[0m\] ';

# Mac OS
# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv
defaults write -g ApplePressAndHoldEnabled -bool true
alias sopen='open -a "/Applications/Sublime Text 2.app"'
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash";
alias dnsflush="sudo killall -HUP mDNSResponder"
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete";

if [ -f `brew --prefix`/etc/bash_completion  ]; then
    . `brew --prefix`/etc/bash_completion
fi

# sniff http traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
# Task name completion for grunt files.
function _grunt() {
    local cur tasks
    cur=${COMP_WORDS[COMP_CWORD]}
    # Extract list of task names from help text.
    tasks="$(grunt --help --no-color | awk 'task==1 {print $1} /Available tasks/ {task=1} /^$/ {task=0}')"
    if [ $COMP_CWORD -eq 1 ]; then
        # Task name completion for first argument.
        COMPREPLY=( $(compgen -W "$tasks" $cur) )
    else
        # File name completion for other arguments.
        COMPREPLY=( $(compgen -f $cur) )
    fi
}
complete -o default -F _grunt grunt g
alias jq='$(thefuck $(fc -ln -1))'

# dev
function goof {
    ack -l "goog.provide\('$1'\)"
}
alias diff='git diff | colordiff'
alias zvooq='. env/bin/activate && ./run.sh'
alias npmupd='rm -rf node_modules/ && npm install && say "Modules terminated"'

export PATH=/usr/local/bin:$PATH

export NVM_DIR="/Users/ivn/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
