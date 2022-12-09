#   ---------------------------------------------------------------------------
#
#   Description:  This file holds all of the shell configurations for ZSH
#
#   Sections:
#   0.   Make Terminal Better
#   1.   Process Management
#   2.   Networking
#   3.   Extended Commands
#   4.   Environment Configuration
#   5.   Plugins
#
#   ---------------------------------------------------------------------------

#   -------------------------------
#   0.  MAKE TERMINAL BETTER
#   -------------------------------
#   Preferred 'ls' implementation
#    alias ls='ls -FGlAhp'

#   Use exa [https://github.com/ogham/exa] instead of ls
    alias ls='exa -FGlah --group-directories-first --icons --level=2'

#   Use zoxide indead of cd
    alias cd='z'

#   Preferred 'mkdir' implementation
    alias mkdir='mkdir -pv'

#   Preferred 'mv' implementation
    alias mv='mv -iv'

#   Preferred 'cp' implementation
    alias cp='cp -iv'

#   Clear terminal display
    alias c='clear'

#   Opens current directory in MacOS Finder
    alias f='open -a Finder ./'

#   Source zshrc after making changes
    alias sourcez='source ~/.zshrc'

#   Use bat [https://github.com/sharkdp/bat] instead of cat
    alias cat='bat'

#   -------------------------------
#   1.  Process Management
#   -------------------------------

#   Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#   Taken from this macosxhints article
#   http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
    alias ttop="top -R -F -s 10 -o rsize"

#   Find CPU hogs
    alias cpuHogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   Find memory hogs
    alias memHogsTop='top -l 1 -o rsize | head -20'
    alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   -------------------------------
#   2.  NETWORKING
#   -------------------------------
#   Display the current machine's IP address
    alias ip='echo -en \ - Public facing IP Address:\ ; curl ipecho.net/plain ; echo ; echo -en \ - Internal IP Address:\ ; ipconfig getifaddr en0'

#   openPorts: All listening connections
    alias openPorts='sudo lsof -i | grep LISTEN'

#   netCons: Show all open TCP/IP sockets
    alias netCons='lsof -i'

#   lsockU: Display only open UDP sockets
    alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'

#   lsockT: Display only open TCP sockets
    alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'

#   ---------------------------------------
#   3.  Extended Commands
#   ---------------------------------------
#   Create a folder and move into it in one command
    function mcd() {
        mkdir -p "$@" && cd "$_";
    }

#   Moves a file to the MacOS trash
    function trash() {
        command mv "$@" ~/.Trash ;
    }

#   Always list directory contents upon 'cd'
    function cd() {
        builtin cd "$@"; ls;
    }

#   Remind yourself of an alias (given some part of it)
    function showa() {
        /usr/bin/grep --color=always -i -a1 $@ ~/.zshrc | grep -v '^\s*$';
    }

#   Run docker inspect and view environment of a container
    function di() {
      name=${1}
      if [ -z "$1" ]
        then
          echo "Must supply name argument"
      else
          docker inspect `docker ps -q --filter name=$name` | jq ".[0].Config.Env"
      fi
    }

#   Tail the logs of a container
    function dl() {
      name=${1}
      number=${2:-all}
      if [ -z "$1" ]
        then
          echo "Must supply name argument"
      else
          docker logs -f `docker ps -q --filter name=$name` --tail $number
      fi
    }

#   Display useful host related information
    function ii() {
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

#   List processes owned by my user
    function my_ps() {
        ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ;
    }

#   -------------------------------
#   4.  ENVIRONMENT CONFIGURATION
#   -------------------------------

#   Specify default editor
    export EDITOR=vim

#   Set starship theme config
    export STARSHIP_CONFIG=$HOME/.starship/config.toml

#   Enable starship theme [https://github.com/starship/starship]
    eval "$(starship init zsh)"

#   Enable node version manager with fnm [https://github.com/Schniz/fnm]
    eval "$(fnm env)"

#   Enable zoxide [https://github.com/ajeetdsouza/zoxide]
    eval "$(zoxide init zsh)"

#   Enable fzf [https://github.com/junegunn/fzf#installation]
    if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
    PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
    fi

    # Auto-completion
    [[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

    # Key bindings
    source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

#   -------------------------------
#   5.  Plugins
#   -------------------------------

#   Syntax highlighting [https://github.com/zsh-users/zsh-syntax-highlighting]
    source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

#   Auto suggestions [https://github.com/zsh-users/zsh-autosuggestions]
    source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh