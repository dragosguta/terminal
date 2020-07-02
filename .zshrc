
#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all of the shell configurations for ZSH
#
#  Sections:
#  0.   Plugins
#  1.   Environment Configuration
#  2.   Make Terminal Better
#  3.   Process Management
#  4.   Networking
#  5.   Docker
#
#  ---------------------------------------------------------------------------

#   -------------------------------
#   0.  Plugins
#   -------------------------------

#   Syntax highlighting
    source $HOME/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

#   Auto Suggestions
    source $HOME/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

#   Enable ZSH history
    source $HOME/.zsh_plugins/history.zsh

#   Command Completion
    source $HOME/.zsh_plugins/completion.zsh

#   Terminal Key Bindings
    source $HOME/.zsh_plugins/key-bindings.zsh

#   NVM
    source $HOME/.zsh_plugins/zsh-nvm/zsh-nvm.plugin.zsh

#   -------------------------------
#   1.  ENVIRONMENT CONFIGURATION
#   -------------------------------
#   Add vscode to path
    export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

#   Add commonly used folders to $PATH
    export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

#   Specify default editor
    export EDITOR=vim

#   -------------------------------
#   2.  MAKE TERMINAL BETTER
#   -------------------------------

#   Initialize the completion system
    autoload -Uz compinit

#   Cache completion if nothing changed - faster startup time
    typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
    if [ $(date +'%j') != $updated_at ]; then
      compinit -i
    else
      compinit -C -i
    fi

#   Enhanced form of menu completion called `menu selection'
    zmodload -i zsh/complist

#   Start "starship" theme
    eval "$(starship init zsh)"

#   Set time on right side
    RPROMPT="%B%F{240}[%*]"

#   File search functions
    function f() { find . -iname "*$1*" ${@:2} }
    function r() { grep "$1" ${@:2} -R . }

#   Create a folder and move into it in one command
    function mcd() { mkdir -p "$@" && cd "$_"; }

#   Moves a file to the MacOS trash
    function trash() { command mv "$@" ~/.Trash ; }

#   Always list directory contents upon 'cd'
    cd() { builtin cd "$@"; ls; }

#   Preferred 'ls' implementation
    alias ls='ls -FGlAhp'

#   Preferred 'mkdir' implementation
    alias mkdir='mkdir -pv'

#   Preferred 'mv' implementation
    alias mv='mv -iv'

#   Preferred 'cp' implementation
    alias cp='cp -iv'

#   Clear terminal display
    alias c='clear'

#   Find executables
    alias which='type -all' 

#   Opens current directory in MacOS Finder
    alias f='open -a Finder ./'

#   Source zshrc after making changes
    alias sourcez='source ~/.zshrc'

#   showa: to remind yourself of an alias (given some part of it)
#   ------------------------------------------------------------
    showa() { /usr/bin/grep --color=always -i -a1 $@ ~/.zshrc | grep -v '^\s*$'; }

#   -------------------------------
#   3.  Process Management
#   -------------------------------

#   ttop: Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#   Taken from this macosxhints article
#   http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
    alias ttop="top -R -F -s 10 -o rsize"

#   cpuHogs: Find CPU hogs
#   -----------------------------------------------------
    alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   memHogsTop, memHogsPs: Find memory hogs
#   -----------------------------------------------------
    alias memHogsTop='top -l 1 -o rsize | head -20'
    alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   -------------------------------
#   4.  NETWORKING
#   -------------------------------
    alias ip='echo -en \ - Public facing IP Address:\ ; curl ipecho.net/plain ; echo ; echo -en \ - Internal IP Address:\ ; ipconfig getifaddr en0'

#   openPorts: All listening connections
    alias openPorts='sudo lsof -i | grep LISTEN'

#   netCons: Show all open TCP/IP sockets
    alias netCons='lsof -i'

#   lsockU: Display only open UDP sockets
    alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'

#   lsockT: Display only open TCP sockets
    alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'

#   List processes owned by my user
    function my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

#   ii: display useful host related informaton
#   -------------------------------------------------------------------
    ii() {
        echo -e "\nYou are logged on ${RED}$HOST"
        echo -e "\nAdditionnal information:$NC " ; uname -a
        echo -e "\n${RED}Users logged on:$NC " ; w -h
        echo -e "\n${RED}Current date :$NC " ; date
        echo -e "\n${RED}Machine stats :$NC " ; uptime
        echo -e "\n${RED}Current network location :$NC " ; scselect
        echo -e "\n${RED}Public facing IP Address :$NC " ;ip
        echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
        echo
    }

#   ---------------------------------------
#   5.  DOCKER
#   ---------------------------------------
    di () {
      name=${1}
      if [ -z "$1" ]
        then
          echo "Must supply name argument"
      else
          docker inspect `docker ps -q --filter name=$name` | jq ".[0].Config.Env"
      fi
    }

    dl () {
      name=${1}
      number=${2:-all}
      if [ -z "$1" ]
        then
          echo "Must supply name argument"
      else
          docker logs -f `docker ps -q --filter name=$name` --tail $number
      fi
    }
