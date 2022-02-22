# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# -------- Settings

# ---- All
export HISTFILESIZE=20000
export HISTSIZE=10000
export HISTIGNORE="&:ls:[bf]g:exit"
export HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01' # colored GCC warnings and errors
shopt -s cmdhist
shopt -s cdspell # correct minor spelling errors in cd
shopt -s histappend # append to the history file, don't overwrite it

# ---- TTYs
# everything inside here will run whenever a tty window is opened
# reference: https://askubuntu.com/questions/147462/how-can-i-change-the-tty-colors
if [ "$TERM" = "linux" ]; then
    setterm -foreground green -store
fi

# ---- Cursor
# set default cursor to blinking pipe
printf '%b' '\033[5 q'

# \033[5 q			#blinking pipe bar
# \033[6 q			#not blinking pipe bar
# \033[1 q			#blinking block
# \033[2 q			#not blinking block
# \033[3 q			#blinking underscore
# \033[4 q			#not blinking underscore

# ---- Prompt
alias mp="source miniprompt"
if [ -e "$(which miniprompt)" ]; then
	mp
fi

# ---- Editor
if [ -e "$(which vim)" ]; then
	export EDITOR='vim'
	export VISUAL='vim'
fi

# ---- Terminal
if [ -e "$(which kitty)" ]; then
	source <(kitty + complete setup bash)
fi

# -------- $PATH Additions
declare -A path_additions=(
    ["node"]="$HOME/.npm-packages/bin:$HOME/.node_modules/bin"
    ["cargo"]="$HOME/.cargo/bin"
    ["go"]="$HOME/go/bin"
    # ["java"]="$(dirname $(dirname $(readlink -f "${_MY_JAVA}")))"
)

for program in "${!path_additions[@]}"; do
	if [ -e "$(which "$program")" ]; then
		export PATH=$PATH:${path_additions[$program]}
	fi
done

alias de="dotdrop --cfg=$HOME/.dots/config.yaml"

# =============================================================================
# MiniPrompt
# =============================================================================
#-------------------=== vars ===-------------------------------
MINIPROMPT_ENABLED=false

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



# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
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

# -------- Others

# ---- pastebin
# this for easy access on https://paste.c-net.org/
function pastebin() {
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
function pasteget() {
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
