# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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
    xterm|xterm-color|*-256color) color_prompt=yes;;
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

if [ "$color_prompt" = yes ]; then
    if [[ ${EUID} == 0 ]] ; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
    else
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h \w \$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tl='cd /opt/telsiz'
alias tlinit='source /opt/telsiz/configs/init.sh'
alias stm='cd /opt/stm'
alias h='function hdi(){ howdoi $* -c -n 5; }; hdi'
alias ha='function hdia(){ howdoi $* -c -n 5 -a; }; hdia'
alias vimium='more ~/vimiumhelp'
alias gitst='git status -s -b '
alias gitstv='git status -v -b -uno'
alias batprtcon='sudo tpacpi-bat -v -s ST 0 70; sudo tpacpi-bat -v -s SP 0 80; sudo tlp-stat -b'
alias batprtcoff='sudo tpacpi-bat -v -s ST 0 0; sudo tpacpi-bat -v -s SP 0 0; sleep 1; sudo tlp-stat -b'
findin () {
	find . -exec grep -i $1 2>/dev/null {} \; -print
}
alias edu='cd ~/edu; cat todo'

h2d () {
    printf "%03d\n" `echo "obase=10; ibase=16; $1" | bc`
}
d2h () {
    printf "0x%02X\n" $1
}
h2b () {
    printf "b%08d\n" `echo "obase=2; ibase=16; $1" | bc`
}
d2b () {
    printf "b%08d\n" `echo "obase=2; ibase=10; $1" | bc`
}
b2h () {
    printf "0x%02X\n" `echo "obase=10; ibase=2; $1" | bc`
}
b2d () {
    printf "%03d\n" `echo "obase=10; ibase=2; $1" | bc`
}

cdd()
{
    if [ -z "$1" ]; then
        cd ..
    else
        cd `ls -la | grep -P '^d' | grep -v -P '[\.]+$' | awk '{print $9}' | sed -n "$1"'p'`
    fi
    cdi
}
cdi()
{
    ls -la | grep -P '^d' | grep -v -P '[\.]+$' | awk '{print "\033[0;32m"NR"\033[0m: " $9}'
}

mp3towav(){
        [[ $# -eq 0 ]] && { echo "mp3wav mp3file"; exit 1; }
        for i in "$@"
        do
            # create .wav file name
            local out="${i%/*}.wav"
            [[ -f "$i" ]] && { echo -n "Processing ${i}..."; mpg123 -w "${out}" "$i" &>/dev/null  && echo "done." || echo "failed."; }
        done    
}

wav2opus(){
        [[ $# -eq 0 ]] && { echo "wav2opus wavfile"; exit 1; }
        for i in "$@"
        do
            # create .opus file name
            local out="${i%/*}.opus"
            [[ -f "$i" ]] && { echo -n "Processing ${i}..."; opusenc --bitrate 8 "$i" "${out}" &>/dev/null  && echo "done." || echo "failed."; }
        done    
}

duu(){
    sudo du -h -d "$1" > /tmp/size; ll -hS | awk '{print $5"\t"$9}' >> /tmp/size; cat /tmp/size | grep -P '^[0-9,.]+[G]' | sort -t, -n -r; cat /tmp/size | grep -P '^[0-9,.]+[M]' | sort -t, -n -r; rm /tmp/size
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias youtube-dl360="youtube-dl -f 'bestvideo[height<=480]+bestaudio/best[height<=480]'"
alias youtube-opus="youtube-dl --audio-format opus --audio-quality 7 -x"
alias youtube-mp3="youtube-dl --audio-format mp3 --audio-quality 7 -x"
alias iha="sshpass -p raspberry ssh pi@192.168.1.10"
alias com="picocom --omap=crcrlf -s 'ascii-xfr -s' -v 'ascii-xfr -r' -b"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
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

if [ -x /usr/bin/mint-fortune ]; then
     /usr/bin/mint-fortune
fi

export PATH=/usr/java/jre1.8.0_151/bin/:$PATH
export PATH=/usr/local/texlive/2018/bin/x86_64-linux:$PATH
echo TODO:
cat ~/todo

printf "\e[?2004l"
