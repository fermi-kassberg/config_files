# docker in it
fpath=(~/.zsh/completion $fpath)

autoload -U compinit promptinit
compinit
promptinit

# kubectl
source <(kubectl completion zsh)

# helm
source <(helm completion zsh)

# customized prompt
source ~/.git-prompt.sh
precmd () { __git_ps1 "%F{green}%n@%m %T%f " "%~"$'\n'"%F{magenta}$%f " "%s| " }

# set the default prompt to adam1 theme
# prompt adam1

# alias
source ~/.bash_aliases

# set for GO
export GOROOT=/usr/local/go; export GOPATH=$HOME/go-projects; export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# set CDPATH
export CDPATH=.:~:~/notes:~/projects


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border'
