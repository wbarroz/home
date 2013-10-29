#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

alias rl_sqlplus='rlwrap sqlplus'
alias rl_rman='rlwrap rman'
alias rl_asmcmd='rlwrap asmcmd'

#alias sqlSystem='sqlplus system/oracle@192.168.1.213/orcl'
#alias sqlSystem='rl_sqlplus system/oracle@192.168.1.213/orcl'
alias sqlOracle='rl_sqlplus system/oracle@192.168.1.213/orcl'
alias sshOracle='ssh -Y oracle@192.168.1.213'

export VBOX_USB=usbfs
export EDITOR="vim"
export PATH=$PATH:/home/wilson/.bin:/home/wilson/builds/ghar/bin
export ORACLE_PATH=/home/wilson/.oracle

man() {
	env LESS_TERMCAP_mb=$'\E[01;31m' \
		LESS_TERMCAP_md=$'\E[01;38;5;74m' \
		LESS_TERMCAP_me=$'\E[0m' \
		LESS_TERMCAP_se=$'\E[0m' \
		LESS_TERMCAP_so=$'\E[38;5;246m' \
		LESS_TERMCAP_ue=$'\E[0m' \
		LESS_TERMCAP_us=$'\E[04;38;5;146m' \
		man "$@"
}

## Modified commands ## {{{
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'
# }}}

## New commands ## {{{
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep'         # requires an argument
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias pgg='ps -Af | grep'           # requires an argument
alias ..='cd ..'
# }}}

# Privileged access
if [ $UID -ne 0 ]; then
	alias sudo='sudo '
	alias scat='sudo cat'
	alias svim='sudoedit'
	alias root='sudo -s'
	alias reboot='sudo systemctl reboot'
	alias poweroff='sudo systemctl poweroff'
	alias update='sudo pacman -Su'
	alias netctl='sudo netctl'
fi

## ls ## {{{
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
# }}}

## Safety features ## {{{
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file
# safer alternative w/ timeout, not stored in history
alias rm=' timeout 3 rm -Iv --one-file-system'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cls=' echo -ne "\033c"'       # clear screen for real (it does not work in Terminology)
# }}}

## Make Bash error tolerant ## {{{
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias cd..='cd ..'
# }}}

## Pacman aliases ## {{{
#if necessary, replace 'pacman' with your favorite AUR helper and adapt the commands accordingly
#alias pac="sudo /usr/bin/pacman -S"		# default action	- install one or more packages
#alias pacu="/usr/bin/pacman -Syu"		# '[u]pdate'		- upgrade all packages to their newest version
#alias pacr="sudo /usr/bin/pacman -Rs"		# '[r]emove'		- uninstall one or more packages
#alias pacs="/usr/bin/pacman -Ss"		# '[s]earch'		- search for a package using one or more keywords
#alias paci="/usr/bin/pacman -Si"		# '[i]nfo'		- show information about a package
#alias paclo="/usr/bin/pacman -Qdt"		# '[l]ist [o]rphans'	- list all packages which are orphaned
#alias pacc="sudo /usr/bin/pacman -Scc"		# '[c]lean cache'	- delete all not currently installed package files
#alias paclf="/usr/bin/pacman -Ql"		# '[l]ist [f]iles'	- list all files installed by a given package
#alias pacexpl="/usr/bin/pacman -D --asexp"	# 'mark as [expl]icit'	- mark one or more packages as explicitly installed 
#alias pacimpl="/usr/bin/pacman -D --asdep"	# 'mark as [impl]icit'	- mark one or more packages as non explicitly installed

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
#alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rs \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"
# }}}


export TERM="screen-256color"
alias tmux="tmux -2"

source /usr/share/doc/pkgfile/command-not-found.bash
shopt -s checkwinsize

#PROMPT_COMMAND='history -a;echo -en "\033[m\033[38;5;2m"$(( $(sed -nu "s/MemFree:[\t ]\+\([0-9]\+\) kB/\1/p" /proc/meminfo)/1024))"\033[38;5;22m/"$(($(sed -nu "s/MemTotal:[\t ]\+\([0-9]\+\) kB/\1/Ip" /proc/meminfo)/1024 ))MB"\t\033[m\033[38;5;55m$(< /proc/loadavg)\033[m"'
#PS1='\[\e[m\n\e[1;30m\][$$:$PPID \j:\!\[\e[1;30m\]]\[\e[0;36m\] \T \d \[\e[1;30m\][\[\e[1;34m\]\u@\H\[\e[1;30m\]:\[\e[0;37m\]${SSH_TTY} \[\e[0;32m\]+${SHLVL}\[\e[1;30m\]] \[\e[1;37m\]\w\[\e[0;37m\] \n($SHLVL:\!)\$ '
#PROMPT_COMMAND='es=$?; [[ $es -eq 0 ]] && unset error || error=$(echo -e "\e[1;41m $es \e[40m")'
#PS1="${error} ${PS1}"
#return value visualisation
PS1="\[\033[01;37m\]\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\];)\"; else echo \"\[\033[01;31m\];(\"; fi) $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$\[\033[00m\] "

export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R '
. ~/builds/ghar/ghar-bash-completion.sh
