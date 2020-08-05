PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs

__prompt_command() {
    local exit_code="$?"
    local host_name="$(hostname)"

    # set color vars https://misc.flogisoft.com/bash/tip_colors_and_formatting
    local red='\e[31m' green='\e[92m' blue='\e[34m' yellow='\e[93m'
    local inv='\e[7m'

    # set reset var
    local rst='\e[0m'

    # set git prompt
    local git="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"

    # init
    PS1=""

    #
    PS1+="[$green\h$rst] "

    # git branch + dir
    PS1+="[\e[100m\w$rst"; if [ -n "$git" ]; then PS1+=" <> \e[100m$git$rst] "; else PS1+="] "; fi

    # datetime
    local date_time="$(date +'%b%d%Z')"
    PS1+="\e[94m$date_time $rst"

    # errorcode
    if [ $exit_code != 0 ]; then PS1+="$red$exit_code$rst "; fi

    #
    PS1+="\n\\$ "
}
