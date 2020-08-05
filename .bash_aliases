alias vi='vim'
alias git='LANG=en_US git'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# fzf
alias fzf='fzf-tmux -l'

# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
alias df='df -h'
alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# alias grep='grep --color'                     # show differences in colour
# alias egrep='egrep --color=auto'              # show differences in colour
# alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -Al'                              # all but . and ..
# alias l='ls -CF'                              #

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

function git() {
  if [ $# -gt 0 ] && [ "$1" == "diff" ] ; then
     shift
     command git diff --color "$@"
  else
     command git "$@"
  fi
}

alias gitlog="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
