# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


#-------------------=== Dotdrop ===-------------------------------
alias de="dotdrop --cfg=$HOME/.dots/config.yaml"

# =============================================================================
# MiniPrompt
# =============================================================================

#-------------------=== aliases ===-------------------------------
alias start_mp='source /usr/local/bin/MiniPrompt*/mini_prompt'
alias odf='source /usr/local/bin/MiniPrompt*/scripts/on_da_fly.sh'


# load xresources file
# xrdb merge ~/xresources

#-------------------=== vars ===-------------------------------
MINIPROMPT_ENABLED=false

#-------------------=== resources ===-------------------------------

# >>> MiniPrompt initialize >>>
if [[ "$MINIPROMPT_ENABLED" == "true" ]]; then
    # check if current shell is interactive
    # if .bashrc doesn't do this by default, uncomment the line below and comment the line that only says source /usr/local/bin/MiniPrompt*/mini_prompt.sh
    # [[ $- == *i* ]] && source /usr/local/bin/MiniPrompt*/mini_prompt.sh || echo -e "You are currently not in an interactive shell, thus MiniPrompt can't load"
    
    # source the files
    source /usr/local/bin/MiniPrompt*/mini_prompt
    source /usr/local/bin/MiniPrompt*/scripts/extras.sh
elif [[ "$MINIPROMPT_ENABLED" == "false" ]]; then
    # don't source it
    if [ "$color_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    else
        # set again variables that MiniPrompt remaps
        PS1="\[\033[01;32m\]\w\[\033[00m\]\[\033[01;39m\] >\[\033[00m\] "
        HISTCONTROL=ignoredups
        shopt -s histappend
    fi
    unset color_prompt force_color_prompt

    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
        xterm*|rxvt*)
            PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
            ;;
        *)
            ;;
    esac

else
    echo -e "Configuration variable 'MINIPROMPT_ENABLED' was set to '$MINIPROMPT_ENABLED', which is not a valid value. It can either be set to 'true' or 'false' in the ~/.bashrc file."
fi
# <<< MiniPrompt initialize <<<

alias sync_miniprompt='sudo rm -R -f /usr/local/bin/MiniPrompt; sudo rsync -av /home/sebas5758/code/github_p/MiniPrompt/ /usr/local/bin/MiniPrompt'


# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
# shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# HISTSIZE=1000
# HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi


function set-title() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}


# if [ "$color_prompt" = yes ]; then
#     # default
#     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#     # PS1='\[\e]0;\u@\h: \w\a\]\[\033[4m\]\[\033[32m\]\u\[\033[0m\]\[\033[96m\]@\[\033[5m\]\[\033[33m\]\h\[\033[37m\]:\[\033[3m\]\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
#     # <dir> > <prompt>
#     # BEST ONE SO FAR
#     # works
#     PS1="\[\033[01;32m\]\w\[\033[00m\]\[\033[01;39m\] >\[\033[00m\] "
#     # PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

#     # works
#     # PS1="\e[1;34m\e[3;29m\w\e[0m\e[0m \e[1;37m>\e[0m "

#     # $USER@$DEVICE: <dir>$ <prompt>
#     # works
#     # PS1="\[\e]0;\u@\h: \w\a\]\[\033[4m\]\[\033[32m\]\u\[\033[0m\]\[\033[96m\]@\[\033[5m\]\[\033[33m\]\h\[\033[37m\]:\[\033[3m\]\[\033[01;34m\]\w\[\033[00m\]\$ \[\033[00m\]"


#     # export PROMPT_COMMAND='echo -en "\033]0; $("pwd") \a"'
#     # source ~/code/github_p/.dotfiles/bin/cool_prompt/mini_prompt.sh

#     # works
#     # PS1="\e[1;34m\e[3;32m\w\e[0m\e[0m \e[1;39m> \e[0m"

#     # works
#     # PS1="\e[1;34m\e[3;32m\w\e[0m\e[0m > "

#     # works
#     # PS1="\[\e]0;\u@\h: \w\a\]\e[1;34m\e[3;32m\w\e[0m\e[0m > "
# fi
# unset color_prompt force_color_prompt

# # If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
#     ;;
# esac

## enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then
#    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#    alias ls='ls --color=auto'
#    #alias dir='dir --color=auto'
#    #alias vdir='vdir --color=auto'

