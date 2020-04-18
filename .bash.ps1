PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs

__prompt_command() {
    local exit_code="$?"
    local host_name="$(hostname)"

    # set color vars
    local red='\e[31m'
    local gre='\e[92m'
    local blue='\e[34m'
    local inv='\e[7m'

    # set reset var
    local rst='\e[0m'

    # set git prompt
    local git="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"

    # init
    PS1=""

    #
    PS1+="$inv\h$rst "

    # git branch + dir
    PS1+="[ \w ] "; if [ -n "$git" ]; then PS1+="$blue*$git$rst "; fi

    # datetime
    local date_time="$(date +'%:::z-%H:%M')"
    PS1+="$gre$date_time $rst"

    # errorcode
    if [ $exit_code != 0 ]; then PS1+="$red$exit_code$rst "; fi

    #
    PS1+="\n\\$ "
}
