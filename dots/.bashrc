# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# -------- Settings

# ---- All
export HISTFILESIZE=20000
export HISTSIZE=5000
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
else
	force_color_prompt=yes

	# set variable identifying the chroot you work in (used in the prompt below)
	if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
		debian_chroot=$(cat /etc/debian_chroot)
	fi

	if [ -n "$force_color_prompt" ]; then
		if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
			color_prompt=yes
		else
			color_prompt=
		fi
	else
		case "$TERM" in
			xterm-color|*-256color) color_prompt=yes;;
		esac
	fi

    if [ "$color_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    else
        PS1="\[\033[01;32m\]\w\[\033[00m\]\[\033[01;39m\] >\[\033[00m\] "
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
fi

# ---- Aliases
alias de="dotdrop --cfg=$HOME/.dots/config.yaml"

if [ -f ~/.shell_aliases ]; then
    source ~/.shell_aliases
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ---- Editor
if [ -e "$(which vim)" ]; then
	export EDITOR='vim'
	export VISUAL='vim'
fi

# ---- Terminal
# INFO: this adds a couple of milliseconds to the shell's startup time
# measured with: time bash -i -c "echo -n" (https://superuser.com/questions/606643/how-to-benchmark-bashrc-zshrc-and-prompt-rendering-time)
# if [ -e "$(which kitty)" ]; then
# 	source <(kitty + complete setup bash)
# fi

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

# -------- Misc
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

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