#    alias grep='grep --color=auto'
#    alias fgrep='fgrep --color=auto'
#    alias egrep='egrep --color=auto'
#fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.shell_aliases ]; then
    source ~/.shell_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



# =============================================================================
# C-NET.ORG
# =============================================================================

#This for easy access on https://paste.c-net.org/

function pastebin()
{
    local url='https://paste.c-net.org/'
    if (( $# )); then
        local file
        for file; do
            curl -s \
                --data-binary @"$file" \
                --header "X-FileName: ${file##*/}" \
                "$url"
        done
    else
        curl -s --data-binary @- "$url"
    fi
}
function pasteget()
{
    local url='https://paste.c-net.org/'
    if (( $# )); then
        local arg
        for arg; do
            curl -s "${url}${arg##*/}"
        done
    else
        local arg
        while read -r arg; do
            curl -s "${url}${arg##*/}"
        done
    fi
}


# ----------------------------=== My Stuff ===--------------------------

_MY_KITTY="$(which kitty)"
if [ -e "${_MY_KITTY}" ]; then
	source <(kitty + complete setup bash)
fi
unset _MY_KITTY

_MY_JAVA="$(which java)"
if [ -e "${_MY_JAVA}" ]; then
    export JAVA_HOME=$(dirname $(dirname $(readlink -f "${_MY_JAVA}")))
    export PATH=$PATH:$JAVA_HOME/bin
fi
unset _MY_JAVA

_MY_JDTLS="$HOME/Downloads/eclipse.jdt.ls"
if [ -e "${_MY_JDTLS}" ]; then
    export PATH=$PATH:$_MY_JDTLS
fi
unset _MY_JDTLS

_MY_NODE="$(which node)"
if [ -e "${_MY_NODE}" ]; then
	export NODE_PATH="$HOME/.npm-packages/bin:$HOME/.node_modules/bin"
    export PATH=$PATH:$NODE_PATH
fi
unset _MY_NODE

_MY_CARGO="$(which cargo)"
if [ -e "${_MY_CARGO}" ]; then
	export CARGO_BIN_PATH="$HOME/.cargo/bin"
    export PATH=$PATH:$CARGO_BIN_PATH
fi
unset _MY_CARGO

_MY_GOLANG="$(which go)"
if [ -e "${_MY_GOLANG}" ]; then
	export GOPATH="$HOME/go"
	export GOBIN="$GOPATH/bin"
	export PATH=$PATH:$GOBIN
fi
unset _MY_GOLANG

local_bin="$HOME/.local/bin"

export PATH=$PATH:$local_bin


_MY_VIM="$(which vim)"
if [ -e "${_MY_VIM}" ]; then
	export EDITOR='vim'
	export VISUAL='vim'
fi
unset _MY_VIM


#-------------------=== others ===-------------------------------
export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s cmdhist
export HISTIGNORE="&:ls:[bf]g:exit"

#everything inside here will run whenever a tty window is opened
if [ "$TERM" = "linux" ]; then
    setterm -foreground green -store
fi
#references:
#https://askubuntu.com/questions/147462/how-can-i-change-the-tty-colors

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/sebas5758/.sdkman"
[[ -s "/home/sebas5758/.sdkman/bin/sdkman-init.sh" ]] && source "/home/sebas5758/.sdkman/bin/sdkman-init.sh"

# luaver
alias lv='luaver'
alias llv='[ -s ~/.luaver/luaver ] && . ~/.luaver/luaver; [ -s ~/.luaver/completions/luaver.bash ] && . ~/.luaver/completions/luaver.bash'

alias luamake=/home/sebas5758/.config/lua-language-server/3rd/luamake/luamake




# ----------- Cursor
# set default cursor to blinking pipe
printf '%b' '\033[5 q'

# \033[5 q			#blinking pipe bar
# \033[6 q			#not blinking pipe bar
# \033[1 q			#blinking block
# \033[2 q			#not blinking block
# \033[3 q			#blinking underscore
# \033[4 q			#not blinking underscore
# alias mp="source /usr/lib/node_modules/miniprompt/miniprompt"
# mp

# alias mp="source /home/pocco81/code/github_p/MiniPrompt/miniprompt"
alias mp="source miniprompt"
mp
# PS1='$(printf "%*s\r%s" $(( COLUMNS-1 )) "[$(git branch 2>/dev/null | grep '^*' | sed s/..//)] $(date +%H:%M:%S)" "heipei@wavefront:$PWD$ ")'

# eval "$(starship init bash)"


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
